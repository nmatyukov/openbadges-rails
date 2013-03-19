module OpenBadges
  class Assertion < ActiveRecord::Base

    has_one :badge

    validates :badge_id, :issued_on, presence: true
    validates :identity, :identity_hashed, :identity_type, presence: true
    validates :verification_type, :verification_url, presence: true

    validates :badge, :presence => { message: "does not exists" }

    attr_accessible :badge_id, :evidence, :expires, :image, :issued_on
    attr_accessible :identity, :identity_hashed, :identity_salt, :identity_type
    attr_accessible :verification_type, :verification_url

  end
end
