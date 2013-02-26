class CreateOpenBadgesBadges < ActiveRecord::Migration
  def change
    create_table :open_badges_badges do |t|
      t.string :name
      t.string :image
      t.string :criteria
      t.text :description

      t.timestamps
    end
  end
end
