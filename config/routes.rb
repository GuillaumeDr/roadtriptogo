Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :steps, only: [:new, :create, :edit, :destroy, :update]
    resources :todolists do
      resources :tasks, only: [ :new, :create, :edit, :update, :destroy ]
    end
  end
  get "/projects/:project_id/newstep", to: "steps#newstep", as: "newstep"
  get "/myprojects", to: "travelers#myprojects"
  post "/projects/:project_id/todolists/:todolist_id/tasks/new", to: "tasks#new"
end
