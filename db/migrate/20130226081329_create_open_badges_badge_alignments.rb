class CreateOpenBadgesBadgeAlignments < ActiveRecord::Migration
  def change
    create_table :open_badges_badge_alignments do |t|
      t.integer :badge_id
      t.integer :alignment_id

      t.timestamps
    end
  end
end
