module Mutations
    class CreateAlternative < BaseMutation
      # arguments passed to the `resolved` method

      class AlternativeData < Types::BaseInputObject
        argument :input, [Types::AlternativeInput], required: false
      end
    
      argument :alternative_input, AlternativeData, required: true
      # return type from the mutation
      type [Types::AlternativeType]
  
      def resolve(alternative_input: nil)
        # If you need an ActiveRecord method to raise an exception
        # instead of a false value in case of failure,
        # you can add ! If you need an ActiveRecord method to raise an exception instead of a false value in case of failure, you can add !
        all_alternatives = []
        alternative_input.input.each do |c|
            all_alternatives << Alternative.create!(
                name: c.name,
                description: c.description,
                decision_space_id: c.decision_space_id
              )
        end
        return all_alternatives
      end
    end
end