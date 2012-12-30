class Place < ActiveRecord::Base
  has_many :deals
  attr_accessible :name, :slug
end
