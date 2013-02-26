module OpenBadges
  class Organization < ActiveRecord::Base
    attr_accessible :description, :email, :image, :name, :url
  end
end
