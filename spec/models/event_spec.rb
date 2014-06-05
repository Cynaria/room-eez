require 'spec_helper'

describe Event do
	# hard coded in USER_ID, need to get associations working
  let(:event) {Event.new(:name => "Graduation", :description => "Real life approaching", :when => "2 weeks!",:creator_id => 1)}

 	describe "#name" do
 	  it "returns the name of the event" do
 	  	expect(event.name).to eq "Graduation"
 	  end
 	end

 	describe "#description" do 
 		it "returns the description of the event" do 
 			expect(event.description).to eq "Real life approaching"
 		end
 	end

 	describe "#when" do 
 		it "returns the designated event happening time" do
 			expect(event.when).to eq "2 weeks!"
 		end
 	end

 	describe "#creator_id" do
 		it "returns the ID of the person who created the event" do
 			expect(event.creator_id).to eq 1
 		end
 	end

 	context "validates presence of" do
 		# user_id is will be validated added through logic
 		# shouldn't HAVE to include description
 		it { event.should validate_presence_of(:name) }
 		it { event.should validate_presence_of(:when) }
 		it { event.should validate_presence_of(:created_at)}

 	end


end
