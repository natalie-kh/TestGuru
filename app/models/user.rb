class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  validates :name, presence: true
  validates :login, presence: true
  validates :password, presence: true

  def test_list(level)
    tests.where(tests: { level: level })
  end
end
