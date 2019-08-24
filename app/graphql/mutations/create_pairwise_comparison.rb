module Mutations
    class CreatePairwiseComparison < BaseMutation
      # arguments passed to the `resolved` method

      class PairwiseComparisonData < Types::BaseInputObject
        argument :input, [Types::PairwiseComparisonInput], required: true
      end
    
      argument :pairwise_comparison_input, PairwiseComparisonData, required: true
      # return type from the mutation
      type [Types::PairwiseComparisonType]
  
      def resolve(pairwise_comparison_input: nil)
        # If you need an ActiveRecord method to raise an exception
        # instead of a false value in case of failure,
        # you can add ! If you need an ActiveRecord method to raise an exception instead of a false value in case of failure, you can add !
        
        all_pairwise_comparisons = []
        pairwise_comparisons_input.input.each do |j|
            attributes = {
            goal_id: j.goal_id,
            decision_space_id: j.decision_space_id,
            control_node_type: j.control_node_type,
            control_node_id: j.control_node_id,
            subordinate_nodes_type: j.subordinate_nodes_type,
            subordinate_node_one_id: j.subordinate_node_one_id,
            subordinate_node_two_id: j.subordinate_node_two_id,
            }

            puts j
            all_pairwise_comparisons << PairwiseComparison.create!(attributes)
        end
        all_pairwise_comparisons
      end
    end
end