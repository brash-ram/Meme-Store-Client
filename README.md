# Meme store client

## feed

### Get /feed

Query params

- offset
- limit

```json
{
  "images" : [{
    "id" : 0,
    "name" : "",
    "url" : "",
    "tags" : [{
      "id" : 0,
      "name" : ""
    }],
    "isFavorite" : true
  }]
}
```

## meme

### Get /meme

```json
{
  "id" : 0,
  "name" : "",
  "url" : "",
  "tags" : [{
    "id" : 0,
    "name" : ""
  }],
  "isFavorite" : true
  "author" : {
    "id" : 0,
    "name" : "",
    "profileImage" : ""
  }
}
```

### Post /meme

```json
{
  "name" : "",
  "tags" : [{
    "id" : 0,
    "name" : ""
  }],
  "image" : "multipart"
}
```

### Get /meme/tags

```json
{
  "tags" : [{
    "id" : 0,
    "name" : ""
  }]
}
```

## library

### Get /library

Query params

- offset
- limit

```json
{
  "images" : [{
    "id" : 0,
    "name" : "",
    "url" : "",
    "tags" : [{
      "id" : 0,
      "name" : ""
    }],
    "isFavorite" : true
  }]
}
```

## favorite

### Get /favorite

```json
{
  "images" : [{
    "id" : 0,
    "name" : "",
    "url" : "",
    "tags" : [{
      "id" : 0,
      "name" : ""
    }],
    "isFavorite" : true
  }]
}
```

### Post /favorite

```json
{
  "id" : 0,
  "boardId" : 0
}
```

### Get /favorite/boardsList

```json
{
  "id" : 0,
  "name" : ""
  
}
```

### Get /favorite/boards

```json
{
  "id" : 0,
  "name" : "",
  "image" : "url",
  "age" : 0,
  "imageCount" : 0
}
```