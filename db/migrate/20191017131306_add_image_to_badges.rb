class AddImageToBadges < ActiveRecord::Migration[6.0]
  def change
    add_column :badges, :image, :string, default: ''

    Badge.all.each do |badge|
      badge.update_attributes(image: badge.rule + '.png')
    end
  end
end
