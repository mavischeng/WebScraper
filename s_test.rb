require 'minitest/autorun'
require 'minitest/rg'
require './scraper.rb'

teststation = [
'新竹地區',
'竹東地區',
'關西地區',
'桃園地區',
'苗栗地區',
'國道班車資訊',
'一般公路資訊',
'新竹市區公車',
'桃園縣市區公車資訊',
'免費公車資訊'
]

describe "station" do

before do
 @found= WebScraper.busstation
end

it 'same' do
@found.@station[1].must_equal Data.parse(teststation[1])
end
end


