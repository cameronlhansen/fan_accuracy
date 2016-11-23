Rails.application.routes.draw do
  devise_for :fans
  # Routes for the Fan resource:
  # READ
  get "/fans", :controller => "fans", :action => "index"
  get "/fans/:id", :controller => "fans", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
