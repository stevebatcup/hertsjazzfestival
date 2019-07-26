Rails.application.routes.draw do
  # get 'current-festival', to: 'festivals#show', as: :current_festival
  get 'current-venue', to: 'venues#show', as: :current_venue
  get 'films', to: 'films#index', as: :films
  get 'herts-jazz-club', to: 'club#show', as: :club
  get 'hotels', to: 'hotels#index', as: :hotels

  resources :gigs
  resources :films
  resources :festivals

  namespace :admin do
    resources :festivals
    resources :days
    resources :gigs
    resources :musicians
    resources :instruments
    resources :venues

    root to: "gigs#index"
  end

  root 'festivals#show'
end
