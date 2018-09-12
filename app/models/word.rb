class Word 

  def initialize(word)
    @word = word 
  end 

  def validate
    return "'#{@word}' is not a valid word." if response.status == 404
    return "'#{word_id}' is a valid word and its root form is '#{root_word}'." if dictionary_word.first[:id] == @word
  end

  private

  def root_word 
    dictionary_word.first[:lexicalEntries][0][:inflectionOf][0][:text]
  end

  def dictionary_word  
    JSON.parse(response.body, symbolize_names: true)[:results]
  end
  
  def response 
    conn.get("/api/v1/inflections/#{source_lang}/#{word_id}")
  end

  def conn 
    Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["accept"] = 'application/json'
      faraday.headers["app_id"] = ENV['app_id']
      faraday.headers["app_key"] = ENV['app_key']
      faraday.adapter Faraday.default_adapter
    end
  end

  def source_lang
    'en'
  end

  def word_id
    @word
  end
end