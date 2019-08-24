module Types
    class GoalType < BaseObject
      field :id, ID, null: false
      field :frame, String, null: false
      field :description, String, null: false
      field :decision_space_id, ID, null: false
    end
end