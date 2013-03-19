module OpenBadges
  class Tag < ActiveRecord::Base
    has_many :badge_tags

    before_destroy :ensure_not_referenced_by_any_badge_tag

    attr_accessible :name
    
    validates :name, uniqueness: true
    validates :name, presence: true
    validates_format_of :name, :with => /^[a-z]+$/

    def ensure_not_referenced_by_any_badge_tag
      if badge_tags.empty?
        return true
      else
        errors.add(:base, 'Tag is associated with at least 1 badge')
        logger.debug('Tag is associated with at least 1 badge')
        return false
      end
    end

    def self.get_tag_list
      Tag.order("name").map do |tag|
        tag.name
      end
    end

    public
    def as_json(options = nil)
      self.name
    end
  end
end
