PtmBackstage::Application.routes.draw do


  devise_for :users
  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'registrations' => 'registrations#create', :as => 'register'
        post 'sessions'      => 'sessions#create',      :as => 'login'
        delete 'sessions'    => 'sessions#destroy',     :as => 'logout'
      end
      resources :raps do
        resources :verses
      end
      resources :friends, only: [ :index, :show ]
    end
  end

end
