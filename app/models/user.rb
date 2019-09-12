class User < ApplicationRecord

  def test_list(level)
    self.class.joins('INNER JOIN user_tests ON user_tests.user_id = users.id INNER JOIN tests ON tests.id = user_tests.test_id')
        .where('tests.level = :level AND users.id = :id', level: level, id: self.id)
        .pluck('tests.title')
  end
end
