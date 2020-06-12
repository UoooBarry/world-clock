class HomeController < ApplicationController
  @@cities||= []

  def index
    if !@@cities.any?
      melbourne = Utc.find_by_value("Australia/Melbourne")
      tokyo = Utc.find_by_value("Asia/Tokyo")
      gmt = Utc.find_by_value("Etc/GMT-10")
      city_list = [melbourne,tokyo, gmt]
      @@cities = city_list
    end
    @utcs = Utc.all
  end

  def check
    @cities = @@cities
    @check = params[:checked]
    respond_to do |format|  
      format.js
    end

  end

  def del_city
    index = params[:index]
    @@cities.delete_at(index.to_i)
    @cities = @@cities
    @check = params[:check]
    respond_to do |format|  
      format.js
    end
  end

  def add_city
    input = params[:input_city]
    puts "controller: #{input}"
    city = Utc.find_by_value(input)
    unless @@cities.include?(city)
      @@cities.push(city)
    end

    @cities = @@cities
    @check = params[:check]
    respond_to do |format|  
      format.js
    end

  end
  
end
