# app/controllers/officers_controller.rb

class OfficersController < ApplicationController
  def index
    @officers = Officer.created_at_desc
    if params[:sort] == "arrest_count"
      @officers = Officer.arrest_sort
    elsif params[:sort] == "reset_sort"
      @officers = Officer.created_at_desc
    else
      @officers = Officer.created_at_desc
    end
  end

  def new
    
  end

  def show
    @officer = Officer.find(params[:id])
  end

  def edit
    @officer = Officer.find(params[:id])
  end
  
  def create
    officer = Officer.new(officer_params)
    officer.save
    redirect_to '/officers'
  end

  def update
    @officer = Officer.find(params[:id])
    @officer.update(officer_params)
    redirect_to "/officers/#{@officer.id}"
  end

  def destroy
    @officer = Officer.find(params[:id])
    @officer.destroy
    redirect_to '/officers'
  end


private
  def officer_params
    params.permit(:name, :badge_number, :under_investigation)
  end
end