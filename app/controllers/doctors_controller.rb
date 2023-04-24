class DoctorsController < ApplicationController
  def show
    @doctor = Doctor.find(params[:id])
    @doctor_hospital = @doctor.hospital_name
    @patients = @doctor.patients
  end

end