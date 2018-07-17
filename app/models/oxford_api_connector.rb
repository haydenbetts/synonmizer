require 'faraday'

class OxfordAPIConnector
    
    def parsed_senses
        @parsed_senses
    end

    def connect(word)

        begin

            @resp = Faraday.get "https://od-api.oxforddictionaries.com:443/api/v1/entries/en/#{word}/synonyms" do |req|
                req.headers['app_id'] = ENV['OXFORD_APP_ID']
                req.headers['app_key'] = ENV['OXFORD_APP_KEY']
                req.headers['Accept'] = 'application/json'
                req.options.timeout = 20
            end

            body = JSON.parse(@resp.body)

            senses_hash = body["results"][0]["lexicalEntries"][0]["entries"][0]["senses"]

            parsed_senses = {}

            senses_hash.each do |single_sense| 
                sense_name = single_sense["examples"][0]["text"]
                parsed_senses[sense_name] = single_sense["synonyms"].collect do |synonym|
                    synonym["text"]
                end
            end
    
            parsed_senses
        
        rescue NoMethodError
            @error = "No synonyms found"
        rescue Faraday::ConnectionFailed
            @error = "There was a timeout. Please try again."
        end
    end

end