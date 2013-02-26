class CreateOpenBadgesOrganizations < ActiveRecord::Migration
  def change
    create_table :open_badges_organizations do |t|
      t.string :url
      t.string :name
      t.string :image
      t.string :email
      t.string :description

      t.timestamps
    end
  end
end
