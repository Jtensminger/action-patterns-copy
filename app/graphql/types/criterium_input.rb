# We need a way to create users. Users would be created by name, email and password.

module Types
    class CriteriumInput < BaseInputObject
        # the name is usually inferred by class name but can be overwritten
        graphql_name 'CRITERIUM_INPUT'

        argument :name, String, required: true
        argument :description, String, required: true
        argument :decision_space_id, ID, required: true
    end
end
