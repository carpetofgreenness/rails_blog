Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resources :users
	resources :posts
	resources :comments

	get 'signin' => "users#signin"
	post 'lookup' => "users#lookup"
	get 'logout' => "users#logout"

	root to: "posts#index"
end