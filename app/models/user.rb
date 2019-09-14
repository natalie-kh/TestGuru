class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  def test_list(level)
    Test.joins(:users_tests)
        .where(tests: { level: level }, user_tests: { user_id: id })
  end
end
