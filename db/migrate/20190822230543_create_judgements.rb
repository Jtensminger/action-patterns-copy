class CreateJudgements < ActiveRecord::Migration[5.1]
  def change
    create_table :judgements do |t|
      t.float :preference
      t.bigint :scale_type 
      t.belongs_to :user, foreign_key: true
      t.belongs_to :pairwise_comparison, foreign_key: true
      t.belongs_to :decision_space, foreign_key: true

      t.timestamps
    end
    add_index :judgements, :scale_type
  end
end
