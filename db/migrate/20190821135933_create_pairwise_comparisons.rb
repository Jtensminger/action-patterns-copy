class CreatePairwiseComparisons < ActiveRecord::Migration[5.1]
  def change
    create_table :pairwise_comparisons do |t|
      t.bigint :goal_id
      t.bigint :control_node_type
      t.bigint :control_node_id
      t.bigint :subordinate_nodes_type
      t.bigint :subordinate_node_one_id
      t.bigint :subordinate_node_two_id
      t.belongs_to :decision_space, foreign_key: true
      t.timestamps
    end
    add_index :pairwise_comparisons, :control_node_type
    add_index :pairwise_comparisons, :subordinate_nodes_type
  end
end
