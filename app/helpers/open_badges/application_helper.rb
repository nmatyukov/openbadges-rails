module OpenBadges
  module ApplicationHelper

  	def bootstrap_flash(level)
      case level
        when :alert then "alert"
      	when :error then "alert alert-error"
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
      end
    end

  end
end
