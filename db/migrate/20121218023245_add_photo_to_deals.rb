class AddPhotoToDeals < ActiveRecord::Migration
  def change
    add_column :deals, :photo, :string
  end
end
