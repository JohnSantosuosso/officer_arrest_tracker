# app/controllers/officers_controller.rb

class OfficersController < ApplicationController
  def index
    @officers = Officer.all.order(created_at: :desc)
  end

  def show
    @officer = Officer.find(params[:id])
  end

end