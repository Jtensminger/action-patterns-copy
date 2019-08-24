# We need a way to create users. Users would be created by name, email and password.

module Types
    class JudgementInput < BaseInputObject
        # the name is usually inferred by class name but can be overwritten
        graphql_name 'JUDGEMENT_INPUT'

        argument :decision_space_id, ID, required: true
        argument :pairwise_comparison_id, ID, required: true
        argument :scale_type, Types::ScaleType, required: true
        argument :preference, String, required: true
    end
end
