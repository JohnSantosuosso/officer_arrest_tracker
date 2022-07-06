# app/controllers/officerarrests_controller.rb

class ArrestsController < ApplicationController
  def index
    @arrests = Arrest.all
  end
end