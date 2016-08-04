class MakesController < ApplicationController
  def index
    @makes = Make.fetch_all
  end

  def show
    @make = Make.find(params[:id])
    @models = Model.fetch_all(@make)
  end
end
