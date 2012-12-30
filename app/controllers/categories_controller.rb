class CategoriesController < ActionController::Base
  respond_to :json

  def index
    @categories = Category.all.map { |c| { 'id' => c.id, :name => c.name, :slug => c.slug} }
    respond_with(@categories)
  end
end
