class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.text :description
      t.integer :rule, null: false
      t.string :rule_value, null: false

      t.timestamps
    end
  end
end
