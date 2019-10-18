class GetNewUserBadgesService

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    SelectBadgesByRuleService.new(@test_passage).call
  end
end
