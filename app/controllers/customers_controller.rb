class CustomersController < ApplicationController
  def notify
    begin
      customer = Customer.find(params[:id])
      render nothing: true
    rescue ActiveRecord::RecordNotFound
      render :json => {}.to_json, :status => 404
    end
  end
end
