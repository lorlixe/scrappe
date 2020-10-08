require 'open-uri'
require 'nokogiri'


def crypto_scrapper

	doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	symbol_crypto = []
	valeur_crypto = []
	cour_table = []
	i = 0
	#scrapping  des symboles
	#symboles = doc.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]')
	doc.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol"]').each do |node|
	 
		  symbol_crypto << node.text
		  i = i +1
	end
	#scrappring des valeurs
	#valeurs = doc.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__market-cap"]')
	doc.xpath('//*[@class="cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__market-cap"]').each do |v|
	 
		  valeur_crypto << v.text
	end
	a = 0

	while a < i
		cour_hash = Hash.new

		cour_hash[symbol_crypto[a]] = valeur_crypto[a]


		a = a + 1

		cour_table << cour_hash
		
	end

	puts cour_table
	return cour_table
	
end



#symbol_et_valeur = Hash[symbol_crypto.zip(valeur_crypto)]

#	a = []
#
#	a = [symbol_et_valeur]

#	puts a
