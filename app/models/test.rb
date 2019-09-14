class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :destroy

  def self.test_list(category_name)
    joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
      .pluck(:title)
  end
end
