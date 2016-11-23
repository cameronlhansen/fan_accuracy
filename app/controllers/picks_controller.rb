class PicksController < ApplicationController
  before_action :current_user_must_be_pick_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_pick_fan
    pick = Pick.find(params[:id])

    unless current_user == pick.fan
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = current_user.picks.ransack(params[:q])
      @picks = @q.result(:distinct => true).includes(:fan, :game).page(params[:page]).per(10)

    render("picks/index.html.erb")
  end

  def show
    @pick = Pick.find(params[:id])

    render("picks/show.html.erb")
  end

  def new
    @pick = Pick.new

    render("picks/new.html.erb")
  end

  def create
    @pick = Pick.new

    @pick.type = params[:type]
    @pick.game_id = params[:game_id]
    @pick.fan_id = params[:fan_id]
    @pick.over_under_pick = params[:over_under_pick]
    @pick.spread_pick = params[:spread_pick]

    save_status = @pick.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/picks/new", "/create_pick"
        redirect_to("/picks")
      else
        redirect_back(:fallback_location => "/", :notice => "Pick created successfully.")
      end
    else
      render("picks/new.html.erb")
    end
  end

  def edit
    @pick = Pick.find(params[:id])

    render("picks/edit.html.erb")
  end

  def update
    @pick = Pick.find(params[:id])

    @pick.type = params[:type]
    @pick.game_id = params[:game_id]
    @pick.fan_id = params[:fan_id]
    @pick.over_under_pick = params[:over_under_pick]
    @pick.spread_pick = params[:spread_pick]

    save_status = @pick.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/picks/#{@pick.id}/edit", "/update_pick"
        redirect_to("/picks/#{@pick.id}", :notice => "Pick updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Pick updated successfully.")
      end
    else
      render("picks/edit.html.erb")
    end
  end

  def destroy
    @pick = Pick.find(params[:id])

    @pick.destroy

    if URI(request.referer).path == "/picks/#{@pick.id}"
      redirect_to("/", :notice => "Pick deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Pick deleted.")
    end
  end
end
