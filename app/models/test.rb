class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages, dependent: :destroy

  validates :title, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equl_to: 0 }
  validates :title, uniqueness: { scope: :level,
                                  message: 'Already exists' }

  scope :level, ->(level) { where(level: level) }
  scope :easy, -> { level(0..1) }
  scope :medium, -> { level(2..4) }
  scope :hard, -> { level(5..Float::INFINITY) }
  scope :by_category, lambda { |category_name|
    joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
  }
  scope :by_date_complete, lambda { |date|
    joins(:test_passages)
        .where(test_passages: where(:updated_at > date))
        .order(title: :desc)
  }

  def self.test_list(category_name)
    by_category(category_name).pluck(:title)
  end
end
