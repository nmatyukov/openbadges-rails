module OpenBadges
  class BadgeAlignment < ActiveRecord::Base
    attr_accessible :alignment_id, :badge_id, :integer
  end
end
