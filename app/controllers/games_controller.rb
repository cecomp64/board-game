class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :start, :draw_quest, :discard_quest, :draw_helper, :discard_helper, :next_turn]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  def start
    if @game.players.count < 2
      note = "You need at least two players to start."
    else
      @game.turn = 1
      @game.current_player = @game.players.first
      @game.save
      note = "Game started!"
    end

    redirect_to @game, notice: note
  end

  def draw_quest
    player = Player.where(id: params[:player_id]).first
    geography = Geography.where(id: params[:geography_id]).first

    # Pick a quest that was not discarded
    #quests = Quest.all.where.not(id: @game.quest_discards).where(geography: geography)
    quests = Quest.where.not(id: @game.quest_discards).to_a
    @game.players.each do |p|
      quests.delete p.quest
    end

    # Reshuffle if there are no more quests left
    if quests.count == 0
      quests += @game.quest_discards.to_a
      @game.quest_discards = []
    end

    if quests.size <= 0
      note = "Not enough quest cards to choose from!"
    else
      player.quest = quests[rand(quests.size)]
      player.save
      note = "Selected quest: #{player.quest.title}"
    end

    redirect_to @game, notice: note
  end


  def draw_helper
    player = Player.where(id: params[:player_id]).first
    geography = Geography.where(id: params[:geography_id]).first

    # Pick a helper that was not discarded
    helpers = Helper.where.not(id: @game.helper_discards).where(geography: geography).to_a
    @game.players.each do |p|
      p.helpers.each do |h|
        helpers.delete h
      end
    end

    # Reshuffle if there are no more helpers left
    if helpers.count == 0
      helpers += @game.helper_discards.to_a
      @game.helper_discards = []
    end

    if helpers.size <= 0
      note = "Not enough helper cards to choose from!"
    else
      helper = helpers[rand(helpers.size)]
      player.helpers << helper
      note = "Selected helper: #{helper.title}"
    end

    redirect_to @game, notice: note
  end


  def discard_helper
    helper = Helper.where(id: params[:helper_id]).first
    player = Player.where(id: params[:player_id]).first
    play = params[:play]

    if helper and player
      if @game.helper_discards.include? helper
        note = "helper #{helper.title} is already in the discard pile!"
      else
        @game.helper_discards << helper
        player.helpers.delete helper
        player.modifier_instances = helper.modifier_instances if(play)
        note = "#{play ? 'Played' : 'Discarded'} helper #{helper.title}"
      end
    else
      note = "Could not discard helper #{params[:helper_id]} for player #{params[:player_id]}"
    end

    redirect_to @game, notice: note
  end



  def discard_quest
    quest = Quest.where(id: params[:quest_id]).first
    player = Player.where(id: params[:player_id]).first
    complete = params[:complete]

    if quest and player
      if @game.quest_discards.include? quest
        note = "Quest #{quest.title} is already in the discard pile!"
      else
        @game.quest_discards << quest
        player.quest = nil
        player.points += quest.points if(complete)
        player.save
        note = "#{complete ? 'Completed' : 'Discarded'} quest #{quest.title}"
      end
    else
      note = "Could not discard quest #{params[:quest_id]} for player #{params[:player_id]}"
    end

    redirect_to @game, notice: note
  end

  # GET /games/1/edit
  def edit
  end

  def next_turn
    players = @game.players.to_a
    p_idx = players.find_index(@game.current_player)

    if p_idx.nil?
      note = "Could not find player #{@game.current_player.name}"
    else
      n_idx = p_idx + 1
      n_player = players[n_idx]

      @game.current_player.modifier_instances = []

      # Done with all players, next turn
      if n_player.nil?
        note = "Beginning next turn"
        @game.current_player = players.first
        @game.turn += 1
        @game.save
      else
        # Next player in the same turn
        @game.current_player = n_player
        @game.save
      end
    end

    redirect_to @game, notice: note
  end

  def add_player
    @game = Game.where(id: params[:game_id]).first
    @player = Player.where(id: params[:player]).first

    if @game and @player
      @player.reset
      @game.players << @player
      note = "Successfully add player #{@player.name}"
    else
      note = "could not add player #{params[:player]} to game #{params[:game_id]}"
    end

    redirect_to edit_game_path(@game), notice: note
  end
  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { render :edit, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :winner_id)
    end
end
