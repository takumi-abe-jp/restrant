Rails.application.routes.draw do
  root 'index#index'
  #get 'show' => 'index#show'
  get "/show/:id" => "index#show"
  get "/:page" => "index#index"

  #post "/" => "sessions#index"

  resources :index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
