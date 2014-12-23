require 'json'
file = File.read("./products.json")

google_data = JSON.parse(file)

##Assignment (Déjà vu)
# Use the product search result in your file to check the following:

# 1.) The `kind` of results you're are dealing  are `shopping#products`. Go through the `items` and find all results that have `kind` of `shopping#product`. How many are there? Where else is this count information stored in the search results?
count = 0
google_data["items"].each {|x| count += 1 if x["kind"] === "shopping#product"}
puts "Items called shopping#product: #{count}"
puts

# 2.) Find all items with a `backorder` availability in `inventories`.
puts "Items on backorder: "
google_data["items"].each {|x| puts "+ #{x["product"]["title"]}" if x["product"]["inventories"][0]["availability"] === "backorder"}
puts

# 3.) Find all items with more than one image link.
puts "Items with more than one image link: "
google_data["items"].each {|x| puts "+ #{x["product"]["title"]}" if x["product"]["images"].length > 1}
puts

# 4.) Find all `canon` products in the items (careful with case sensitivity).
puts "All Canon products: "
google_data["items"].each {|x| puts "+ #{x["product"]["title"]}" if x["product"]["brand"].include? "Canon"}
puts

# 5.) Find all `items` that have **product** **author** **name** of "eBay" and are brand "Canon".

puts "All Canon items on Ebay: "
google_data["items"].each {|x| puts "+ #{x["product"]["title"]}" if x["product"]["author"]["name"].include? "eBay" and x["product"]["brand"].include? "Canon"}
puts

# 6.) Print all the products with their **brand**, **price**, and a **image link**

puts "All Items"
google_data["items"].each {|x| puts "+ #{x["product"]["brand"]} $#{x["product"]["inventories"][0]["price"]} #{x["product"]["images"][0]["link"]}" }
