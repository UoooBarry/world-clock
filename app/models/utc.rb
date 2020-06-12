class Utc < ApplicationRecord
    belongs_to :time_zone
    def self.search(term)
        where("value ILIKE ?", "%#{term}%").limit(5)
    end
end
