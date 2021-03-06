Pollfy::Application.routes.draw do
  #resources :responses
  #resources :answers
  #resources :questions

  devise_for :users
  resources :surveys do 
    resources :questions do
      resources :answers
    end
  end

  resources :surveys do 
    resources :answers
    resources :responses do
      member do
        get 'thanks'
      end
      resources :answers
    end
  end

#  resources :surveys do
#  member do
#    get 'r'
#    get 'thanks'
#  end
#end


  #get 'profile', to: 'users#edit'
  #get 'profile', to: 'devise/registrations#edit'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'surveys#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end
  
  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  #catch-all route for all bad paths not matching any controller
  get "*path", to: "surveys#index"
  
end
