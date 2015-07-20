require 'spec_helper'

describe JSONAPI::Resources::Filterer do
  it 'has a version number' do
    expect(JSONAPI::Resources::Filterer::VERSION).not_to be nil
  end

  describe "#filterer_class" do
    it 'returns the corresponding filterer class' do
      expect(BookResource.filterer_class).to eq BookFilterer
    end

    context 'if the if the resource is namespaced' do
      it 'returns the filterer class it finds' do
        expect(Api::V2::BookResource.filterer_class).to eq BookFilterer
      end
    end
  end

  describe 'including this module' do
    let(:contact_class) do
      class ContactResource < JSONAPI::Resource
        include JSONAPI::Resources::Filterer
      end
      # TODO
      # ContactResource = Class.new(JSONAPI::Resource) do
      #   include JSONAPI::Resources::Filterer
      # end
    end
    it 'adds the filterer_class as the _filterer' do
      # TODO Stuck here because errors out on self.name
      contact_class
    end
  end

  # context 'when included' do
  #   it 'applies JSONAPI filters based on the corresponding filterer class' do
  #     BookResource
  #   end
  # end
  # it 'does something useful' do
  #   expect(false).to eq(true)
  # end
end
