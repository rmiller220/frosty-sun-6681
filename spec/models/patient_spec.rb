require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'relationships' do

    it { should have_many(:patient_doctors) }
    it { should have_many(:doctors).through(:patient_doctors) }
  end

  describe 'class methods' do
    before do
      test_data
    end
    it '.adult_patients_alpha_order' do

      expect(Patient.adult_patients_aplha_order).to eq([@patient2, @patient5, @patient3, @patient6, @patient4])
    end
  end
end
