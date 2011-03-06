Csf::Application.routes.draw do
  root :to => "main#index"
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
  
  resources :courses
  resources :subjects
  resources :marks
  resources :tutors
  resources :groups
  
end
