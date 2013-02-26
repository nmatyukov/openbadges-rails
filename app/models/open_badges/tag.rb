module OpenBadges
  class Tag < ActiveRecord::Base
    has_many :badge_tags

    before_destroy :ensure_not_referenced_by_any_badge_tag

    attr_accessible :name
    
    validates :name, uniqueness: true
    validates :name, presence: true

    def ensure_not_referenced_by_any_badge_tag
      if badge_tags.empty?
        return true
      else
        errors.add(:base, 'Tag is associated with at least 1 badge')
        logger.debug('Tag is associated with at least 1 badge')
        return false
      end
    end
  end
end