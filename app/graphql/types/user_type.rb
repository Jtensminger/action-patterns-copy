module Types
    class UserType < BaseObject
        field :id, ID, null: false
        field :name, String, null: false
        field :email, String, null: false #REMOVE - This shouldn't be exposed for everyone.
    end
end