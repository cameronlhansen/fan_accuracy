class GamesController < ApplicationController
  def index
    @q = Game.ransack(params[:q])
    @games = @q.result(:distinct => true).includes(:home_team, :picks, :polls).page(params[:page]).per(10)

    render("games/index.html.erb")
  end

  def show
    @poll = Poll.new
    @pick = Pick.new
    @game = Game.find(params[:id])

    render("games/show.html.erb")
  end

  def new
    @game = Game.new

    render("games/new.html.erb")
  end

  def create
    @game = Game.new

    @game.home_team_id = params[:home_team_id]
    @game.spread = params[:spread]
    @game.over_under = params[:over_under]
    @game.game_date_time = params[:game_date_time]
    @game.away_team_id = params[:away_team_id]

    save_status = @game.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/games/new", "/create_game"
        redirect_to("/games")
      else
        redirect_back(:fallback_location => "/", :notice => "Game created successfully.")
      end
    else
      render("games/new.html.erb")
    end
  end

  def edit
    @game = Game.find(params[:id])

    render("games/edit.html.erb")
  end

  def update
    @game = Game.find(params[:id])

    @game.home_team_id = params[:home_team_id]
    @game.spread = params[:spread]
    @game.over_under = params[:over_under]
    @game.game_date_time = params[:game_date_time]
    @game.away_team_id = params[:away_team_id]

    save_status = @game.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/games/#{@game.id}/edit", "/update_game"
        redirect_to("/games/#{@game.id}", :notice => "Game updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Game updated successfully.")
      end
    else
      render("games/edit.html.erb")
    end
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy

    if URI(request.referer).path == "/games/#{@game.id}"
      redirect_to("/", :notice => "Game deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Game deleted.")
    end
  end
end
