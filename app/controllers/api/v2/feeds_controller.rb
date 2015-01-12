class Api::V2::FeedsController < ApplicationController
  def index
    render :json => [1], each_serializer: FeedsSerializer
  end
end
