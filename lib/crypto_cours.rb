require 'nokogiri'
require 'open-uri'
require 'pry'

def url_page
	Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
end

def extract_crypto_monney_name(url_page)
	name_array = []
	name_cryptos = url_page.xpath('//*/td[2]/span/a')
		name_cryptos.each do |monnaie|
		name_array << monnaie.text
end
return name_array
end

def cours_crypto(url_page)
	cours_array = []
	cours = url_page.xpath('//*/td[5]/a')
	cours.each do |dollar|
		cours_array << dollar.text
end
return cours_array
end

def hash_crypto
	crypto = extract_crypto_monney_name(url_page).flatten
	cours = cours_crypto(url_page).flatten
	hash = crypto.zip(cours).to_h
	return hash_crypto
end