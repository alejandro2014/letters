#!/usr/bin/ruby
require 'nokogiri'

class PositionExtractor
    def getCssPosition()
        "#offer-list li[@itemtype = 'http://schema.org/JobPosting']"
    end

    def getLink(position)
        position.css('.content-top .content-type-text .job-list-title a')[0]['href']
    end

    def getName(position)
        position.css('.content-top .content-type-text .job-list-title a span').text
    end

    def getLocation(position)
        position.css('.tag-group .tag-divider')[0].css('span').text
    end

    def getContractType(position)
        position.css('.tag-group')[1].css('.tag-divider')[0].text
    end

    def getEmploymentType(position)
        position.css('.tag-group')[1].css('.tag-divider')[1].text
    end

    def getSalary(position)
        position.css('.tag-group')[1].css('li')[2].text
    end

    def getDate(position)
        position.css('meta')[0]['content']
    end
end
