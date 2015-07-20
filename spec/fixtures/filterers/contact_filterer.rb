class ContactFilterer < Filterer::Base

  def starting_query
    Contact.all
  end

  def param_first_name(x)
    results.where(first_name: x)
  end

end
