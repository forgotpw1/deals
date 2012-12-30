class Deal < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  
  belongs_to :place
  belongs_to :category
  attr_accessible :photo, :photo_cache, :remove_photo, :commission, :deleted_at, :place_id, :category_id, :description, :email, :first_line, :phone, :second_line, :website
  

end
