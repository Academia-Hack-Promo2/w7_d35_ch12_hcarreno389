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
class Mashable
	include HTTParty
	base_uri 'http://mashable.com/stories.json'
	def print
		puts "\tNoticias de Mashable: hot"
		notice = self.class.get('')
		notice["hot"].each do |feed|
			puts "Title: #{feed["title"]}"
			puts "Author: #{feed["author"]}"
			puts "Date: #{feed["post_date"]}"
			puts "Link: #{feed["link"]}"
		end

	end
end

class Digg
	include HTTParty
	base_uri 'http://digg.com/api/news/popular.json'
	def print
		puts "\tNoticias de Digg"
		notice = self.class.get('')
		#notice2 = notice["data"]["feed"][0]["content"]["title_alt"]
		notice2 = notice["data"]["feed"]
		notice2.each do |feed|
			puts "Title: #{feed["content"]["title_alt"]}"
			puts "Author: #{feed["content"]["author"]}"
			puts "Link: #{feed["content"]["url"]}"
			puts "date:#{Time.at(feed["date_published"])}"
		end
	end
end

class Reddit
	include HTTParty
	base_uri 'http://www.reddit.com/.json'
	def print
		puts "\tNoticias de Reddit"
		notice = self.class.get('')
		notice2 = notice["data"]["children"]
		notice2.each do |feed|
			puts "Title: #{feed["data"]["title"]}"
			puts "Author: #{feed["data"]["author"]}"
			puts "Date: #{Time.at(feed["data"]["created_utc"])}"
			puts "Link: #{feed["data"]["url"]}"
		end
	end
end
# notice = Mashable.new
# notice.print
# notice2 = Digg.new
# notice2.print
notice3 = Reddit.new
notice3.print

