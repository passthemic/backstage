PtmBackstage::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {sessions: "sessions", registrations: "registrations"} do
        post   'sessions'      => 'sessions#create',      :as => 'sign_in'
        delete 'sessions'      => 'sessions#destroy',     :as => 'sign_out'
        post   'registrations' => 'registrations#create', :as => 'sign_up'
      end
      resources :verses
      resources :raps
    end
  end

end
