require 'open-uri'
require 'nokogiri'



#Cette méthode compt le nombre de villes et range dans un table les noms des villes



# cette méthode récupère l'adresse mail d'une mairie
def get_member_of_parlement_email(member_of_parlement_url)

	doc = Nokogiri::HTML(URI.open(member_of_parlement_url))

	member_of_parlement_email = "a"
	doc.xpath('/html/body/div/div[3]/div/div/div/section[1]/div/article/div[3]/div/dl/dd[4]/ul/li[2]/a').each do |a|
		member_of_parlement_email = a.text
	end

	puts member_of_parlement_email

	return member_of_parlement_email
	
end



#get_townhall_email("https://www.annuaire-des-mairies.com/95/avernes.html")



def get_depute_url_scrapper




	doc = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
	
	
	member_of_parlement_table = []
	
	doc.xpath('//a[starts-with(@href, "/deputes")]').each do |v|

		member_of_parlement_table << v.text
	end

	doc = Nokogiri::HTML(URI.open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
	
	i = 0
	arry = []
	doc.xpath('//a[starts-with(@href, "/deputes")]').each do |url|
		parlement_table = Hash.new

		parlement_name = url.text.slice(3..-3).split(" ")
		parlement_last_name = parlement_name.delete(parlement_name.last)
		parlement_first_name = parlement_name.delete(parlement_name.first)

		parlement_table = {"first_name" => parlement_first_name, "laste_name" => parlement_last_name, "email" =>  get_member_of_parlement_email("http://www2.assemblee-nationale.fr" + (url["href"]))}

		#email_table["EMAIL"] =
		#email_table["NOM"] = url.text.slice(3..-3)
		#i = i + 1
		arry << parlement_table
	end
	 
	

	puts arry
	
	
end

get_depute_url_scrapper

