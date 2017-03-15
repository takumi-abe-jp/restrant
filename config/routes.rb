Rails.application.routes.draw do
  root 'index#index'
  #get 'show' => 'index#show'
  get "/:id" => "index#show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
