module OpenBadges
  class Alignment < ActiveRecord::Base
    has_many :badge_alignments, dependent: :destroy
    has_many :badge, through: :badge_alignment

    attr_accessible :description, :name, :url
    
    validates :name, uniqueness: true
    validates :name, :url, presence: true

    after_initialize :assign_defaults

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
