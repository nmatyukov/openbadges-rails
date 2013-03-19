OpenBadges::Engine.routes.draw do
  resources :assertions


  root :to => "application#show"

  # https://github.com/plataformatec/devise/wiki/How-To:-Use-devise-inside-a-mountable-engine
  devise_for :users, {
    module: :devise,
    :class_name => "OpenBadges::User",
    :controllers => { :sessions => "open_badges/sessions" }
  }

  resources :organizations, :only => []
  get "organization" => "organizations#show"
  post "organization" => "organizations#create"

  resources :badges

  resources :tags

  resources :alignments

end
