class Deals::PlacesController < ActionController::Base
  respond_to :json

  def index
    @places = Place.all.map { |p| { 'id' => p.id, :name => p.name, :slug => p.slug} }
    respond_with(@places)
  end
end
