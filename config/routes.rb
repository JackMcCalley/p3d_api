Rails.application.routes.draw do
  post 'rxform' => 'rxform#create'
  resources :rxforms
  post 'user_token' => 'user_token#create'
  resources :users

  get 'rxform_by_case_number/:case' => 'rxforms#rxform_by_case_number'
  get 'user_by_email/:email' => 'users#user_by_email'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
