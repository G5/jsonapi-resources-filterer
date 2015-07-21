class PersonResource < JSONAPI::Resource
  include JSONAPI::Resources::Filterer
  filters :first_name
end
