Csf::Application.routes.draw do
  root :to => "main#index"
  
  # TODO: fix these routes with its controller
  match 'tree' => "main#tree"
  match 'gettree' => "main#gettree"
  match 'move' => "main#move"  
  match 'delete' => "main#delete"
  match 'copy' => "main#copy"
  match 'addgroup' => "main#addgroup"  
  match 'updategroup' => "main#updategroup"    
  match 'delfrom' => "main#delfrom"    
  match 'adduser' => "main#adduser"
  match 'getuser' => "main#getuser"
  match 'updateuser' => "main#updateuser"
  # end of fix
  
  resources :courses
  resources :subjects
  resources :marks
  resources :tutors
  resources :groups
  
  resource :session
  match '/login' => "sessions#new", :as => "login" 
  match '/logout' => "sessions#destroy", :as => "logout"
  
  match ':controller(/:action(/:id(.:format)))'
  
end
