class CreateOpenBadgesBadgeTags < ActiveRecord::Migration
  def change
    create_table :open_badges_badge_tags do |t|
      t.integer :badge_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
