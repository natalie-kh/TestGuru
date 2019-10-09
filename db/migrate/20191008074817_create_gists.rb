class CreateGists < ActiveRecord::Migration[6.0]
  def change
    create_table :gists do |t|
      t.references :question, null: false, foreign_key: true
      t.references :author, foreign_key: { to_table: :users }, null: false
      t.string :url

      t.timestamps
    end
  end
end
