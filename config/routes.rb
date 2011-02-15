Csf::Application.routes.draw do
  root :to => "main#index"
  match 'tree' => "main#tree"
  match 'gettree' => "main#gettree"
  match 'move' => "main#move"  
  match 'delete' => "main#delete"
  match 'copy' => "main#copy"
  match 'addgroup' => "main#addgroup"  
  match 'updategroup' => "main#updategroup"    
end
