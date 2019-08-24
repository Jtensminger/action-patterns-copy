# We need a way to create users. Users would be created by name, email and password.

module Types
    class PairwiseComparisonInput < BaseInputObject
        # the name is usually inferred by class name but can be overwritten
        graphql_name 'PAIRWISE_JUDGEMENT_INPUT'

        argument :decision_space_id, ID, required: true
        argument :goal_id, Integer, required: false
        
        argument :control_node_type, Types::NodeLayer, required: true
        argument :control_node_id, Integer, required: true
        
        argument :subordinate_nodes_type, Types::NodeLayer, required: true
        argument :subordinate_node_one_id, Integer, required: true
        argument :subordinate_node_two_id, Integer, required: true

#        argument :goal_id, Integer, null: true
#        argument :criterium_one_id, Integer, null: true
#        argument :criterium_two_id, Integer, null: true
#        argument :sub_criterium_one_id, Integer, null: true
#        argument :sub_criterium_two_id, Integer, null: true
#        argument :alternative_one_id, Integer, null: true
#        argument :alternative_two_id, Integer, null: true
    end
end
