require 'rails_helper'

RSpec.describe Transportation, type: :model do
	
	describe '#self.ordered' do 
		it 'orders the query by the run number (ascending)' do 
			record_two = Transportation.create!({train_line: 'Metra', route: 'Chicago', run_number: 'M324', operator_id: 'SIlgin'})
			record_one = Transportation.create!({train_line: 'El', route: 'Hiawatha', run_number: 'A005', operator_id: 'LBeck'})
			expect(Transportation.ordered.first.run_number).to eql "A005"
		end
  end  

  describe '#self.find_run_number(num)' do
  	it 'finds a record based on its run number' do
			record_one = Transportation.create!({train_line: 'El', route: 'Hiawatha', run_number: 'A005', operator_id: 'LBeck'})
			expect(Transportation.find_run_number("A005").first).to eql record_one
  	end
  end

  it 'only accepts unique run numbers' do 
  	record_one = Transportation.create!({train_line: 'El', route: 'Hiawatha', run_number: 'A005', operator_id: 'LBeck'})
  	record_two = {train_line: 'Metra', route: 'Chicago', run_number: 'A005', operator_id: 'SIlgin'}
  	expect{Transportation.create!(record_two)}.to raise_error
  end

  it "It only accepts 'El', 'Metra', and 'Amtrak' as valid train lines" do
  	record_one = {train_line: 'Nine', route: 'Chicago', run_number: 'A005', operator_id: 'SIlgin'}
  	expect{Transportation.create!(record_one)}.to raise_error
  end

  it "replaces a blank entry with 'unknown'" do 
  	record_one = Transportation.create!({train_line: 'El', route: '', run_number: 'A005', operator_id: 'LBeck'})
  	expect(Transportation.first.route).to eql 'unknown'
  end

end
