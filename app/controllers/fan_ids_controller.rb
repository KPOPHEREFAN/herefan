class FanIdsController < ApplicationController
  before_action :set_fan_id, only: [:show, :edit, :update, :destroy]
  before_action :set_fandoms, only: [:new, :edit]

  def new
    @fan_id = FanId.new
  end

  def edit
    @fan_id = current_fan_id
  end

  def create
    @fan_id = FanId.new(fan_id_params)
    @fan_id.user_id = current_user.id
    respond_to do |format|
      if @fan_id.save
        format.html { redirect_to "/", notice: 'Fan was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    success = @fan_id.update(fan_id_params)
    @fandom = @fan_id.fandom
    fandom_name     = @fandom.name
    says_to_newbie  = @fandom.description
    respond_to do |format|
      if success
        # format.html { redirect_to @fan_id, notice: 'Fan was successfully updated.' }
        # format.json { render :show, status: :ok, location: @fan_id }
        format.html { redirect_to "/", notice: "Welcome to #{fandom_name}, #{says_to_newbie}" }
      else
        format.html { render :edit }
        format.json { render json: @fan_id.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fan_id.destroy
    respond_to do |format|
      format.html { redirect_to fan_ids_url, notice: 'Fan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_fan_id
      @fan_id = FanId.find(params[:id])
    end

    def set_fandoms
      @fandoms = Fandom.all
    end

    def fan_id_params
      params.require(:fan_id).permit(:user_id, :fandom_id, :fan_img, :nickname, :msg)
    end
end
