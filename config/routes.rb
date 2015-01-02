Rails.application.routes.draw do
	resources :fits do
		resources :comments
	end
	resources :users do
		collection do
			post 'signin'
			post 'logout'
		end
	end
	get 'fits/index'
	get 'users/index'
	get 'welcome/index'
	root 'fits#index'
end
