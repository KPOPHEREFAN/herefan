class FanId < ApplicationRecord
    belongs_to :user
    belongs_to :fandom
    
    # current_user 의 fan_id 들 중, 현재 활성 상태에 있는 fan_id를 반환합니다.
    # fan_ids collection 으로부터 호출하는 때에만 유효하다는 점에 주의해주세요.
    def self.now
        find_by(active: true)
    end
    
    # current_user 의 fan_id 들 중, 활성 상태를 변경하고, 완료되면 true를 반환합니다.
    # 현재 활성 상태로 만들고자 하는 fan_id 단일 객체로 부터 호출해야만 한다는 점에 주의해주세요.
    def switch
        this_fanid = self
        me = this_fanid.user
        me.fan_ids.update_all(active: false)
        if this_fanid.update(active: true)
            return true
        end
    end
end
