class CreateSubCriteria < ActiveRecord::Migration[5.1]
  def change
    create_table :sub_criteria do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
