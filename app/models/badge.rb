class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  enum rule: [:by_level, :by_category, :by_attempt]

  validates :name, :rule, :rule_value,  presence: true
  validates :rule_value, numericality: { only_integer: true }, if: :by_level?

  def reached?(user, test)
    if by_level?
      reached_by_level?(user)
    elsif by_category?
      reached_by_category?(user)
    elsif by_attempt?
      reached_by_attempt?(user, test)
    end
  end

  private

  def last_same_badge_date(user)
    last_badge = user_badges.where(user: user).order(created_at: :desc).last
    date = last_badge ? last_badge.updated_at : "2000-10-15 13:25:19"
  end

  def reached_by_level?(user)
    user_passed_tests = user.test_passages.by_date(last_same_badge_date(user)).pluck(:test_id)
    needed_tests_for_badge = Test.level(rule_value).pluck(:id)

    (needed_tests_for_badge - user_passed_tests).empty?
  end

  def reached_by_category?(user)
    user_passed_tests = user.test_passages.by_date(last_same_badge_date(user)).pluck(:test_id)
    needed_tests_for_badge = Test.by_category(rule_value).pluck(:id)
    (needed_tests_for_badge - user_passed_tests).empty?
  end

  def reached_by_attempt?(user, test)
    tests = user.tests.where(title: test.title)
    tests.length == 1 && user.test_passages.where(test_id: test.id).first.passed
  end
end
