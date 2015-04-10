# Hace aproximadamente 100 años internet, o lo que es lo mismo unos 10 años del calendario gregoriano, 
# estaba en pleno furor que los websites de noticias, o en general, 
# tuvieran lo que se denominaba los RSS... Lo que permitía a los usuarios leer noticias centralizadas 
# en un RSS Reader... Queda de parte de ustedes investigar sobre esta bonita parte de la historia del internet.

# Actualmente, ya este tipo de difusión no es tan popular... Y muchos sitios ofrecen sus noticias en formato JSON.

# Se requiere que ustedes hagan clases en ruby que permitan consumir las APIs de estos 3 populares sitios de 
# noticias en internet:

# Sitio: Mashable, API-Endpoint: http://mashable.com/stories.json

# Sitio: digg, API-Endpoint: http://digg.com/api/news/popular.json

# Sitio: Reddit, API-Endpoint: http://www.reddit.com/.json

# De todos los sitios lo que nos interesa obtener es: Autor, título, fecha y link de la noticia.

# Deben ustedes entonces crear las clases en ruby que soporten este requerimiento.

# La entrega debe hacerse vía github.

require 'httparty'
require 'colorize'
class Mashable
	include HTTParty
	
	base_uri 'http://mashable.com/stories.json'
	
	def print
		puts "===========================================================================".colorize(:yellow)
		puts "\tNoticias de Mashable: hot"
		notice = self.class.get('')
		notice["hot"].each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Title: #{feed["title"]}"
			puts "Author: #{feed["author"]}"
			puts "Date: #{feed["post_date"]}"
			puts "Link: #{feed["link"]}"
		end
	end
	def titles
		puts "===========================================================================".colorize(:yellow)
		puts "\tTitulos de Mashable: hot"
		notice = self.class.get('')
		notice["hot"].each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Title: #{feed["title"]}"
		end
	end
	def authors
		puts "===========================================================================".colorize(:yellow)
		puts "\tAutores de Mashable: hot"
		notice = self.class.get('')
		notice["hot"].each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Autrhor: #{feed["author"]}"
			end
	end
	def dates
		puts "===========================================================================".colorize(:yellow)
		puts "\tFechas de Mashable: hot"
		notice = self.class.get('')
		notice["hot"].each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Date: #{feed["post_date"]}"
		end
	end
	def links
		puts "===========================================================================".colorize(:yellow)
		puts "\tLinks de Mashable: hot"
		notice = self.class.get('')
		notice["hot"].each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Link: #{feed["link"]}"
		end
		
	end
end

class Digg < Mashable
	include HTTParty
	base_uri 'http://digg.com/api/news/popular.json'
	def print
		puts "===========================================================================".colorize(:blue)
		puts "\tNoticias de Digg"
		notice = self.class.get('')
		#notice2 = notice["data"]["feed"][0]["content"]["title_alt"]
		notice2 = notice["data"]["feed"]
		notice2.each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Title: #{feed["content"]["title_alt"]}"
			puts "Author: #{feed["content"]["author"]}"
			puts "Date:#{Time.at(feed["date_published"])}"
			puts "Link: #{feed["content"]["url"]}"
		end
	end
	def titles
		puts "===========================================================================".colorize(:blue)
		puts "\tTitulos de Digg"
		notice = self.class.get('')
		notice2 = notice["data"]["feed"]
		notice2.each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Title: #{feed["content"]["title_alt"]}"
		end
	end
	def authors
		puts "===========================================================================".colorize(:blue)
		puts "\tAutores de Digg"
		notice = self.class.get('')
		notice2 = notice["data"]["feed"]
		notice2.each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Author: #{feed["content"]["author"]}"
		end
	end
	def dates
		puts "===========================================================================".colorize(:blue)
		puts "\tFechas de Digg"
		notice = self.class.get('')
		notice2 = notice["data"]["feed"]
		notice2.each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Date:#{Time.at(feed["date_published"])}"
		end
	end
	def links
		puts "===========================================================================".colorize(:blue)
		puts "\tLinks de Digg"
		notice = self.class.get('')
		notice2 = notice["data"]["feed"]
		notice2.each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Link: #{feed["content"]["url"]}"
		end
		
	end
end

