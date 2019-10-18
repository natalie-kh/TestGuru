class BadgeByAttemptRuleService < BadgesByRuleService

  def initialize(test_passage, badge)
    super(test_passage)
    @badge = badge
  end

  def reached?
    return false if last_same_badge_date(@badge)

    test_passages = @user.test_passages.joins(:test).where('tests.title=?', @badge.rule_value)
    test_passages.count == 1 && test_passages.first.passed
  end
end
