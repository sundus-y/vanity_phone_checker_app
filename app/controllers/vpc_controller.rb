class VpcController < ApplicationController
  def check
    @words = [params[:phone_number]]
    render json: @words
  end
end