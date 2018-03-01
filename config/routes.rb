Rails.application.routes.draw do
  
  get 'tasks/index'

  get 'tasks/insert'

  get 'tasks/show'

  get 'tasks/edit'

  get 'tasks/delete'

  get 'projects/index'

  get 'projects/insert'

  get 'projects/show'

  get 'projects/edit'

  get 'projects/delete'

  get 'projects/multitasks', to: 'projects#multitasks', as: 'projects_update_tasks'
  
  get 'projects/showtasks', to: 'projects#showtasks'

  post 'projects/update', to: 'projects#update', as: 'projects_update'

  patch 'projects/updateproject', to: 'projects#updateproject'

  post 'tasks/update', to: 'tasks#update', as: 'tasks_update'

  resources :projects,:tasks
  
  resources :projects do
    collection do
      get :updateproject
    end
  end
  
  root 'projects#insert'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
