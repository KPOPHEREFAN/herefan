class FanIdsController < ApplicationController
    before_action :set_fan_id, only: [:show, :edit, :update, :destroy]
    
    # GET /fan_ids
    # GET /fan_ids.json
    def index
        @fan_ids = FanId.all
    end
    
    # GET /fan_ids/1
    # GET /fan_ids/1.json
    def show
    end
    
    # GET /fan_ids/new
    def new
        @fan_id = FanId.new
    end
    
    # GET /fan_ids/1/edit
    def edit
    end
    
    # POST /fan_ids
    # POST /fan_ids.json
    def create
        @fan_id = FanId.new(fan_id_params)
        
        respond_to do |format|
            if @fan_id.save
                format.html { redirect_to @fan_id, notice: 'Fan was successfully created.' }
                format.json { render :show, status: :created, location: @fan_id }
            else
                format.html { render :new }
                format.json { render json: @fan_id.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # PATCH/PUT /fan_ids/1
    # PATCH/PUT /fan_ids/1.json
    def update
        success = @fan_id.update(fan_id_params)
        
        @fandom = Fandom.find(params[:fan_id][:fandom_id])
        @fandom.fan_ids << @fan_id
        fandom_name     = @fandom.name
        says_to_newbie  = @fandom.description
    
        respond_to do |format|
            if success
                # format.html { redirect_to @fan_id, notice: 'Fan was successfully updated.' }
                # format.json { render :show, status: :ok, location: @fan_id }
                format.html { redirect_to root_path, notice: "Welcome to #{fandom_name}, #{says_to_newbie}" }
            else
                format.html { render :edit }
                format.json { render json: @fan_id.errors, status: :unprocessable_entity }
            end
        end
    end
    
    # DELETE /fan_ids/1
    # DELETE /fan_ids/1.json
    def destroy
        @fan_id.destroy
        respond_to do |format|
            format.html { redirect_to fan_ids_url, notice: 'Fan was successfully destroyed.' }
            format.json { head :no_content }
        end
    end
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_fan_id
        @fan_id = FanId.find(params[:id])
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def fan_id_params
        params.require(:fan_id).permit(:user_id, :fandom_id, :fan_img, :nickname, :msg)
    end
end
