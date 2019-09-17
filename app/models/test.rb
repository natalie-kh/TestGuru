class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :tests_users, dependent: :destroy
  has_many :users, through: :tests_users, dependent: :destroy

  validates :title, presence: true
  validates :level, numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level,
                                message: 'Already exists' }

  scope :level, ->(level) { where(level: level) }
  scope :easy, -> { level(0..1) }
  scope :medium, -> { level(2..4) }
  scope :hard, -> { level(5..Float::INFINITY) }
  scope :by_category, lambda { |category_name|
    joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc).pluck(:title)
  }
end
