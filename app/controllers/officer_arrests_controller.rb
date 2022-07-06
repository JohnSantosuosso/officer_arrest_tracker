# app/controllers/officerarrests_controller.rb

class OfficerArrestsController < ApplicationController
  def index
    @officer = Officer.find(params[:id])
    @arrests = @officer.arrests
  end
end