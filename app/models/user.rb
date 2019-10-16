class User < ApplicationRecord
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :nullify
  has_many :gists, class_name: 'Gist', foreign_key: 'author_id', dependent: :nullify
  has_many :user_badges, dependent: :destroy
  has_many :badges, through: :user_badges, dependent: :destroy


  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :confirmable

  def test_list(level)
    tests.where(tests: { level: level })
  end

  def tests_by_category(category_name)
    tests.joins(:category)
        .where(categories: { title: category_name })
        .order(title: :desc)
  end

  def tests_after_date(date)
    joins(test_passages).where(test_passages.updated_at > date)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def admin?
    is_a?(Admin)
  end
end
