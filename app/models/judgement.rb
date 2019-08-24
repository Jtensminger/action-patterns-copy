class Judgement < ApplicationRecord
  belongs_to :user
  belongs_to :pairwise_comparison
  belongs_to :decision_space

  
  enum scale_type: { saaty: 0, index: 1 }
  
end
