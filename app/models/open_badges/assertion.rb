require 'digest'
require 'securerandom'

module OpenBadges
  class Assertion < ActiveRecord::Base
    delegate :url_helpers, to: 'OpenBadges::Engine.routes'

    belongs_to :badge

    validates :badge_id, presence: true
    validates :verification_type, presence: true
    validates :identity, :identity_hashed, :identity_type, presence: true

    validates :badge, :presence => { message: "does not exists" }
    
    attr_accessible :badge_id, :evidence, :expires, :image
    attr_accessible :identity, :identity_hashed, :identity_salt, :identity_type
    attr_accessible :verification_type

    after_initialize :assign_defaults

    private
    def assign_defaults
      if new_record?
        self.identity ||= "sha256$"
        self.identity_type = 'email'
        self.identity_hashed = true
        self.identity_salt = SecureRandom.urlsafe_base64(16)

        self.verification_type = 'hosted'
      end
    end

    public
    def as_json(options = nil)
      json = super( :only => [] )
      json.merge!({
        :uid => self.id.to_s,
        :issuedOn => self.created_at.to_i,
        :recipient => {
          :identity => self.identity,
          :type => self.identity_type,
          :salt => self.identity_salt,
          :hashed => self.identity_hashed
        },
        :verify => {
          :type => self.verification_type,
          :url => url_helpers.assertion_url(:id => self.id, :format => :json, :host => Rails.application.routes.default_url_options[:host])
        }
      })
      json[:image] = self.image unless self.image.nil? || self.image.empty?
      json[:evidence] = self.evidence unless self.evidence.nil? || self.evidence.empty?
      json[:expires] = self.expires.to_i unless self.expires.nil?
      json
    end
  end
end
