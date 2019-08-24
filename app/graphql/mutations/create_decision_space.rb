module Mutations
    class CreateDecisionSpace < BaseMutation
      # arguments passed to the `resolved` method
      argument :name, String, required: true
      argument :description, String, required: true
  
      # return type from the mutation
      type Types::DecisionSpaceType
  
      def resolve(name: nil, description: nil)
        # If you need an ActiveRecord method to raise an exception
        # instead of a false value in case of failure,
        # you can add ! If you need an ActiveRecord method to raise an exception instead of a false value in case of failure, you can add ! 
        DecisionSpace.create!(
          name: name,
          description: description,
          user: context[:current_user]
        )
      end
    end
end