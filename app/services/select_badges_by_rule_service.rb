class SelectBadgesByRuleService

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    Badge.all.select do |badge|
      case badge.rule
        when 'by_level'
          BadgeByLevelRuleService
        when 'by_category'
          BadgeByCategoryRuleService
        when 'by_attempt'
          BadgeByAttemptRuleService
      end.new(@test_passage, badge).reached?
    end
  end
end
