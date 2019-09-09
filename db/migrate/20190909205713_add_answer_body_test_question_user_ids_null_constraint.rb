class AddAnswerBodyTestQuestionUserIdsNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :test_id, false)
    change_column_null(:answers, :question_id, false)
    change_column_null(:answers, :user_id, false)
  end
end
