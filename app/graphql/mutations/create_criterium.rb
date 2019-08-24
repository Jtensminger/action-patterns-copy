module Mutations
    class CreateCriterium < BaseMutation
      # arguments passed to the `resolved` method

      class CriteriumData < Types::BaseInputObject
        argument :input, [Types::CriteriumInput], required: false
      end
    
      argument :criterium_input, CriteriumData, required: true
      # return type from the mutation
      type [Types::CriteriumType]
  
      def resolve(criterium_input: nil)
        # If you need an ActiveRecord method to raise an exception
        # instead of a false value in case of failure,
        # you can add ! If you need an ActiveRecord method to raise an exception instead of a false value in case of failure, you can add !
        all_criteria = []
        criterium_input.input.each do |c|
            all_criteria << Criterium.create!(
                name: c.name,
                description: c.description,
                decision_space_id: c.decision_space_id
              )
        end
        return all_criteria
      end
    end
end