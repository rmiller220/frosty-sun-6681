require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it {should belong_to :hospital}
    it {should have_many :patient_doctors}
    it {should have_many(:patients).through(:patient_doctors)}
  end

  describe 'instance methods' do
    before do
      test_data
    end

    it '#hospital_name' do

      expect(@doctor1.hospital_name).to eq(@hospital1.name)
      expect(@doctor2.hospital_name).to eq(@hospital1.name)
    end
  end
end
