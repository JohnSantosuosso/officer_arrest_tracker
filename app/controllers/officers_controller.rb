# app/controllers/officers_controller.rb

class OfficersController < ApplicationController
  def index
    @officers = Officer.all.order(created_at: :desc)
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
    officer = Officer.find(params[:id])
    officer.update(officer_params)
    redirect_to action: 'show' #updates and returns to updated user's show action
  end


private
  def officer_params
    params.permit(:name, :badge_number, :under_investigation)
  end
end