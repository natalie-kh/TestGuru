class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_limit

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_limit
    errors.add(:test_id, 'Answers limit') if question.answers.count > 3
  end
end
