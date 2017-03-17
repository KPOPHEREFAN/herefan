class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
        
    def except_attributes
        %w(id created_at updated_at)
    end
    
    
    
    # ==========================
    protected
    
    def twitter_session
        @twitter_session = session["devise.twitter_data"]
    end
    
    def facebook_session
        @facebook_session = session["devise.facebook_data"]
    end
    
    def google_session
        @google_session = session["devise.google_data"]
    end

    def ugly_session_destroy
        unless current_user
            session["devise.twitter_data"]  = nil if twitter_session
            session["devise.facebook_data"] = nil if facebook_session
            session["devise.google_data"]   = nil if google_session
        end
    end
end
