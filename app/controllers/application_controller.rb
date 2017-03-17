class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
        
    def except_attributes
        %w(id created_at updated_at)
    end
    
    
    
    # ==========================
    protected
    
    def currnet_fanid
        current_user.fan_ids.now
    end
    
    # 디바이스의 소셜로그인 기능에 접근함으로써 생성된 세션을
    # 초기화 하기 위한 함수들 입니다.
    # 더불어, 다른 컨트롤러로부터 캡슐화된 메소드들을 사용할 수 있습니다.
    def twitter_session
        @twitter_session = nil
        @twitter_session = session["devise.twitter_data"] if session["devise.twitter_data"]
    end
    
    def facebook_session
        @facebook_session = nil
        @facebook_session = session["devise.facebook_data"] if session["devise.facebook_data"]
    end
    
    def google_session
        @google_session = nil
        @google_session = session["devise.google_data"] if session["devise.google_data"]
    end

    def ugly_session_destroy
        unless current_user
            session["devise.twitter_data"]  = nil if twitter_session
            session["devise.facebook_data"] = nil if facebook_session
            session["devise.google_data"]   = nil if google_session
        end
    end
    
    # 로그인이 반드시 필요한 접근에 대해 로그인 여부를 확인하는 함수입니다.
    # 만일 로그인이 되어있지 않은 상태에서 어떤 함수를 접근하고자 한다면 다음의 함수를 거쳐 통과 여부를 가린 뒤
    # 통과하지 못하는 경우, 이전 페이지로 되돌아 갑니다.
    # 이 경우, redirect 된 페이지에서, flash[:message] 를 사용할 수 있고,
    # 이를 통해 조금 전 실행했던 접근 또는 행동이 로그인이 되어있지 않아 접근에 실패하였음을 안내할 수 있습니다.
    def login_confirm
        msg = 'Oops, you have to sign in first~ :)'
        redirect_to :back, flash: { message: msg } unless current_user
    end
end
