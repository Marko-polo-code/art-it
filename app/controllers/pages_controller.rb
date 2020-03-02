class PagesController < ApplicationController
  def home
    @collections = Collection.all
  end

  def dashboard
  end
end
