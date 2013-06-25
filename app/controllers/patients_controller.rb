class PatientsController < ApplicationController
  def show
    @patient = Patient.first(:full_name => params[:id])
  end
end
