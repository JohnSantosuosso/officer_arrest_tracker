# app/controllers/officerarrests_controller.rb

class ArrestsController < ApplicationController
  def index
    @arrests = Arrest.has_firearm
  end
  
  def show
    @arrest = Arrest.find(params[:id])
  end

  def edit
    @arrest = Arrest.find(params[:id])
  end

  def update
    arrest = Arrest.find(params[:id])
    arrest.update(arrest_params)
    redirect_to action: 'show'
  end

  def destroy
    @officer = Officer.find(params[:id])
    @arrest = Arrest.find(params[:id])
    @arrest.destroy
    redirect_to "/officers/#{@officer.id}/arrests"
  end

private
  def arrest_params
    params.permit(:name, :age, :charge_description, :firearm)
  end

end