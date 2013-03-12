Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"

  mount OpenBadges::Engine => "/open_badges"
end
