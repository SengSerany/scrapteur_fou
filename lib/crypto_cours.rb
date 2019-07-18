require 'nokogiri'
require 'open-uri'
require 'pry'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

def crypto
	name = page.xpath('//*/td[2]/span/a')
	cours = page.xpath('//*/td[5]/a')

	cours_array = []
	name_array = []

	name.each do |x|
		name_array << x.text
	end

	cours.each do |x|
		cours_array << x.text

	end

	hash = name_array.flatten.zip(cours_array.flatten).to_h
	puts hash
end

