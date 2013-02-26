module OpenBadges
  class Badge < ActiveRecord::Base
    attr_accessible :criteria, :description, :image, :name
  end
end
