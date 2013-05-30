PtmBackstage::Application.routes.draw do

  namespace :api do
    namespace :v1 do
      devise_for :users, controllers: {sessions: "sessions", registrations: "registrations"}
      resources :verses
      resources :raps
    end
  end

end
