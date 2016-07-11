require 'test_helper'

class TransportationTest < ActiveSupport::TestCase

	describe '#self.ordered' do 
		it 'orders the query by the run number (ascending)' do 
			record_one = Transportation.new({train_line: 'El', route: 'Hiawatha', run_number: 'A005', operator_id: 'LBeck'})
			record_two = Transportation.new({train_line: 'Metra', route: 'Chicago', run_number: 'M324', operator_id: 'SIlgin'})
			expect(Transportation.ordered).to eql [record_one, record_two]
		end
	end


end
