class PatientsController < ApplicationController
  
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])
    @doctor.patients.destroy(@patient)
    redirect_to doctor_path(@doctor)
  end
end
