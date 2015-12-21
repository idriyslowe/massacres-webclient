Rails.application.routes.draw do
  get '/incidents' => 'incidents#index'
  get '/incidents/new' => 'incidents#new'
  post '/incidents' => 'incidents#create'
  get '/incidents/:id' => 'incidents#show'
  get '/incidents/:id/edit' => 'incidents#edit'
  patch '/incidents/:id' => 'incidents#update'
  delete '/incidents/:id' => 'incidents#destroy'
end
