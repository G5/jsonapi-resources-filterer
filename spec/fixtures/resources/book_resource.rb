class BookResource < JSONAPI::Resource
  include Jsonapi::Resources::Filterer

  attributes(
    :title,
    :author,
    :pages,
    :published_at,
  )
end
