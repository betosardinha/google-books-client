# Volumes

## `show`
- Returns a Volume resource based on the ID.
- **Parameters**:
  - `volume_id`: The ID of the volume to be returned (mandatory).

```ruby
GoogleBooksClient::Resources::Volumes.show('id')
```

## `list`
- Returns a list of Volume resources based on the parameters.
- **Parameters**:
  - `params`: The params query to be used in the search (mandatory).

```ruby
GoogleBooksClient::Resources::Volumes.list({ q: 'inauthor:tolkien+intitle:lord', startIndex: 0 })
```

## `list_by_query`
- Returns a list of Volume resources based on the query.
- **Parameters**:
  - `query`: The query to be used in the search (mandatory).
  - `start_index`: The index of the first result to return (optional, default: 0).
  - `params`: Extra params to be used in the search (optional, default: {}).

```ruby
GoogleBooksClient::Resources::Volumes.list_by_query('inauthor:tolkien+intitle:lord', start_index: 0)
```

## `list_volumes`
- Returns a list of Volume resources based on a search hash.
- **Parameters**:
  - `search_hash`: The search hash to be used in the search (mandatory).
  - `start_index`: The index of the first result to return (optional, default: 0).
  - `params`: Extra params to be used in the search (optional, default: {}).

```ruby
GoogleBooksClient::Resources::Volumes.list_volumes({ title: 'lord', author: 'tolkien' })
```

```ruby
# search_hash available parameters
{
  title: 'lord',
  author: 'tolkien',
  publisher: 'harper',
  subject: 'fantasy',
  isbn: '9788532516264',
  lccn: '2001025331',
  oclc: '123456789',
}
```

## `list_by_title`
- Returns a list of Volume resources based on the title.
- **Parameters**:
  - `title`: The title to be used in the search (mandatory).
  - `start_index`: The index of the first result to return (optional, default: 0).
  - `params`: Extra params to be used in the search (optional, default: {}).

```ruby
GoogleBooksClient::Resources::Volumes.list_by_title('lord')
```

## `list_by_author`
- Returns a list of Volume resources based on the author.
- **Parameters**:
  - `author`: The author to be used in the search (mandatory).
  - `start_index`: The index of the first result to return (optional, default: 0).
  - `params`: Extra params to be used in the search (optional, default: {}).

```ruby
GoogleBooksClient::Resources::Volumes.list_by_author('tolkien')
```

## `list_by_publisher`
- Returns a list of Volume resources based on the publisher.
- **Parameters**:
  - `publisher`: The publisher to be used in the search (mandatory).
  - `start_index`: The index of the first result to return (optional, default: 0).
  - `params`: Extra params to be used in the search (optional, default: {}).

```ruby
GoogleBooksClient::Resources::Volumes.list_by_publisher('harper')
```

## `list_by_subject`
- Returns a list of Volume resources based on the subject.
- **Parameters**:
  - `subject`: The subject to be used in the search (mandatory).
  - `start_index`: The index of the first result to return (optional, default: 0).
  - `params`: Extra params to be used in the search (optional, default: {}).

```ruby
GoogleBooksClient::Resources::Volumes.list_by_subject('fantasy')
```

## `list_by_isbn`
- Returns a list of Volume resources based on the ISBN.
- **Parameters**:
  - `isbn`: The ISBN to be used in the search (mandatory).
  - `params`: Extra params to be used in the search (optional, default: {}).

```ruby
GoogleBooksClient::Resources::Volumes.list_by_isbn('9788532516264')
```

## `list_by_lccn`
- Returns a list of Volume resources based on the LCCN.
- **Parameters**:
  - `lccn`: The LCCN to be used in the search (mandatory).
  - `params`: Extra params to be used in the search (optional, default: {}).

```ruby
GoogleBooksClient::Resources::Volumes.list_by_lccn('2001025331')
```

## `list_by_oclc`
- Returns a list of Volume resources based on the OCLC.
- **Parameters**:
  - `oclc`: The OCLC to be used in the search (mandatory).
  - `params`: Extra params to be used in the search (optional, default: {}).

```ruby
GoogleBooksClient::Resources::Volumes.list_by_oclc('123456789')
```