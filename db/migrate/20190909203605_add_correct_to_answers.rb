class AddCorrectToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :correct, :boolean, column_options: { null: false }
  end
end
