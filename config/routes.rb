Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :todolists
    resources :events
    resources :steps, only: [:new, :create, :edit, :destroy, :update]
  end
  get "/projects/:project_id/newstep", to: "steps#newstep", as: "newstep"
end
