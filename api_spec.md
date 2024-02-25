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
- `263` - user tenant moderator: allows edit of user tenants.
- `264` - allows deletion of user tenants. 
- `265` - (service) create user tenants: allows creation of user tenants.
- `266` - (service) authorize user tenants: allows creation of user tenants.

### TenantType \<: Enum\<string\>

Enum `string` with following values:
- `"guest"` - guest tenant.
- `"user"` - user tenant.
- `"service"` - service tenant, used for example by integrated systems, such as
  external registration.

### TenantOrigin \<: Enum\<string\>

Enum `string` with following values:
- `"internal/system"` - tenant of internal origin. Such tenants mostly an
  artificial entities created as part of internal API implementation.
- `"internal/user"` - tenant created via internal user registration.
- `"internal/service"` - tenant created for service integration.
- `"external/tg"` - tenant created via external registration provider: Telegram.

### AssetType \<: Enum\<string\>

Enum `string` with following values:
- `"image"` - image asset.

### VoteType \<: Enum\<uint\>

Enum `uint` with following values:
- `0` - down vote.
- `1` - up vote.

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
	"type": "string", // TenantType
	"origin": "string", // TenantOrigin
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
- `type` is an enum of [`TenantType`](#tenanttype--enumstring) indicating type
  of tenant.
- `origin` is an enum of type [`TenantOrigin`](#tenantorigin--enumstring) indicating origin.
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
	"public": false,
	"owned_by_extremist": false,
	"current_tenant_can_edit": false,
}
```

Where:

- `owner_id` is unsigned integer ID of associated
  [`Tenant`](#tenant--modelobject) owner.
- `contributor_ids` is an array of unsigned integer IDs of 
  [`Tenant`](#tenant--modelobject)s contributors.
- `name` is a string name of gallery.
- `description` is a string description of gallery.
- `public` is a boolean flag indicating whether gallery is public or private.
- `owned_by_extremist` is a boolean flag indicating that associated owner
  [`Tenant`](#tenant--modelobject) owner has been listed as extremist.
  > Editor note: For users from Russia this will prevent further loading
  > of gallery.
- `current_tenant_can_edit` is a boolean flag indicating wether current tenant
  has edit access to this gallery.

## Endpoints

### General response

User authorization is handled via any of the following ways:

* `X-API-Token` HTTP header.
* `x_api_token` HTTP cookie.
* `token` HTTP GET parameter.

All API endpoints return results in following form:

```json5
{
	"error": false,
	"result": null,
	"related": {}, // optional
}
```

Where:

* `error` is a boolean indicating whether it is an error response.
* `result` is a result of request as described by API endpoint or
  error object details with following format:
  ```json5
  {
  	"code": 0,
  	"message": "string",
  }
  ```
  Where:
  * `code` is an integer error code.
  * `message` is a string message of an occurred error.
* `related` is optional object with related objects.
  > Editor note: TODO add format for related objects.

### (Service) External tenants

This is an API for external registration that is exposed only to integrated
services.

Used tenant defines type of managed tenants.

> [!Warning]
> **Requires service tenant**.

----
#### `POST` `/service/external_user/create`

Creates new managed user tenant.

**Body**:

```json5
{
	"display_name": "string",
	"unique_name": "string",
}
```

**Returns:**

* [`Tenant`](#tenant--modelobject).

---
#### `PUT` `/service/external_user/<id>`

Edit managed user tenant.

**URI parameters**:

* `id` is an ID of managed [`Tenant`](#tenant--modelobject).

**Body**:

```json5
{
	"display_name": "string",
	"unique_name": "string",
}
```

**Returns:**

* [`Tenant`](#tenant--modelobject).

----
#### `POST` `/service/external_user/<id>/auth`

Issue authorization token for managed tenant.

> Editor note:
>
> This method issues token without any checks except for wether user is managed
> by corresponding service tenant.
> Any service API should be guarded, but this method is especially dangerous
> and API implementers should take notice.

**URI parameters**:

* `id` is an ID of managed [`Tenant`](#tenant--modelobject) to be authorized.

**Returns:**

* String token to be used to impersonate tenant.

### Galleries

For every user tenant there must be a special synthetic galleries:

* `-100` - recycle bin. Private gallery for deleted memes.
* `-200` - quick uploads/unsorted/misc. Private for gallery for anything.

----
#### `POST` `/gallery/create`

Create a new [`Gallery`](#gallery--modelobject).

**Body**:

* [`Gallery`](#gallery--modelobject)-like object with only following fields
  allowed:
  * `name`
  * `description`
  * `public`

**Returns:**

* [`Gallery`](#gallery--modelobject).

----
#### `GET` `/gallery/<id>`

Retrieve an existing [`Gallery`](#gallery--modelobject).

**URI parameters**:

* `id` is an ID of requested [`Gallery`](#gallery--modelobject).

**Returns**:

* [`Gallery`](#gallery--modelobject).

----
#### `PUT` `/gallery/<id>`

Partially update an existing [`Gallery`](#gallery--modelobject).

**URI parameters**:

* `id` is an ID of [`Gallery`](#gallery--modelobject) needed to be updated.

**Body**:

* [`Gallery`](#gallery--modelobject)-like object with only following fields
  allowed:
  * `name`
  * `description`
  * `public`

**Returns:**

* [`Gallery`](#gallery--modelobject).

----
#### `DELETE` `/gallery/<id>`

Delete an existing [`Gallery`](#gallery--modelobject).

**URI parameters**:

* `id` is an ID of [`Gallery`](#gallery--modelobject) needed to be deleted.

**Returns:**

* boolean flag indicating wether gallery was deleted or not.
  > Editor note: always `true`, otherwise error is raised, e.g. permissions
  > issue.

----
#### `POST` `/gallery/<id>/contributors/add`

Add contributor to an existing [`Gallery`](#gallery--modelobject).

**URI parameters**:

* `id` is an ID of [`Gallery`](#gallery--modelobject) needed to be updated.

**Body**:

* `Array<uint>` is an array of IDs of [`Tenant`](#tenant--modelobject)s to be
  added to gallery as contributors.

**Returns:**

* [`Gallery`](#gallery--modelobject).

----
#### `POST` `/gallery/<id>/contributors/remove`

Remove contributors from an existing [`Gallery`](#gallery--modelobject).

**URI parameters**:

* `id` is an ID of [`Gallery`](#gallery--modelobject) needed to be updated.

**Body**:

* `Array<uint>` is an array of IDs of [`Tenant`](#tenant--modelobject)s to be
  removed from gallery contributors.

**Returns:**

* [`Gallery`](#gallery--modelobject).

### Assets

#### `POST` `/asset/upload`

Upload file for following meme creation.

**Query parameters**:

* `type` is an enum of type [`AssetType`](#assettype--enumstring).

**Body**:

* Asset content.

**Returns:**

* String with temporary asset ticket to be used to create a meme.

#### `POST` `/asset/suggest_tags`

Get tags suggestions for uploaded file.

**Query parameters**:

* `asset` asset ticked obtained via [Asset upload](#post-assetupload).

**Returns:**

* Array of [`Tag`](#tag--modelobject)s.

### Memes

----
#### `POST` `/meme/create`

Create a new [`Meme`](#meme--modelobject).
Non-existing tags are automatically created.

**Query parameters**:

* `asset` asset ticked obtained via [Asset upload](#post-assetupload).
* `gallery_id` is an ID of [`Gallery`](#gallery--modelobject) this meme to be
  added to.

**Body**:

* ```json5
  {
  	"title": "string",
  	"description": "string", // Reserved for future
  	"tags": [ "string", ],
  }
  ```
  > Editor note: Implementers must treat tags array as a list of auto vote tags.

**Returns:**

* [`Meme`](#meme--modelobject).

----
#### `GET` `/meme/<gallery_id>_<id>`

Retrieve an existing [`Meme`](#meme--modelobject).

**URI parameters**:

* `gallery_id` is an ID of [`Gallery`](#gallery--modelobject) this meme is
  accessed via.
  > Editor note: This simplifies access management for API implementers.
* `id` is an ID of requested [`Meme`](#meme--modelobject).

**Returns**:

* [`Meme`](#meme--modelobject).

----
#### `PUT` `/meme/<id>`

Partially update an existing [`Meme`](#meme--modelobject).

**URI parameters**:

* `id` is an ID of [`Meme`](#meme--modelobject) needed to be updated.

**Body**:

* [`Meme`](#meme--modelobject)-like object with only following fields
  allowed:
  * `title`
  * `description`

**Returns:**

* [`Gallery`](#gallery--modelobject).

----
#### `DELETE` `/meme/<gallery_id>_<id>`

Delete an existing [`Meme`](#meme--modelobject).

**URI parameters**:

* `gallery_id` is an ID of [`Gallery`](#gallery--modelobject) this meme is
  accessed via.
* `id` is an ID of [`Meme`](#meme--modelobject).

**Returns:**

* boolean flag indicating wether meme was deleted or not.
  > Editor note: false unless deleted from recycle bin.

----
#### `POST` `/meme/<id>/vote/<tag_id>`

Create a new [`Meme`](#meme--modelobject).
Non-existing tags are automatically created.

**Query parameters**:

* `id` is an ID of [`Meme`](#meme--modelobject).
* `tag_id` is an ID of [`Tag`](#tag--modelobject) you want to vote for.

**Body**:

* ```json5
  {
  	"type": null, // null|VoteType
  }
  ```
  Where:
  * `type` is [`VoteType`](#votetype--enumuint) or `null` if you want to remove
    your vote.

**Returns:**

* [`Meme`](#meme--modelobject).

### Tenants

----
#### `GET` `/tenants/<id>`

Retrieve an existing [`Tenant`](#tenant--modelobject).

**URI parameters**:

* `id` is an ID of requested [`Tenant`](#tenant--modelobject).

**Returns**:

* [`Tenant`](#tenant--modelobject) or it's descendant.

----
#### `GET` `/tenants/<id>/profile`

Retrieve a [`TenantProfile`](#tenantprofile--tenant).

**URI parameters**:

* `id` is an ID of requested [`TenantProfile`](#tenantprofile--tenant).

**Returns**:

* [`TenantProfile`](#tenantprofile--tenant) or it's descendant.
