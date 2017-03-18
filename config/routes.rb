Rails.application.routes.draw do
  root 'index#index'

  get "/show/:id" => "index#show"
  get "/:page" => "index#index" ,as: :pages
  post "/" => "index#index" ,as: :serch
  post 'getLocation' => 'index#getLocation'

  resources :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
