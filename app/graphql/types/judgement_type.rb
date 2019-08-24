module Types
    class JudgementType < BaseObject
        # can not be null
      field :id, ID, null: false
      field :user_id, ID, null: false
      field :decision_space_id, ID, null: false
        # can be null
      field :scale_type, Types::ScaleType, null: false
      field :preference, String, null: false
    end
end