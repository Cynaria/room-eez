require "spec_helper"

describe User do
	let(:user) {User.new(:first_name => "Unicorn", :last_name => "Magic", :email => "hey@yay.com", :phone_number => "123-456-7890", :password => "hithere")}

  describe '#first_name' do
  	it "Should return the user's first name" do
	  	expect(user.first_name).to eq "Unicorn"
	  end
  end

  describe '#last_name' do
  	it "Should return the user's last name" do
	  	expect(user.last_name).to eq "Magic"
	  end
  end

  describe "#name" do
  	it "Should return the user's name" do
  		expect(user.name).to eq "Unicorn Magic"
  	end
  end

 	describe '#email' do
 		it "Should return the user's email" do
 			expect(user.email).to eq "hey@yay.com"
 		end
  end

  describe "#phone_number" do
    it "Should return the user's phone number" do
      expect(user.phone_number).to eq "123-456-7890"
    end
  end

  describe "#password_digest" do
    it "Should return the user's password hash" do
      expect(user.password_digest).to eq "hithere"
    end
  end

  context "validates presence of" do
    it {user.should validate_presence_of(:email)}
    it {user.should validate_presence_of(:phone_number)}
    it {user.should validate_presence_of(:first_name)}
    it {user.should validate_presence_of(:last_name)}
  end

  context "validates uniqueness of" do
    it {user.should validate_uniqueness_of(:email)}
  end

  describe "#email" do
    # it { user.should validate_format_of(:email).with('test@test.com') }
    it {user.should allow_value("hey@yay.com").for(:email)}
    it {user.should_not allow_value("hey.yay.com").for(:email)}
  end

  describe "#password" do
    context "should have secure password" do
      it { should have_secure_password}
    end
    context "should have at least 6 to 20 characters" do
      it { should ensure_length_of(:password).
        is_at_least(6).
        is_at_most(20) }
    end
  end

  describe "#phone number" do
    it {user.should allow_value("123-456-7890").for(:phone_number)}
    it {user.should allow_value("(123)456-7890").for(:phone_number)}
    it {user.should allow_value("1-123-456-7890").for(:phone_number)}
    it {user.should allow_value("1(1233)456-7890").for(:phone_number)}
    it {user.should_not allow_value("234567").for(:phone_number)}
  end

end


