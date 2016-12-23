Rails.application.routes.draw do
	get "/" => "sessions#index"
	get "/runners" => "runners#new"
	get "/register" => "sessions#register"
	get "/login" => "sessions#login1"
	post "/create" => "sessions#create"
	post "/login" => "sessions#login"
	get "/logout" => "sessions#destroy"
	get "/runners/:id/edit" => "runners#edit"
	get "/runners/:id" => "runners#profile"
	patch "/runners" => "runners#update"
end
