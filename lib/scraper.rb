require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './course.rb'

class Scraper
  attr_accessor :page
  def initialize()
    @page = get_page
  end
  def get_page
    url = open("http://learn-co-curriculum.github.io/site-for-scraping/courses")
    Nokogiri::HTML(url)
  end

  def get_courses
    @page.css(".post")
  end

  def make_courses
    get_courses.each do |post|
      course = Course.new
      course.title = post.css("h2").text
      course.schedule = post.css(".date").text
      course.description = post.css("p").text
    end
  end

  def print_courses
    self.make_courses
    Course.all.each do |course|
      if course.title && course.title != ""
        puts "Title: #{course.title}"
        puts "  Schedule: #{course.schedule}"
        puts "  Description: #{course.description}"
      end
    end
  end
end
