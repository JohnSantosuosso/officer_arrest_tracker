# app/controllers/officerarrests_controller.rb

class OfficerArrestsController < ApplicationController
  def index
    @officer = Officer.find(params[:id])
    if params[:sort] == "alpha"
      @arrests = @officer.arrests.alpha_ordered
    elsif params[:entered_age]
      @arrests = @officer.arrests.age_threshold(params[:entered_age])
    else
      @arrests = @officer.arrests
    end
  end

  def new
    @officer = Officer.find(params[:id])
    @arrests = @officer.arrests
  end

  def create
    @officer = Officer.find(params[:id])
    @arrests = @officer.arrests
    @officer.arrests.create(arrest_params)
    redirect_to "/officers/#{@officer.id}/arrests"
  end

  private
    def arrest_params
      params.permit(:name, :age, :charge_description, :firearm)
    end
end