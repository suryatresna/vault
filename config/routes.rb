Vault::Engine.routes.draw do
	resources :role
	resources :permission
	resources :site
	resources :user

	get '/profile', to: 'profile#show'

	# devise_for :user, controllers: { sessions: 'user' }
	# devise_scope :user do 
	# 	get 'logout', to: 'vault/auth#destroy'
	# end
end
