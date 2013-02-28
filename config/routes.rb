OpenBadges::Engine.routes.draw do
  resources :badge_alignments


  resources :alignments


  resources :badge_tags


  resources :tags


  resources :organizations, :only => []
  get "organization" => "organizations#show"
  post "organization" => "organizations#create"

  resources :badges


end
