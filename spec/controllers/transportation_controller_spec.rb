require 'rails_helper'

RSpec.describe TransportationController, type: :controller do

	describe 'POST create' do
		context "with valid attributes" do
			it "creates a new transportation" do 
				post :create , transportation: {train_line: 'Metra', route: 'Chicago', run_number: 'M324', operator_id: 'SIlgin'}
				expect(Transportation.count).to eql 1
			end
		end
	end

	describe 'PUT update' do 
		context "with valid attributes" do
			it "updates the attribute of a record" do
				record_one = Transportation.create!({train_line: 'El', route: 'Hiawatha', run_number: 'A005', operator_id: 'LBeck'})
				patch :update, id: record_one.id, transportation: {route: 'Boston'}
				record_one.reload
				expect(record_one.route).to eql 'Boston'
			end 
		end
	end

	describe 'DELETE #destroy' do 
		it 'deletes a specific transportation record' do 
			record_one = Transportation.create!({train_line: 'El', route: 'Hiawatha', run_number: 'A005', operator_id: 'LBeck'})
			delete :destroy, id: record_one.id
			expect(Transportation.count).to eql 0
		end
	end

end
