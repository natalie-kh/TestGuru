class Gist < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id', optional: true
  belongs_to :question

  validates :url, presence: true

  def github_hash
    url.scan(/.*github.com\/(.*)$/).join
  end
end