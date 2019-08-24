module Mutations
    class CreateJudgement < BaseMutation
      # arguments passed to the `resolved` method

      class JudgementData < Types::BaseInputObject
        argument :input, [Types::JudgementInput], required: true
      end
    
      argument :judgement_input, JudgementData, required: true
      # return type from the mutation
      type [Types::JudgementType]
  
      def resolve(judgement_input: nil)
        # If you need an ActiveRecord method to raise an exception
        # instead of a false value in case of failure,
        # you can add ! If you need an ActiveRecord method to raise an exception instead of a false value in case of failure, you can add !
        
        all_judgements = []
  
        judgement_input.input.each do |j|
          preference = 0.0000
          if Types::ScaleType.values[j.scale_type.upcase].value == 'saaty'
            preference = Types::SaatyType.values[j.preference].value
          else Types::ScaleType.values[j.scale_type.upcase].value == 'index'
            preference = Types::IndexType.values[j.preference].value
          end

          Types::ScaleType.values[j.scale_type.upcase].value == j.scale_type
          #puts Types::ScaleType.values[j.scale_type.upcase].value == j.scale_type
            attributes = {
                decision_space_id: j.decision_space_id,
                preference: preference,
                scale_type: j.scale_type,
                pairwise_comparison_id: j.pairwise_comparison_id,
                user: context[:current_user],
            }
            all_judgements << Judgement.create!(attributes)
        end
        all_judgements
      end
    end
end