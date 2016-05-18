#!/usr/bin/ruby
require 'nokogiri'

class CompanyExtractor
    def getName(position)
        position.css('.job-list-subtitle a span').text
    end

    def getLink(position)
        position.css('.job-list-subtitle a')[0]['href']
    end
end
