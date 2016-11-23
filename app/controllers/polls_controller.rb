class PollsController < ApplicationController
  before_action :current_user_must_be_poll_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_poll_fan
    poll = Poll.find(params[:id])

    unless current_user == poll.fan
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @polls = Poll.all

    render("polls/index.html.erb")
  end

  def show
    @poll = Poll.find(params[:id])

    render("polls/show.html.erb")
  end

  def new
    @poll = Poll.new

    render("polls/new.html.erb")
  end

  def create
    @poll = Poll.new

    @poll.game_id = params[:game_id]
    @poll.fan_id = params[:fan_id]
    @poll.question = params[:question]

    save_status = @poll.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/polls/new", "/create_poll"
        redirect_to("/polls")
      else
        redirect_back(:fallback_location => "/", :notice => "Poll created successfully.")
      end
    else
      render("polls/new.html.erb")
    end
  end

  def edit
    @poll = Poll.find(params[:id])

    render("polls/edit.html.erb")
  end

  def update
    @poll = Poll.find(params[:id])

    @poll.game_id = params[:game_id]
    @poll.fan_id = params[:fan_id]
    @poll.question = params[:question]

    save_status = @poll.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/polls/#{@poll.id}/edit", "/update_poll"
        redirect_to("/polls/#{@poll.id}", :notice => "Poll updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Poll updated successfully.")
      end
    else
      render("polls/edit.html.erb")
    end
  end

  def destroy
    @poll = Poll.find(params[:id])

    @poll.destroy

    if URI(request.referer).path == "/polls/#{@poll.id}"
      redirect_to("/", :notice => "Poll deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Poll deleted.")
    end
  end
end
