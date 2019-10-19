Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :thermostats, only: [] do
        collection do
          post :reading
          get :reading
          get :stats
        end
      end
    end
  end
end
