class BookFilterer < Filterer::Base

  def param_title(x)
    results.where(title: x)
  end

end
