module OpenBadges
  class Tag < ActiveRecord::Base
    has_many :badge_tags, dependent: :destroy
    has_many :badges, through: :badge

    attr_accessible :name
    
    validates :name, uniqueness: true
    validates :name, presence: true

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
