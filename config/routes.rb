Deals::Engine.routes.draw do
  match '/places' => 'places#index', :defaults => { :format => 'json' }
  match '/categories' => 'categories#index', :defaults => { :format => 'json' }
  match '/for/:category' => 'deals#index', :defaults => { :format => 'json' }
  match '/:place' => 'deals#index', :defaults => { :format => 'json' } 
  match '/:place/:category' => 'deals#index', :defaults => { :format => 'json' }
end
