module OpenBadges
  class Alignment < ActiveRecord::Base
    attr_accessible :description, :name, :url
  end
end
