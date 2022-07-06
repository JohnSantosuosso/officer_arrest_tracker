# app/controllers/officers_controller.rb

class OfficersController < ApplicationController
  def index
    @officers = Officer.all.order(created_at: :desc)
  end

end