Rails.application.routes.draw do
  resources :contacts do
    resources :pages
  end

  resources :api, :defaults => { :format => 'json' }

  root 'contacts#index'
end
