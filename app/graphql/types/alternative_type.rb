module Types
    class AlternativeType < BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: false
      field :decision_space_id, ID, null: false
    end
end