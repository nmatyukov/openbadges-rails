OpenBadges::Engine.routes.draw do
  root :to => "application#show"

  # https://github.com/plataformatec/devise/wiki/How-To:-Use-devise-inside-a-mountable-engine
  devise_for :users, {
    module: :devise,
    :class_name => "OpenBadges::User",
    :controllers => { :sessions => "open_badges/sessions" }
  }

  resources :badge_alignments


  resources :alignments


  resources :badge_tags


  resources :tags


  resources :organizations, :only => []
  get "organization" => "organizations#show"
  post "organization" => "organizations#create"

  resources :badges


end
