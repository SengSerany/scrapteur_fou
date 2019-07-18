require 'nokogiri'
require 'open-uri'
require 'pry'



def get_townhall_email
townhall_url = "https://www.annuaire-des-mairies.com/95/avernes.html"
page = Nokogiri::HTML(open(townhall_url))
email_mairie = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
return email_mairie.text
end

def get_townhall_urls
array_nom = []
annuaire_des_mairies = 'https://www.annuaire-des-mairies.com/val-d-oise.html'
page = Nokogiri::HTML(open(annuaire_des_mairies))
	page.xpath('//a[@class ="lientxt"]').each do |x|
	array_nom << x['href'].sub!(".","http://annuaire-des-mairies.com")
	return array_nom.flatten
	end
end

def get_townhall_mail(get_townhall_urls)
	array_mail_mairie = []
	get_townhall_urls.each do |x|
		page = Nokogiri::HTML(open(x))
			mail_mairie = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
			puts mail_mairie.text
	end
end

puts get_townhall_mail(get_townhall_urls)
