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
  end
end