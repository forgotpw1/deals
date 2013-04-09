class Deals::DealsController < ActionController::Base
  respond_to :json

  def index
    place = params[:place]
    category = params[:category]

    if place.present?
      places = Place.where(:slug => place)
      place_id = places.first.id if places.any?
    end

    if category.present?
      categories = Category.where(:slug => category)
      category_id = categories.first.id if categories.any?
    end

    if place_id.present? && category_id.present? 
      @deals = Deal.where(:place_id => place_id, :category_id => category_id)
    elsif place_id.present?
      @deals = Deal.where(:place_id => place_id)
    elsif category_id.present?
      @deals = Deal.where(:category_id => category_id)
    else
      @deals = Deal.all
    end

    respond_with(@deals)
  end
end
