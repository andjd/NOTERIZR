Rails.application.routes.draw do

 resources :users, only: [:create, :new, :show]

 resource :session, only: [:create, :new, :destroy]

 resources :bands do
   resources :albums, only: :new
 end

 resources :albums, except: [:index, :new] do
   resources :songs, only: :new
 end

 resources :songs, except: [:index, :new]

end
