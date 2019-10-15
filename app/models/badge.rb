class Badge < ApplicationRecord
  enum rule: [:by_level, :by_category, :by_attempt]
  validates :name, :rule, :rule_value,  presence: true

  def reached?(user)
    if by_level?
      (user.tests.where(tests: {level: rule_value}).uniq) == (Test.where(level: rule_value ))
    elsif by_category?
    elsif by_attempt?
    end

  end
end
