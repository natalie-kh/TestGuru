class AddTestToAnswers < ActiveRecord::Migration[6.0]
  def change
    add_reference :answers, :test, foreign_key: true
  end
end
