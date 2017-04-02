Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "my_test#index"

  get 'champ', to: 'my_test#my_test'
end
