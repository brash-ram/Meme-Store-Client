# API

> Current revision is 0.1.0-wip

Subtyping is written using the `<:` operator: `Apple <: Fruit`.
This notation will make this text shorter (and *slightly* more formal).

## Enums

### TenantRole \<: Enum\<uint\>

By default tenant have almost no access (e.g. banned tenant have no
modification capabilities).

Enum `uint` with following values:
- `0` - anonymous guest a.k.a. unauthorized user.
- `1` - authorized user with default capabilities set (read-only access).
- `2` - private uploader: allows uploading of private assets.
- `3` - public uploader: allows uploading of public assets.
- `4` - voter: allows affect voting on tags.
- `5` - tag assigner: allows voting (assigning) for a new tag.
- `6` - tag creator: allows creating new tags.
- `7` - private album creator: allows creating private albums (and deletion of
  owned private albums).
- `8` - public album creator: allows creating public albums (and deletion of
  owned public albums).
- `256` - global admin.
- `257` - debug view, this role must only provide access to debug data.
- `258` - tag vote moderator: allows tag vote deletion.
- `259` - tag moderator: allows deletion of tags and associated votes.
- `260` - uploads moderator: allows edit and deletion of accessible assets.
- `261` - public album moderator: allows edit and deletion of public albums.
- `262` - private album moderator: allows edit, view and deletion of private
  albums.

### AssetType \<: Enum\<string\>

Enum `string` with following values:
- `"image"` - image asset

### VoteType \<: Enum\<uint\>

Enum `uint` with following values:
- `0` - down vote
- `1` - up vote

## Objects

> Editor note:
> Some objects may have seemingly unnecessary inheritance, but such choice is
> made to allow future reusability of object definitions and generally make
> API easier to extend with new capabilities.

There are following objects in API, __all fields are required__ unless explicitly
stated otherwise.

### BlurHash \<: string

