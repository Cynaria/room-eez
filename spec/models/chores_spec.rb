require "spec_helper"

describe Chore do
	# hard coded in USER_ID, need to get associations working
	let(:chore) {Chore.new(:name => "Laundry", :description => "Clean my clothes", :happen_at => Time.now, :creator_id => 1)}

	describe "#name" do
		it "should return the chore name" do
			expect(chore.name).to eq "Laundry"
		end

		it { chore.should validate_presence_of(:name) }
	end

	describe "#description" do
		it "should return the chore description" do
			expect(chore.description).to eq "Clean my clothes"
		end
	end

	describe "#happen_at" do
		it "should be a date" do
			expect(chore.happen_at).to be_a_kind_of(Date)
		end
		it { chore.should validate_presence_of(:happen_at)}
	end

	describe "#creator_id" do
		it "should be an integer" do 
			expect(chore.creator_id).to eq 1
		end
	end
end
