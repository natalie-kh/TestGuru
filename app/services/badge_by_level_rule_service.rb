class BadgeByLevelRuleService < BadgesByRuleService

  def initialize(test_passage, badge)
    super(test_passage)
    @badge = badge
  end

  def reached?
    user_passed_tests = passed_user_test(@badge).pluck(:test_id)
    needed_tests_for_badge = Test.level(@badge.rule_value).ids

    (needed_tests_for_badge - user_passed_tests).empty?
  end
end
