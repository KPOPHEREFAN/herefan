class HomeController < ApplicationController
    before_action :ugly_session_destroy, only: [:index]
    before_action :login_confirm, except: [:index]
    before_action :redirect_select_fandom, except: [:select, :merge]
    
    def index
        @fandoms = Fandom.all
        @services = ["FanMap", "Community", "StarStream", "FanPoll", "FanPic", "StarQuiz"]
    end
    
    def merge
        current_user.merge
        redirect_to :back
    end
end