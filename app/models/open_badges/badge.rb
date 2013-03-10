module OpenBadges
  class Badge < ActiveRecord::Base
    has_many :badge_tags, dependent: :destroy
    has_many :badge_alignments, dependent: :destroy

    attr_accessible :criteria, :description, :image, :name
    
    validates :name, :image, presence: true
    validates :name, uniqueness: true
    validates :image, allow_blank: true, format: {
      with: %r{\.(gif|jpe?g|png)$}i,
      message: 'must be a ULR for GIF, JPG, JPEG or PNG images'
    }

    public
    def as_json(options = nil)
      json = super(
        :methods => [:badge_tags, :badge_alignments],
        :only => [:name, :image, :criteria, :badge_tags, :badge_alignments, :description]
      ).reject{ |key, value| value.nil? || value.empty? }
      json['tags'] = json.delete(:badge_tags) unless json[:badge_tags].nil?
      json['alignment'] = json.delete(:badge_alignments) unless json[:badge_alignments].nil?
      json['issuer'] = OpenBadges::Engine.routes.url_helpers.organization_url(:json, :host => Rails.application.routes.default_url_options[:host] )
      json
    end
  end
end