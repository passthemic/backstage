PtmBackstage::Application.routes.draw do

  devise_for :users, controllers: {sessions: "sessions", registrations: "registrations"}
  resources :verses
  resources :raps

end
