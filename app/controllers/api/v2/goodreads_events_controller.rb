class Api::V2::GoodreadsEventsController < ApplicationController

  def index
    @events = GoodreadsEvent.recent
    render :json => @events
  end
end
