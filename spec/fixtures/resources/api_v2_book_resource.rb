module Api
  module V2
    class BookResource < JSONAPI::Resource
      include JSONAPI::Resources::Filterer

      attributes(
        :title,
        :author,
        :pages,
        :published_at,
      )
    end
  end
end
