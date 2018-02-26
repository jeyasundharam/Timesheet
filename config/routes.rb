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

  get 'task/index'

  get 'task/insert'

  get 'task/show'

  get 'task/edit'

  get 'project/index'

  get 'project/insert'

  get 'project/show'

  get 'project/edit'
  resources :project

  root 'project#insert'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
