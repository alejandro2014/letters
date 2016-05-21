#!/usr/bin/ruby
require 'nokogiri'
require 'open-uri'

require './positionExtractor.rb'
require './companyExtractor.rb'

class InfojobsScraper
    def initialize
        @positionExtractor = PositionExtractor.new
        @companyExtractor = CompanyExtractor.new
    end

    def getOffers(url)
        positionCss = @positionExtractor.getCssPosition()
        doc = Nokogiri::HTML(open(url).read)

        doc.css(positionCss).each do |position|
            infoPosition = getInfoPosition(position)
            puts infoPosition

            infoCompany = getInfoCompany(position)
            puts infoCompany
        end
    end

    def getInfoPosition(position)
        {
            "name" =>           @positionExtractor.getName(position),
            "link" =>           @positionExtractor.getLink(position),
            "location" =>       @positionExtractor.getLocation(position),
            "contractType" =>   @positionExtractor.getContractType(position),
            "employmentType" => @positionExtractor.getEmploymentType(position),
            "salary" =>         @positionExtractor.getSalary(position),
            "date" =>           @positionExtractor.getDate(position)
        }
    end

    def getInfoCompany(position)
        {
            "companyName" => @companyExtractor.getName(position),
            "companyLink" => @companyExtractor.getLink(position)
        }
    end
end

scraper = InfojobsScraper.new
scraper.getOffers("../docs/list.xhtml")