Is a `string` blur hash as described by [BlurHash](https://blurha.sh/) spec.

Example:

```json5
"LKN]Rv%2Tw=w]~RBVZRi};RPxuwH"
```


### ModelObject

Generic supertype for all objects that have an ID in form of unsigned integer.

Example:

```json5
{
	"id": 0, // uint
}
```

Where:

- `id` is unsigned integer ID of object.


### Tenant \<: [ModelObject](#modelobject)

Tenant is used to work work with authorization and perform actions on behalf of
user.

It must be noted that __[Tenant](#tenant--modelobject) is NOT necessary a
[Person](#person--modelobject)__.

First is used to __interact__ with the system, the other is to display a public
profile of an entity.

__There is exist a `Guest` tenant__. It is required for anonymous iterations,
such as updating views counts.

> Editor note:
> This separation allows to make a public entities that are not a physical user
> and act on their behalf e.g. communities governed by multiple users.
>
> API implementers must pay attention to roles view access, as not all tenant
> roles are visible for other tenants. 

Example:

```json5
{
	"roles": [ 0, ], // Array<TenantRole>
	"display_name": "string",
	"unique_name": "string",
	"is_restricted": false,
	"extremist_date": 0, // optional: unix ts
	"foreign_agent_date": 0, // optional: unix ts
}
```

Where

- `roles` is an array of unsigned integer enums of type
  [`TenantRole`](#tenantrole--enumuint). Tenant may not have access to view all
  of available roles, e.g. non admin tenant examines another tenant.
- `display_name` is a string used to display a tenant name.
- `unique_name` is unique tenet name.
- `is_restricted` is a boolean indicating that tenant has any restrictions
  (a.k.a. bans).
- `extremist_date` is an optional UNIX timestamp indicating that tenant
  has been listed in [list of extremist materials](https://minjust.gov.ru/ru/extremist-materials/) by Ministry of Justice of Russian Federation.
  > Editor note: for users from Russia, this hides any tenant's associated
  > galleries.
- `foreign_agent_date` is an optional UNIX timestamp indicating that tenant
  has been listed in [registry of foreign agents](https://minjust.gov.ru/ru/activity/directions/998/) by Ministry of Justice of Russian Federation.


### TenantProfile \<: [Tenant](#tenant--modelobject)

Tenant public profile.

Example:

```json5
{
	"public_galleries": [ 0, ], // Array<uint>
	"private_galleries": [ 0, ], // Array<uint>
}
```

Where

- `public_galleries` is an `Array` of unsigned integer IDs of associated
  public [`Galleries`](#gallery--modelobject).
- `private_galleries` is an `Array` of unsigned integer IDs of associated
  private [`Galleries`](#gallery--modelobject).


### Meme \<: [ModelObject](#modelobject)

Object describing a single unit of [gallery](#gallery--modelobject).

Example:

```json5
{
	"author_id": 0, // uint
	"asset_id": 0, // uint
	"tag_ids": [ 0, ], // Array<uint>
	"title": "string",
	"description": "string", // Reserved for future
}
```

Where:

- `author_id` is unsigned integer ID of author [`User`](#user--modelobject).
- `asset_id` is unsigned integer ID of associated [`Asset`](#asset--modelobject).
- `tag_ids` is an `Array` of unsigned integer IDs of associated
  [`Tag`](#tag--modelobject)s.
- `title` is a string title of the meme.
- `description` is a string value reserved for future use.


### Asset \<: [ModelObject](#modelobject)

Generic asset base type.

Example:

```json5
{
	"type": "string", // enum AssetType
	"blurhash": "string", // BlurHash
}
```

Where:

- `type` is a string enum of type [`AssetType`](#assettype--enumstring).
- `blurhash` is a string [`BlurHash`](#blurhash--string) for asset preview.


### Image \<: [Asset](#asset--modelobject)

Image asset with a single quality level.
Image is accessible though WWW and MIME type is provided via appropriate HTTP
header.

> Editor note:
> `uri` is chosen over `url` to make it possible to extend for custom storages
> in future, e.g. Amazon S3 `s3://example-bucket/path/to/object`, or local
> `file:///path/to/object`.

Example:

```json5
{
	"uri": "string",
}
```

Where:

- `uri` is a string URI that points to target image asset, must have `http` or
  `https` scheme.


### Tag \<: [ModelObject](#modelobject)

Generic tag object.

Example:

```json5
{
	"name": "string",
}
```

Where

- `name` is a string name of this tag.


### MemeTag \<: [Tag](#tag--modelobject)

Tag instance associated with an individual [Meme](#meme--modelobject).

Example:

```json5
{
	"meme_id": 0, // uint
	"score": 0, // int
	"my_vote": 0, // optional: enum VoteType
}
```

Where

- `meme_id` is unsigned integer ID of associated [`Meme`](#meme--modelobject).
  > Editor note: This is required to make Tag object's data sufficient to
  > update it.
- `score` is an integer indicating score of this tag application.
- `my_vote` is an optional integer enum of type
  [`VoteType`](#votetype--enumuint). This field is omitted if user haven't
  voted for a tag, or in guest access.


### Person \<: [Tenant](#tenant--modelobject)

Person is an object defining public part of a tenant it can be used to display
user reference e.g. author.

> Editor note: In current design fully inherits Tenant.


### PersonProfile \<: [TenantProfile](#tenantprofile--tenant)

Person's public profile.

> Editor note: In current design fully inherits TenantProfile.


### Gallery \<: [ModelObject](#modelobject)

Gallery of [`Meme`](#meme--modelobject)s

```json5
{
	"owner_id": 0, // uint
	"contributor_ids": [ 0, ], // Array<uint>
	"name": "string",
	"description": "string",
	"is_owned_by_extremist": false,
	"can_edit": false,
}
```

Where:

- `owner_id` is unsigned integer ID of associated
  [`Tenant`](#tenant--modelobject) owner.
- `contributor_ids` is an array of unsigned integer IDs of 
  [`Tenant`](#tenant--modelobject)s contributors.
- `name` is a string name of gallery.
- `description` is a string description of gallery.
- `is_owned_by_extremist` is a boolean flag indicating that associated owner
  [`Tenant`](#tenant--modelobject) owner has been listed as extremist.
  > Editor note: For users from Russia this will prevent further loading
  > of gallery.
- `can_edit` is a boolean flag indicating that current tenant has edit access
  to this gallery.

### Endpoints

TBD
