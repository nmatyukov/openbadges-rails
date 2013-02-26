module OpenBadges
  class Organization < ActiveRecord::Base
    attr_accessible :description, :email, :image, :name, :url

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

  end
end