class Reddit < Digg
	include HTTParty
	base_uri 'http://www.reddit.com/.json'
	def print
		puts "===========================================================================".colorize(:red)
		puts "\tNoticias de Reddit"
		notice = self.class.get('')
		notice2 = notice["data"]["children"]
		notice2.each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Title: #{feed["data"]["title"]}"
			puts "Author: #{feed["data"]["author"]}"	
			puts "Date: #{Time.at(feed["data"]["created_utc"])}"
			puts "Link: #{feed["data"]["url"]}"
		end
	end
	def titles
		puts "===========================================================================".colorize(:red)
		puts "\tTitulos de Reddit"
		notice = self.class.get('')
		notice2 = notice["data"]["children"]
		notice2.each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Title: #{feed["data"]["title"]}"
		end
	end
	def authors
		puts "===========================================================================".colorize(:red)
		puts "\tAutores de Reddit"
		notice = self.class.get('')
		notice2 = notice["data"]["children"]
		notice2.each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Author: #{feed["data"]["author"]}"	
		end
	end
	def dates
		puts "===========================================================================".colorize(:red)
		puts "\tFechas de Reddit"
		notice = self.class.get('')
		notice2 = notice["data"]["children"]
		notice2.each do |feed|	
			puts "===========================================================================".colorize(:green)
			puts "Date: #{Time.at(feed["data"]["created_utc"])}"
		end
	end
	def links
		puts "===========================================================================".colorize(:red)
		puts "\tLinks de Reddit"
		notice = self.class.get('')
		notice2 = notice["data"]["children"]
		notice2.each do |feed|
			puts "===========================================================================".colorize(:green)
			puts "Link: #{feed["data"]["url"]}"
		end
		
	end
end

class Mi_api < Reddit
	def all_notice
		$notice1.print
		$notice2.print
		$notice3.print
	end
	def noti_mashable
		$notice1.print
	end
	def mashable_titles
		$notice1.titles
	end
	def mashable_authors
		$notice1.authors
	end
	def mashable_dates
		$notice1.dates
	end
	def mashable_links
		$notice1.links
	end

	def noti_digg
		$notice2.print
	end
	def digg_titles
		$notice2.titles
	end
	def digg_authors
		$notice2.authors
	end
	def digg_dates
		$notice2.dates
	end
	def digg_links
		$notice2.links
	end

	def noti_reddit
		$notice3.print
	end
	def reddit_titles
		$notice3.titles
	end
	def reddit_authors
		$notice3.authors
	end
	def reddit_dates
		$notice3.dates
	end
	def reddit_links
		$notice3.links
	end
end

def main
	$notice1 = Mashable.new
	$notice2 = Digg.new
	$notice3 = Reddit.new
	mi_api = Mi_api.new 
	while true
		puts "Seleccioone de que lugar quiere ver las noticias:\n\t1. Mashable.\n\t2. Digg.\n\t3. Reddit.\n\t4. Todas."
		option = gets.chomp.to_s
		if !["1","2","3","4"].include?(option)
			puts "Por favor elija una opcion valida\n\tRecuerde que solo hay 4 opciones validas"	
			redo
		end
		break
	end
	case option
		when "1" 
			while true
				puts "Que dato de las noticias desea ver?\n\t1. Titulo.\n\t2. Autor.\n\t3. Fecha.\n\t4. Link.\n\t5. Todos."
				option = gets.chomp.to_s
				if !["1","2","3","4","5"].include?(option)
					puts "Debes seleccionar uno opcion valida del 1 al 5"
					redo
				end
				break
			end
			if option == "1"
				mi_api.mashable_titles
			elsif option == "2"
				mi_api.mashable_authors
			elsif option == "3"
				mi_api.mashable_dates
			elsif option == "4"
				mi_api.mashable_links
			else
				mi_api.noti_mashable			
			end
		when "2"
			while true
				puts "Que dato de las noticias desea ver?\n\t1. Titulo.\n\t2. Autor.\n\t3. Fecha.\n\t4. Link.\n\t5. Todos."
				option = gets.chomp.to_s
				if !["1","2","3","4","5"].include?(option)
					puts "Debes seleccionar uno opcion valida del 1 al 5"
					redo
				end
				break
			end
			if option == "1"
				mi_api.digg_titles
			elsif option == "2"
				mi_api.digg_authors
			elsif option == "3"
				mi_api.digg_dates
			elsif option == "4"
				mi_api.digg_links
			else
				mi_api.noti_digg			
			end
		when "3"
			while true
				puts "Que dato de las noticias desea ver?\n\t1. Titulo.\n\t2. Autor.\n\t3. Fecha.\n\t4. Link.\n\t5. Todos."
				option = gets.chomp.to_s
				if !["1","2","3","4","5"].include?(option)
					puts "Debes seleccionar uno opcion valida del 1 al 5"
					redo
				end
				break
			end
			if option == "1"
				mi_api.reddit_titles
			elsif option == "2"
				mi_api.reddit_authors
			elsif option == "3"
				mi_api.reddit_dates
			elsif option == "4"
				mi_api.reddit_links
			else
				mi_api.noti_reddit			
			end
		when "4" 
			mi_api.all_notice
	end
end
main
