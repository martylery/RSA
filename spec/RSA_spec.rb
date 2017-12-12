require_relative "../lib/RSA.rb"

RSpec.describe RSA do 
	
	msg = "Hello, world!"

	try = RSA.new(123, 234, 345)
	keys = try.new_key
	randomize = RSA.new(keys[0], keys[1], keys[2])


	context "returning values" do
		it "returns value of n" do
			expect(try.n).to eq keys[0]
		end

		it "returns value of e" do
			expect(try.e).to eq keys[1]
		end

		it "returns value of d" do
			expect(try.d).to eq keys[2]
		end
	end

	context "new_key" do
		it "is three element array" do
			expect(keys.size).to eq 3
		end

		it "generates array[int]" do
			expect(keys).to all be_an(Integer)
		end
	end

	it "ecpects correctly handling of messages" do
		expect(try.decrypt(try.encrypt(msg))).to eq msg
	end



	msg = "adfnajAKSFNI!@1@)!#{()}"
	it "expects handling of multi-symboled messages" do
		expect(try.decrypt(try.encrypt(msg))).to eq msg
	end


end
