module Types
    class PairwiseComparisonType < BaseObject
        # can not be null
      field :id, ID, null: false
      field :decision_space_id, ID, null: false
        # can be null
      
      field :goal_id, Integer, null: true
      field :control_node_type, Integer, null: true
      field :control_node_id, Integer, null: true
      field :subordinate_nodes_type, Integer, null: true
      field :subordinate_node_one_id, Integer, null: true
      field :subordinate_node_two_id, Integer, null: true
    end
end