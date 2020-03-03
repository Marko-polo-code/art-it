class CollectionsController < ApplicationController
  def index
    @collections = Collection.all
  end

  def show
    @collection = Cocktail.find
  end
end
