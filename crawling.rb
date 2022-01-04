#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

page = 1

loop do
    html = URI.open("http://github.com/rails/rails/pulls?page=#{page}")
    
    doc = Nokogiri::HTML(html)

    blank_icon = doc.css('svg.octicon.octicon-git-pull-request.blankslate-icon')
 
    break unless blank_icon.empty?

    doc.css('a.no-underline.h4').each do |link|
        
        puts link.content

    end

    page += 1

end















