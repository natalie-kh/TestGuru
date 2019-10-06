class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil?
  end

  def passed?
    result_percent >= 85
  end

  def result_percent
    (correct_questions.to_f / questions_count) * 100
  end

  def questions_count
    test.questions.count
  end

  def current_question_number
    test.questions.order(:id).index(current_question).next
  end

  private

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == Array(answer_ids).map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def before_save_set_question
    self.current_question = if new_record?
                              test.questions.first
                            else
                              next_question
                            end
  end
end
