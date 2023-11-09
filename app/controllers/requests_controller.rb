class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
    else
      render root_path, status: :unprocessable_entity
    end
  end


  private

  def request_params
    params.require(:request).permit(:address)
  end
end
