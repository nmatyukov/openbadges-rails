class CreateOpenBadgesAssertions < ActiveRecord::Migration
  def change
    create_table :open_badges_assertions do |t|
      t.integer :badge_id
      t.string :image
      t.string :evidence
      t.datetime :expires
      t.text :identity
      t.string :identity_type
      t.boolean :identity_hashed
      t.string :identity_salt
      t.string :verification_type

      t.timestamps
    end
  end
end
