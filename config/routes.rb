Whisper::Application.routes.draw do
  root :to => "home#index"

  match "/blog" => "entries#index"
  match "/blog/feed" => "entries#feed", :as => :feed

  match "/article/:permalink" => "entries#show", :as => :entry_show
  match "/article/edit/:permalink" => "entries#edit", :as => :entry_edit
  match "/entry/search" => "entries#search", :as => :entry_search

  match "/login" => "sessions#new"
  match "/logout" => "sessions#destroy"
  match "/session" => "sessions#create", :as => :session, :via => [:post]

  match "/entry/new" => "entries#new", :as => :entry_new
  match "/entry/create" => "entries#create", :as => :entry, :via => [:post]

  match "/entry/update/:permalink" => "entries#update", :as => :entry_update, :via => [:put]
  match "/entry/destroy/:permalink" => "entries#destroy", :as => :entry_destroy, :via => [:delete]
end
