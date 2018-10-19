# == Schema Information
#
# Table name: vehicles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  type       :integer
#  make       :integer
#  model      :integer
#  year       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "net/ftp"
require 'mechanize'
require 'watir'
class Vehicle < ApplicationRecord
  belongs_to :user
  # has_many :products
  def self.scrape_vehicles
    years = (1996..2019).to_a
    self.get_page
  end

  def self.get_page
    a = Mechanize.new
    year_json = {}
    browser = Watir::Browser.new
    browser.goto 'https://www.rockymountainatvmc.com/p/1191/38732/Tusk-SubZero-Snow-Plow-Kit-Winch-Equipped-ATV-50%22-Blade'
    ['ida', 'id8', 'id9']
    binding.pry
  end

end
