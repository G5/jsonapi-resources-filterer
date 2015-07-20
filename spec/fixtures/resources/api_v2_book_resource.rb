module Api
  module V2
    class BookResource < JSONAPI::Resource
      include Jsonapi::Resources::Filterer

      attributes(
        :title,
        :author,
        :pages,
        :published_at,
      )
    end
  end
end
