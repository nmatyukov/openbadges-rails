module OpenBadges
  class BadgeTag < ActiveRecord::Base
    belongs_to :badge
    belongs_to :tag
    
    attr_accessible :badge_id, :tag_id

    validates :badge_id, :tag_id, presence: true
    validates :badge, :tag, :presence => { message: "does not exists" }
  end
end
