require 'digest/sha1'

class User < ApplicationRecord

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify

  has_secure_password

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, format: { with: /[A-Za-z0-9]*@[A-Za-z]*\.[A-Za-z]*/, message: 'Wrong format' }

  def test_list(level)
    tests.where(tests: { level: level })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
