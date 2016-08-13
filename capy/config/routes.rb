Rails.application.routes.draw do
  resources :contacts do
    resources :pages
  end

  root 'contacts#index'
end
