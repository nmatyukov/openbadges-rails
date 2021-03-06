module OpenBadges
  class BadgeAlignment < ActiveRecord::Base
    belongs_to :badge
    belongs_to :alignment

    attr_accessible :alignment_id, :badge_id

    validates :alignment_id, :badge_id, presence: true
    validates :badge, :alignment, :presence => { message: "does not exists" }

    public
    def as_json(options = nil)
      self.alignment.as_json
    end
  end
end
