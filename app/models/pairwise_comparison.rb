class PairwiseComparison < ApplicationRecord
  belongs_to :decision_space
  has_many :judgements
  enum control_node_type: { goal: 0, criterium: 1, sub_criterium: 2, alternative: 3 },  _prefix: :control
  enum subordinate_nodes_type: { goal: 0, criterium: 1, sub_criterium: 2, alternative: 3 }, _prefix: :subordinate
end
