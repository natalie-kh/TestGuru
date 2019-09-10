class AddCorrectToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_column :answers, :correct, :boolean
    change_column_default :answers, :correct, false
  end
end
