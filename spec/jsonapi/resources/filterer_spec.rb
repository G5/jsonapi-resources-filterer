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
      expect(PersonResource.filterer_class).to be_nil
    end
  end

  describe "allowing filters", type: :resource do
    let(:contact) { Contact.new }
    subject(:resource) { ContactResource.new(contact) }
    it { is_expected.to filter(:first_name) }
    it { is_expected.to_not filter(:last_name) }
  end

  it "integrates the filterer class" do
    book_1 = Book.create(title: "A")
    book_2 = Book.create(title: "B")
    book_3 = Book.create(title: "C")

    # NOTE: test .apply_filter directly until we find a way to test the resource
    results = BookResource.apply_filter(Book.all, :title, "B", {})
    expect(results).to match_array([book_2])
  end

end
