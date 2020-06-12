class TimeZone < ApplicationRecord
    has_many :utcs

    accepts_nested_attributes_for :utcs
end
