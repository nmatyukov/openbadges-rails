module OpenBadges
  class Alignment < ActiveRecord::Base
    has_many :badge_alignments

    before_destroy :ensure_not_referenced_by_any_badge_alignment

    attr_accessible :description, :name, :url
    
    validates :name, uniqueness: true
    validates :name, :url, presence: true

    def ensure_not_referenced_by_any_badge_alignment
      if badge_alignments.empty?
        return true
      else
        errors.add(:base, 'Alignment is associated with at least 1 badge')
        logger.debug('Alignment is associated with at least 1 badge')
        return false
      end
    end
  end
end
