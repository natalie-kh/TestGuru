class User < ApplicationRecord

  def test_list(level)

    Test.joins('INNER JOIN user_tests ON tests.id = user_tests.test_id')
        .where('tests.level = :level AND user_tests.id = :id', level: level, id: self.id)
        .pluck('tests.title')
  end
end
