class CreateDecisionSpaces < ActiveRecord::Migration[5.1]
  def change
    create_table :decision_spaces do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
