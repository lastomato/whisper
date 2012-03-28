Whisper::Application.routes.draw do
  root :to => "home#index"

  match "/entry/:permalink" => "entries#show"
  match "/entry/search/:keyword" => "entries#search"

  match "/login" => "sessions#new"
  match "/logout" => "sessions#destroy"
  match "/blog" => "entries#index"

  resource :entry, :except => [:show]
end
