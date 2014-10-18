gem "minitest"
require 'minitest/autorun'
require_relative "../executable"


describe Busgogo  do

	describe "when choose 1" do
 		it "data won't be empty" do
 		busgogo = Busgogo.new(1)
  	  	data.wont_be_empty
  	end
  end

	describe "when choose 2" do
 		it "data & Station won't be empty" do
  	  	busgogo = Busgogo.new(2)
  	  	data.wont_be_empty
  	  	stattion.wont_be_empty
  	end
end

	describe "when choose 3" do
 		it "data won't be empty" do
  	  	
  	  	busgogo = Busgogo.new(3)
  	  	data.wont_be_empty
  	  	
  	end
end


	describe "when choose 4" do
 		it "outputfile " do
  	  	
  	  	busgogo = Busgogo.new(4)
  	  	file_output.wont_be_empty
end
  	  	
  	end


end