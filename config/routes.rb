OpenBadges::Engine.routes.draw do
  resources :badge_tags


  resources :tags


  resources :organizations, :only => []
  get "organization" => "organizations#show"
  post "organization" => "organizations#update2"

  resources :badges


end
