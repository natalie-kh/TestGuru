class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :tests_users
  has_many :users, through: :tests_users

  def self.test_list(category_name)
    joins('INNER JOIN categories ON tests.category_id = categories.id ')
        .where(categories: { title: category_name })
        .order(title: :desc)
        .pluck(:title)
  end
end
