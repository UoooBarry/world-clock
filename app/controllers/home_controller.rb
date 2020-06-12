class HomeController < ApplicationController
  @@cities||= []

  def index
    melbourne = Utc.find_by_value("Australia/Melbourne")
    tokyo = Utc.find_by_value("Asia/Tokyo")
    dan = Utc.find_by_value("America/Danmarkshavn")
    ma = Utc.find_by_value("Asia/Magadan")
    ab = Utc.find_by_value("America/Anchorage")
    @@cities = [melbourne, tokyo, ma, dan,ab]

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
