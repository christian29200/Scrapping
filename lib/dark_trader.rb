require 'rubygems'
require 'nokogiri'
require 'open-uri'



def create_crypto_hash
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/")) #se connecte à la page

  i = 0
  symbol_list = [] #Naming choice by Melina 
  value_list = [] # <- naming variables like this actually MAKES SENSE
  begin
    loop do
      i += 1
      #puts i
      symbol = page.xpath("//*[@id=\"__next\"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[3]/div")
        symbol_list << symbol.text
      value = page.xpath("//*[@id=\"__next\"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[#{i}]/td[5]/div/a")
        value_list << value.text
      if i ==20
        break
      end 
  end
  rescue => e
    puts "Oups petite erreur, mais c'est pas grave" #résultat que tu veux voir en lieu et place d'une erreur terminal
  end

 return Hash[symbol_list.zip(value_list)]
end

puts create_crypto_hash
