class ContactFilterer < Filterer::Base

  def starting_query
    Contact.all
  end

end
