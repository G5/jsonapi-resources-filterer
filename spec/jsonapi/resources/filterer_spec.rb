require 'spec_helper'

describe JSONAPI::Resources::Filterer do
  it 'has a version number' do
    expect(JSONAPI::Resources::Filterer::VERSION).not_to be nil
  end

  describe "#filterer_class" do
    it 'returns the corresponding filterer class' do
      expect(BookResource.filterer_class).to eq BookFilterer
      expect(ContactResource.filterer_class).to eq ContactFilterer
      expect(Api::V2::BookResource.filterer_class).to eq Api::V2::BookFilterer
    end
  end

end
