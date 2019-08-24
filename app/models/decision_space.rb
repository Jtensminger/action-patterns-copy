class DecisionSpace < ApplicationRecord
    belongs_to :user
    has_many :criteria
    has_many :sub_criteria, through: :criteria
    has_many :alternatives
    has_many :goals
    has_many :pairwise_comparisons
    has_many :judgements
end
