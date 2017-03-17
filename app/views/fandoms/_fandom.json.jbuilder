json.extract! fandom, :id, :name, :title, :subtitle, :description, :profile_img, :bg_img, :admin_id, :artist_id, :group_id, :created_at, :updated_at
json.url fandom_url(fandom, format: :json)
