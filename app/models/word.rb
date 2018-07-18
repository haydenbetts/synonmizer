class Word < ActiveRecord::Base
    belongs_to :synonym_tweet
    has_many :senses

    def return_senses
        sense_locater = OxfordAPIConnector.new
        sense_locater.connect(self.text)

        if sense_locater.error
            false
        else
            Sense.create_from_hash(sense_locater.parsed_senses)
        end

    end
end