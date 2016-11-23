Rails.application.routes.draw do
  # Routes for the Game resource:
  # CREATE
  get "/games/new", :controller => "games", :action => "new"
  post "/create_game", :controller => "games", :action => "create"

  # READ
  get "/games", :controller => "games", :action => "index"
  get "/games/:id", :controller => "games", :action => "show"

  # UPDATE
  get "/games/:id/edit", :controller => "games", :action => "edit"
  post "/update_game/:id", :controller => "games", :action => "update"

  # DELETE
  get "/delete_game/:id", :controller => "games", :action => "destroy"
  #------------------------------

  # Routes for the Pick resource:
  # CREATE
  get "/picks/new", :controller => "picks", :action => "new"
  post "/create_pick", :controller => "picks", :action => "create"

  # READ
  get "/picks", :controller => "picks", :action => "index"
  get "/picks/:id", :controller => "picks", :action => "show"

  # UPDATE
  get "/picks/:id/edit", :controller => "picks", :action => "edit"
  post "/update_pick/:id", :controller => "picks", :action => "update"

  # DELETE
  get "/delete_pick/:id", :controller => "picks", :action => "destroy"
  #------------------------------

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
