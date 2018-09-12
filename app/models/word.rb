class Word 

  def initialize(word)
    @word = word 
  end 

  def validate
    if call.first[:id] == @word
      "'#{word_id}' is a valid word and its root form is '#{root_word}'." 
    else 
      "#{@word} is not a valid word."
    end
  end

  def root_word 
    call.first[:lexicalEntries][0][:inflectionOf][0][:text]
  end

  def call  
    @conn = Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers["accept"] = 'application/json'
      faraday.headers["app_id"] = ENV['app_id']
      faraday.headers["app_key"] = ENV['app_key']
      faraday.adapter Faraday.default_adapter
    end
    response = @conn.get("/api/v1/inflections/#{source_lang}/#{word_id}")
    dictionary_word = JSON.parse(response.body, symbolize_names: true)[:results]
  end

  def source_lang
    'en'
  end

  def word_id
    @word
  end
end