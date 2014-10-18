#require 'minitest'
require 'minitest/autorun'
require 'minitest/rg'
require './scraper.rb'
#require_relative 'executable'

teststation = {
'1' => '新竹地區',
'2' => '竹東地區',
'3' => '關西地區',
'4' => '桃園地區',
'5' => '苗栗地區',
'6' => '國道班車資訊',
'7' => '一般公路資訊',
'8' => '新竹市區公車',
'9' => '桃園縣市區公車資訊',
'10' => '免費公車資訊'
}

describe "station" do

before do
 @found= WebScraper.busstation
end

it 'same' do
@found['1'].must_equal Data.parse(teststation['1'])
end
end


