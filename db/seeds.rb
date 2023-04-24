# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@hospital1 = Hospital.create!(name: "Grey Sloan Memorial Hospital")
@hospital2 = Hospital.create!(name: "Chicago General Hospital")
@hospital3 = Hospital.create!(name: "New York Hospital")
@doctor1 = @hospital1.doctors.create!(name: "Meredith Grey", specialty: "General Surgery", university: "Harvard University")
@doctor2 = @hospital1.doctors.create!(name: "John Smith", specialty: "Pediatrics", university: "Indiana University")
@doctor3 = @hospital2.doctors.create!(name: "Michael Jordan", specialty: "Neuro", university: "Stanford University")
@doctor4 = @hospital2.doctors.create!(name: "Kobe Bryant", specialty: "Ortho", university: "Stanford University")
@patient1 = Patient.create!(name: "Aspen Miller", age: 4)
@patient2 = Patient.create!(name: "Ashley Martin", age: 35)
@patient3 = Patient.create!(name: "Brittany Spears", age: 25)
@patient4 = Patient.create!(name: "Steph Curry", age: 35)
@patient5 = Patient.create!(name: "Beyonce Knowles", age: 38)
@patient6 = Patient.create!(name: "Joyner Lucas", age: 30)
@patient_doctor1 = PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @doctor1.id)
@patient_doctor2 = PatientDoctor.create!(patient_id: @patient2.id, doctor_id: @doctor1.id)
@patient_doctor3 = PatientDoctor.create!(patient_id: @patient3.id, doctor_id: @doctor2.id)
@patient_doctor4 = PatientDoctor.create!(patient_id: @patient4.id, doctor_id: @doctor2.id)
@patient_doctor5 = PatientDoctor.create!(patient_id: @patient5.id, doctor_id: @doctor3.id)
@patient_doctor6 = PatientDoctor.create!(patient_id: @patient6.id, doctor_id: @doctor3.id)
@patient_doctor7 = PatientDoctor.create!(patient_id: @patient1.id, doctor_id: @doctor2.id)
@patient_doctor8 = PatientDoctor.create!(patient_id: @patient2.id, doctor_id: @doctor2.id)