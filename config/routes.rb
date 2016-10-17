Rails.application.routes.draw do

  root to: 'landing#index'

  # root 'pages#home'

  devise_for :teachers, :controllers => {:registrations => 'teachers/registrations'}

  devise_for :users,
						 :path => '',
						 :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
						 :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
						 									:registrations => 'registrations'
						 								 }

  resources :users, only: [:show]

  resources :teachers, only: [:show, :index] do
    resources :subjects, only: [:new, :create] do
      resources :schedules, only: [:index]
    end
  end

  resources :photos
  resources :checkouts, only: [:new, :create]

  resources :teachers do
  	resources :reservations, only: [:create]
  end

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

end
