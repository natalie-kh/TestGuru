class BadgeService
  attr_reader :badges

  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
    @badges = reached_badges
  end

  def reached?(badge)
    send("reached_#{badge.rule}?", badge)
  end

  def reached_badges
    Badge.all.select { |badge| reached?(badge) }
  end

  private

  def last_same_badge_date(badge)
    last_badge = badge.user_badges.where(user: @user).order(created_at: :desc).last
    last_badge ? last_badge.updated_at : nil
  end

  def reached_by_level?(badge)
    user_passed_tests = passed_user_test(badge).pluck(:test_id)
    needed_tests_for_badge = Test.level(badge.rule_value).ids

    (needed_tests_for_badge - user_passed_tests).empty?
  end

  def reached_by_category?(badge)
    user_passed_tests = passed_user_test(badge).pluck(:test_id)
    needed_tests_for_badge = Test.by_category(badge.rule_value).ids

    (needed_tests_for_badge - user_passed_tests).empty?
  end

  def reached_by_attempt?(badge)
    return false if last_same_badge_date(badge)

    test_passages = @user.test_passages.joins(:test).where('tests.title=?', badge.rule_value)
    test_passages.count == 1 && test_passages.first.passed
  end

  def passed_user_test(badge)
    date = last_same_badge_date(badge)
    date ? @user.test_passages.by_date(date) : @user.test_passages.success
  end
end
