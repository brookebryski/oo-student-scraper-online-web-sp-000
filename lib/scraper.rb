require 'open-uri'
require 'pry'

class Scraper
  def self.scrape_index_page(index_url)
    page = Nokogiri::HTML(open(index_url))
    students = []

    page.css("div.student-card").each do |student|
      name = student.css(".student-name").text
      location = student.css(".student-location").text
      profile_url = student.css("a").attribute("href").value
      student_info = {:name => name,
                :location => location,
                :profile_url => profile_url}
      students << student_info
      end
    students
   end

def self.scrape_profile_page(profile_url)
  page = Nokogiri::HTML(open(profile_url))
  student = {}

page.css("div.main-wrapper.profile .social-icon-container a").each do |profile|
  if
    profile.attribute("href").value.include?("twitter")
    student[:twitter] = profile.attribute("href").value
  elsif
     profile.attribute("href").value.include?("linkedin")
    student[:linkedin] = profile.attribute("href").value
  elsif
     profile.attribute("href").value.include?("github")
      student[:github] = profile.attribute("href").value
  elsif
     profile.attribute("href").value.include?("blog")
      student[:blog] = profile.attribute("href").value
  elsif
     profile.attribute("href").value.include?("profile_quote")
    student[:profile_quote] = profile.attribute("href").value
  elsif
     profile.attribute("href").value.include?("bio")
    student[:bio] = profile.attribute("href").value
      end
    end
  end
end

=begin
   def self.scrape_profile_page(profile_url)
      student_profile = {}
      html = open(profile_url)
      profile = Nokogiri::HTML(html)

profile.css("div.main-wrapper.profile .social-icon-container a").each do |social|
     if social.attribute("href").value.include?("twitter")
       student_profile[:twitter] = social.attribute("href").value
     elsif social.attribute("href").value.include?("linkedin")
       student_profile[:linkedin] = social.attribute("href").value
     elsif social.attribute("href").value.include?("github")
       student_profile[:github] = social.attribute("href").value
     else
       student_profile[:blog] = social.attribute("href").value
     end
   end

   student_profile[:profile_quote] = profile.css("div.main-wrapper.profile .vitals-text-container .profile-quote").text
   student_profile[:bio] = profile.css("div.main-wrapper.profile .description-holder p").text

   student_profile
 end
end
=end
