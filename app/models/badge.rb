class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  enum rule: [:by_level, :by_category, :by_attempt]

  validates :name, :rule, :rule_value,  presence: true
  validates :rule_value, numericality: { only_integer: true }, unless: :by_category?

  def reached?(user)
    if by_level?
      (user.test_list(rule_value).uniq) == (Test.level(rule_value))
    elsif by_category?
      (user.tests_by_category(rule_value).uniq) == Test.by_category(rule_value)
    elsif by_attempt?
      user.tests.where(tests: {title: rule_value}).length == rule_value.to_i
    end
  end

  private

  def reached_by_level?(user)
    (user.test_list(rule_value).uniq) == (Test.level(rule_value))
  end

  def reached_by_category?(user)
    (user.tests_by_category(rule_value).uniq) == Test.by_category(rule_value)
  end

  def reached_by_attempt?
    user.tests.where(tests: {title: rule_value}).length == rule_value.to_i
  end
end
