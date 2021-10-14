require 'nokogiri'
require 'open-uri'
require 'pry'


def get_townhall_emails(townhall_url) 
    list_email = []
    list_cities = []
    page = Nokogiri::HTML(URI.open(townhall_url))
    email = page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text
    city = page.xpath("/html/body/div/main/section[1]/div/div/div/p[1]/strong[1]/a").text
    list_cities << city
    if email == ""
        list_email << "Pas d'email renseigné"
    else
        list_email << email
    end
    puts list_email
    puts list_cities
end

def get_townhall_urls
    list_urls = []
    page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
    link = page.xpath('//a[contains(@href, "./95/")]')
    puts link
    list_urls << link
end

get_townhall_emails("http://annuaire-des-mairies.com/95/grisy-les-platres.html")