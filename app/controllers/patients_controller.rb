class PatientsController < ApplicationController
  def index
    @adult_patients = Patient.adult_patients_aplha_order
  end
  def destroy
    @doctor = Doctor.find(params[:doctor_id])
    @patient = Patient.find(params[:id])
    @doctor.patients.destroy(@patient)
    redirect_to doctor_path(@doctor)
  end
end
