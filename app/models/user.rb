class User < ApplicationRecord
  has_many :tests_users
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id'

  def test_list(level)
    Test.joins('INNER JOIN user_tests ON tests.id = user_tests.test_id')
        .where(tests: { level: level }, user_tests: { user_id: id })
  end
end
