module Types
    class DecisionSpaceType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: false
      field :created_by, UserType, null: true, method: :user
      field :goals, [GoalType], null: true, method: :goals
      field :criteria, [CriteriumType], null: true, method: :criteria
      field :pairwise_comparison, [PairwiseComparisonType], null: true, method: :pairwise_comparisons
    end
end