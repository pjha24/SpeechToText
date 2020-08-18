Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'static#index'
  post 'static/translate'
  get 'static/translate'
end
