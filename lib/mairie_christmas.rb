require 'nokogiri'
require 'open-uri'
require 'pry'


def get_townhall_emails(townhall_url) 
    list_email = []
    list_cities = []
    page = Nokogiri::HTML(URI.open("#{townhall_url}"))
    email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    city = page.xpath("/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a").text
    list_cities << city
    if email == ""
        list_email << "Pas d'email renseigné"
    else
        list_email << email
    end
    puts Hash[list_cities.zip(list_email)]
end


page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
link = page.xpath('//a[contains(@href, "./95/")]/@href')
list_urls = link.map {|x| "https://www.annuaire-des-mairies.com" + x.text[1..-1]}

list_urls.each {|x| get_townhall_emails(x)}

