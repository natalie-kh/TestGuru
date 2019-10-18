class Badge < ApplicationRecord
  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges, dependent: :destroy

  enum rule: %i[by_level by_category by_attempt]

  validates :name, :rule, :rule_value, presence: true
  validates :rule_value, numericality: { only_integer: true }, if: :by_level?
end
