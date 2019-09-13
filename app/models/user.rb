class User < ApplicationRecord
  def test_list(level)
    Test.joins('INNER JOIN user_tests ON tests.id = user_tests.test_id')
        .where(tests: { level: level }, user_tests: { user_id: id })
  end
end
