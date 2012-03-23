Whisper::Application.routes.draw do
  root :to => "home#index"

  match "/:author/invite" => "users#invite"
  match "/author/new" => "users#new"
  match "/author/create" => "users#create"
  match "/author/destroy" => "users#destroy"
end
