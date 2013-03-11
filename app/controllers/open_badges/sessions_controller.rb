module OpenBadges
  class SessionsController < Devise::SessionsController

    def after_sign_out_path_for(resource_or_scope)
      root_path
    end
  end
end
