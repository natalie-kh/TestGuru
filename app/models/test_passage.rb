class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_question

  scope :by_date, ->(date) { where('updated_at > ?', date) }
  scope :success, -> { where(passed: true) }

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

  def expired?
    return false if test.timer.nil?
    expiration_date < Time.current
  end

  def timeleft
    (expiration_date - Time.current).to_i
  end

  def update_passed
    self.passed = passed?

    save!
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

  def current_passage_percent
    100 * current_question_number.to_f / questions_count
  end

  private

  def expiration_date
    created_at + test.timer.minutes
  end

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
                            elsif expired?
                              nil
                            else
                              next_question unless completed?
                            end
  end
end
