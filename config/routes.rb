Rails.application.routes.draw do
  # Routes for the Team resource:
  # CREATE
  get "/teams/new", :controller => "teams", :action => "new"
  post "/create_team", :controller => "teams", :action => "create"

  # READ
  get "/teams", :controller => "teams", :action => "index"
  get "/teams/:id", :controller => "teams", :action => "show"

  # UPDATE
  get "/teams/:id/edit", :controller => "teams", :action => "edit"
  post "/update_team/:id", :controller => "teams", :action => "update"

  # DELETE
  get "/delete_team/:id", :controller => "teams", :action => "destroy"
  #------------------------------

  devise_for :fans
  # Routes for the Fan resource:
  # READ
  get "/fans", :controller => "fans", :action => "index"
  get "/fans/:id", :controller => "fans", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
