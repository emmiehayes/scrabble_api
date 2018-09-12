class SearchPresenter 

  def initialize(search_params)
    @word = search_params[:word].downcase
  end

  def validation 
    word_object = Word.new(@word)
    word_object.validate
  end
end