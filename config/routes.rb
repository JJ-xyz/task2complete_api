Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, path: '/api/users', only: [:create, :show, :update, :index] do
   collection do
     post '/login', to: 'users#login'
    end
  end

  resources :tasks, path: '/api/tasks' do
    collection do
      get '/to/:id', to: 'tasks#indexTo'
      get '/by/:id', to: 'tasks#indexBy'
    end
  end

end
