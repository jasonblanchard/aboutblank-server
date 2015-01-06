class Api::V2::GoodreadsEventsController < ApplicationController

  def index
    @events = GoodreadsEvent.recent
    render :json=> @events
  end

  def show
    @event = GoodreadsEvent.find(params[:id])
    render :json => @event
  end
end
