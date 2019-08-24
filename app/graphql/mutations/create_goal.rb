module Mutations
    class CreateGoal < BaseMutation
      # arguments passed to the `resolved` method
      argument :frame, String, required: true
      argument :description, String, required: true
      argument :decision_space_id, ID, required: true
      # return type from the mutation
      type Types::GoalType
  
      def resolve(frame: nil, description: nil, decision_space_id: nil)
        # If you need an ActiveRecord method to raise an exception
        # instead of a false value in case of failure,
        # you can add ! If you need an ActiveRecord method to raise an exception instead of a false value in case of failure, you can add ! 
        Goal.create!(
          frame: frame,
          description: description,
          decision_space_id: decision_space_id
        )
      end
    end
end