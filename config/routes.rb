Rails.application.routes.draw do
  post 'rxform' => 'rxform#create'
  resources :rxforms
  post 'user_token' => 'user_token#create'
  resources :users

  get 'rxform_by_case_number/:case' => 'rxforms#rxform_by_case_number'
  get 'user_by_email/:email' => 'users#user_by_email'

  get 'case_submitted_email/:case' => 'rxforms#case_submitted_email'
end
