class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
        
    def except_attributes
        %w(id created_at updated_at)
    end

    def current_fan_id
        current_user.fan_ids.now
    end

    def my_other_fan_ids
        current_user.fan_ids.to_a - [current_fan_id]
    end

    helper_method :current_fan_id
    helper_method :my_other_fan_ids
    helper_method :my_current_fan_id_has_fandom?
    # ==========================
    protected
    
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
    
    # Fandom 을 설정하지 않은 상태로 fanId 가 돌아다녀서는 안되기 때문에,
    # fanId를 새로 생성한 경우(혹은 기타의 경우에), fandom 이 입력되지 않은 fanId 라면,
    # fandom 을 설정하는 페이지로 강제 이돌시키는 함수입니다.
    def redirect_select_fandom
        if user_signed_in?
            unless my_current_fan_id_has_fandom?
                redirect_to "/fan_ids/#{current_fan_id.id}/edit"
            end
        end
    end
    
    def my_current_fan_id_has_fandom?
        current_fan_id.fandom
    end
end
