module OpenBadges
  class Organization < ActiveRecord::Base
    attr_accessible :description, :email, :image, :name, :url

    validates :url, :name, presence: true

    after_initialize :assign_defaults


    private
    def assign_defaults
      if new_record?
        self.url ||= ""
        self.name ||= ""
        self.image ||= ""
        self.email ||= ""
        self.description ||= ""
      end
    end

    public
    def as_json(options = nil)
      super(
      	:only => [:url, :name, :image, :email, :description]
      ).reject{ |key, value| value.nil? || value.empty? }
    end

  end
end
