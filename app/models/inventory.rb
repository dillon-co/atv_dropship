# == Schema Information
#
# Table name: inventories
#
#  id           :integer          not null, primary key
#  prodno       :integer
#  upc          :integer
#  mf_id        :string
#  msrp         :float
#  dealer_price :float
#  name         :string
#  qty_ut       :string
#  qty_ky       :integer
#  kit_qty      :string
#  weight       :float
#  depth        :float
#  height       :float
#  width        :float
#  discontinue  :string
#  picture      :string
#  brand        :string
#  color        :string
#  size         :string
#  ormd         :boolean
#  no_export    :boolean
#  special_ord  :boolean
#  oversize     :boolean
#  note         :text
#  rmatv_price  :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  description  :text
#

require "net/ftp"
require 'mechanize'
require "inventory_type"
class Inventory < ApplicationRecord
  #TODO add description column. scrape descriptions from web


  acts_as_copy_target

  def self.pull_inventory
    # self.delete_all
    ftp = Net::FTP.new('ftp.rockymountainatv.com', "wc5300816", "jz6HMTaR") # ftp login
    ftp.getbinaryfile("Inventory_TIER_B.csv", "Inventory_TIER_B.csv")
    puts "get ready"
    self.upload_csv_to_db
  end

  def self.upload_csv_to_db
    #  columns = ["PRODNO", "UPC", "MF_ID", "MSRP", "DEALER_PRICE", "NAME", "QTY_UT", "QTY_KY", "KIT_QTY", "WEIGHT", "DEPTH", "HEIGHT", "WIDTH", "DISCONTINUE", "PICTURE", "BRAND", "COLOR", "SIZE", "ORMD", "NO_EXPORT", "SPECIAL_ORD", "OVERSIZE", "NOTE", "RMATV_PRICE"]
    columns = ["prodno", "upc", "mf_id", "msrp", "dealer_price",
      "name", "qty_ut", "qty_ky", "kit_qty", "weight",
      "depth", "height", "width", "discontinue", "picture",
      "brand", "color", "size", "ormd", "no_export",
      "special_ord", "oversize", "note", "rmatv_price"]
     values = CSV.read(Rails.root.join('Inventory_TIER_B.csv'))
     self.import columns, values
  end

  def self.get_margins(prod=nil)
    prod ? all_products = self.where('name LIKE ?', "%#{prod}%") : all_products = self.all
    all_margins = all_products.map do |product|
      product.msrp > product.dealer_price ? product.msrp - product.dealer_price : product.rmatv_price - product.dealer_price
    end
    average_margins = all_margins.inject(&:+)/self.count
    puts "Average margin per product is $#{average_margins.round(2)}"
  end

  def self.sort_by_margins(prod=nil)
    prod ? all_products = self.where('name LIKE ?', "%#{prod}%") : all_products = self.all
    all_margins = all_products.map do |product|
      product.msrp > product.dealer_price ? [product.id, product.msrp - product.dealer_price] : [product.id, product.rmatv_price - product.dealer_price]
    end
    sorted_margins = all_margins.sort  {|a,b| b[1] <=> a[1] }
    puts sorted_margins.first(5)
  end

  def self.scrape_rockymountain_atv
    a = Mechanize.new
    a.get("https://www.rockymountainatvmc.com/Account") do |page|
      profile = open_site_and_login(page)
      ctgrs = scrape_bike_categories(profile, a)
      add_categories_to_db(ctgrs)
    end
  end

  def self.open_site_and_login(page)
    login_page = page.form_with(action: "./Login?-1.IFormSubmitListener-CSS_REF-loginForm") do |f|
       f.email='cooperracing747@gmail.com'
       f.password = 'cc1m2018'
    end.submit
    return login_page
  end

  def self.scrape_bike_categories(profile, a)
    catalog = a.click(profile.link_with(text: 'Dealer Pricing Menu'))
    catalog_list = catalog.search('h1')[0].parent
    titles = catalog_list.search('h2').map {|t| {:title => t.text}}
    titles.each_with_index do |t, i|
      puts t[:title]
      puts catalog_list.search(t[:title])
    end
    binding.pry
  end

  def self.add_categories_to_db(ctgrs)
    puts "meow"
  end

  def self.remove_size_from_name
    qp = self.where("name LIKE ?", "%Tire%")
    qp.each do |pr|
      new_name = pr.name.gsub(pr.size,'')
      pr.update(name: new_name)
    end
  end

  def self.get_all(product_query)
    queried_products = self.where("name LIKE ?", "%#{product_query}%")
    puts queried_products.count
    p_hash= {}
    queried_products.each do |prod|
      p_hash[prod.name] ||= {sizes: [], ids: []}

      p_obj = p_hash[prod.name]
      p_obj[:sizes].append(prod.size)
      p_obj[:ids].append(prod.id)
      p_obj[:dealer_price], p_obj[:msrp], p_obj[:rmatv_price] = prod.dealer_price, prod.msrp,prod.rmatv_price
      p_obj[:brand], p_obj[:picture], prod[:id] = prod.brand, prod.picture, prod.id
    end
    p_hash
  end

  def self.map_all_brands
    self.all.map { |prod| prod.brand }.uniq
  end

  def self.map_all_sizes(product_list)
    size_arr = []
    product_list.keys.each do |k|
      size_arr << product_list[k][:sizes]
    end
    size_arr.flatten.compact.uniq!
  end

end