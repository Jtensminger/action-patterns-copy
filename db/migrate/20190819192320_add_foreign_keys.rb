class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
    change_table :goals do |t|
      t.belongs_to :decision_space
    end

    change_table :alternatives do |t|
      t.belongs_to :decision_space
    end

    change_table :criteria do |t|
      t.belongs_to :decision_space
    end

    change_table :sub_criteria do |t|
      t.belongs_to :criterium
      t.belongs_to :decision_space
    end
  end
end
