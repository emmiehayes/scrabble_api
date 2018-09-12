class Word 

  def initialize(word)
    @word = word 
  end 

  def validate  
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["app_key"] = ENV["api_key"]
      faraday.headers["app_id"] = ENV["app_id"]
      faraday.headers["accept"] = "application/json"
      faraday.adapter Faraday.default_adapter
    end
    @conn.get("/inflections/{source_lang}/{word_id}") 
    dictionary_word = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def source_lang
    'en'
  end

  def word_id
    @word
  end
end