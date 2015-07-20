class BookResource < JSONAPI::Resource
  include JSONAPI::Resources::Filterer

  attributes(
    :title,
    :author,
    :pages,
    :published_at,
  )
end
