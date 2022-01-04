#! /usr/bin/env ruby

require 'nokogiri'
require 'open-uri'

page = 1

loop do
    html = URI.open("http://github.com/rails/rails/pulls?page=#{page}")
    
    doc = Nokogiri::HTML(html)

    blank_icon = doc.css('svg.octicon.octicon-git-pull-request.blankslate-icon')
 
    break unless blank_icon.empty?

    pr_links = doc.css('a.no-underline.h4')

    pr_links.each do |link|
        
        pr_html = URI.open("http://github.com#{link["href"]}/commits")

        pr_doc = Nokogiri::HTML(pr_html)

        commit_links = pr_doc.css('a.tooltipped.tooltipped-sw.btn-outline.btn.BtnGroup-item.text-mono.f6') 

        commit_links.each do |commit_link|

            puts commit_link.content

        end

        puts '---'
    end

    page += 1

end




#megnyitjuk a pullrequesteket, bemegyünk a commits fülbe, végigmegyünk az egyes commitokon, eltároljuk az egyes fájlok egyes sorainak változásait commitonként,
# ahol duplikáció van az a pullrequest kiválasztásra kerül










