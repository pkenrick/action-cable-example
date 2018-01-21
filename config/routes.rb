Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#about'

  get '/signup', to: 'registrations#new'
  post '/signup', to: 'registrations#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/chatrooms', to: 'chatrooms#index'
  get '/chatrooms/:slug', to: 'chatrooms#show', as: :chatroom
  post '/chatrooms', to: 'chatrooms#create'
  get '/chatrooms/:slug/edit', to: 'chatrooms#edit', as: :edit_chatroom
  patch '/chatrooms/:slug', to: 'chatrooms#update'

  post '/messages', to: 'messages#create'

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'

end
