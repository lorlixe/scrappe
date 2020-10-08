require 'open-uri'
require 'nokogiri'



#Cette méthode compt le nombre de villes et range dans un table les noms des villes



# cette méthode récupère l'adresse mail d'une mairie
def get_townhall_email(townhall_url)

	doc = Nokogiri::HTML(URI.open(townhall_url))

	townhall_email = "a"
	doc.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |a|
		townhall_email = a.text
	end

	return townhall_email
	
end

#get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")



def get_townhall_url_scrapper




	doc = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
	
	
	town_table = []
	
	doc.xpath('//*[@class="lientxt"]').each do |v|

		town_table << v.text
	end

	doc = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com/val-d-oise.html'))
	
	i = 0
	arry = []
	doc.xpath('//*[@class="lientxt"]').each do |url|
		email_table = Hash.new

		email_table[town_table[i]] = get_townhall_email("http://annuaire-des-mairies.com" + (url["href"]).slice(1..-1))
		i = i + 1
		arry << email_table
	end
	 
	

	puts arry
	
	
end

get_townhall_url_scrapper