class Criterium < ApplicationRecord
    belongs_to :decision_space
    has_many :sub_criteria
end
