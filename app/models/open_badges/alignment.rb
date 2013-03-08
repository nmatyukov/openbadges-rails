module OpenBadges
  class Alignment < ActiveRecord::Base
    has_many :badge_alignments

    before_destroy :ensure_not_referenced_by_any_badge_alignment

    attr_accessible :description, :name, :url
    
    validates :name, uniqueness: true
    validates :name, :url, presence: true

    after_initialize :assign_defaults

    def ensure_not_referenced_by_any_badge_alignment
      if badge_alignments.empty?
        return true
      else
        errors.add(:base, 'Alignment is associated with at least 1 badge')
        logger.debug('Alignment is associated with at least 1 badge')
        return false
      end
    end

    private
    def assign_defaults
      if new_record?
        self.url ||= ""
        self.name ||= ""
        self.description ||= ""
      end
    end

    public
    def as_json(options = nil)
      super(
        :only => [:url, :name, :description]
      ).reject{ |key, value| value.nil? || value.empty? }
    end
  end
end
