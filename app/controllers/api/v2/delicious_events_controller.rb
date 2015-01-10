class Api::V2::DeliciousEventsController < ApplicationController
  def index
    @events = DeliciousEvent.recent
    render :json => @events
  end
end
