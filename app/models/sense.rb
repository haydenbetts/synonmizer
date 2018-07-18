class Sense < ActiveRecord::Base
    belongs_to :word

    self.create_from_hash(senses_hash)
        senses.hash.each do |k, v|
            self.find_or_create_by(text: k)
        end
    end
end