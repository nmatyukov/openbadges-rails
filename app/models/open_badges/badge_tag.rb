module OpenBadges
  class BadgeTag < ActiveRecord::Base
    attr_accessible :badge_id, :tag_id
  end
end
