class Fandom < ApplicationRecord
    # belongs_to :artist
    # belongs_to :group
    has_many :fan_ids
end
