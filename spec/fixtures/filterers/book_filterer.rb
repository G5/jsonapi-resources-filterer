class BookFilterer < Filterer::Base

  def param_title(x)
    results.where(title: x)
  end

  def param_author_first_name(x)
    results.joins(:author).where(people: {first_name: x})
  end

end
