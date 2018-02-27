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

  post 'tasks/update', to: 'tasks#update', as: 'projects_update'

  resources :projects,:tasks

  root 'projects#insert'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
