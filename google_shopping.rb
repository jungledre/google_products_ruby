require 'json'
file = File.read("./products.json")

google_data = JSON.parse(file)

# a = [1,2,3,4,5]
# puts a.each {  |x| x == 3 }
# puts '------------'
# puts a.select { |x| x == 3 }
# puts '------------'
# puts a.map { |x| x == 3 }
# puts '------------'
# puts a.reject { |x| x == 3 }

##Assignment (Déjà vu)
# Use the product search result in your file to check the following:

####################
# 1.) The `kind` of results you're are dealing  are `shopping#products`. Go through the `items` and find all results that have `kind` of `shopping#product`. How many are there? Where else is this count information stored in the search results?

#SOLUTION 1
# count = 0
# google_data["items"].each {|x| count += 1 if x["kind"] === "shopping#product"}
# puts "Items called shopping#product: #{count}"

# SOLUTION 2
# items = google_data["items"].keep_if {|x| x["kind"].include? "shopping#product"}
# items.each {|x| puts "+ #{x["product"]["title"]}"}
# puts "Count = #{items.count}"


####################
# # 2.) Find all items with a `backorder` availability in `inventories`.

# puts "Items on backorder: "

# SOLUTION 1
# google_data["items"].each {|x| puts "+ #{x["product"]["title"]}" if x["product"]["inventories"][0]["availability"] === "backorder"}

# SOLUTION 2
# google_data["items"].select {|x| puts "+ #{x["product"]["title"]}" if x["product"]["inventories"][0]["availability"] === "backorder"}

# SOLUTION 3
# puts (google_data["items"].collect {|x| "+ #{x["product"]["title"]}" if x["product"]["inventories"][0]["availability"] === "backorder"}).compact

####################
# 3.) Find all items with more than one image link.

# puts "Items with more than one image link: "

# SOLUTION 1
# google_data["items"].each {|x| puts "+ #{x["product"]["title"]}" if x["product"]["images"].length > 1}

# SOLUTION 2
# (google_data["items"].reject {|x| x["product"]["images"].length <= 1}).each {|x| puts "+ #{x["product"]["title"]}"}

####################
# 4.) Find all `canon` products in the items (careful with case sensitivity).

# puts "All Canon products: "

# SOLUTION 1
# google_data["items"].each {|x| puts "+ #{x["product"]["title"]}" if x["product"]["brand"].include? "Canon"}

# SOLUTION 2
# (google_data["items"].delete_if {|x| x["product"]["brand"] != "Canon"}).each {|x| puts "+ #{x["product"]["title"]}"}

# SOLUTION 3
# (google_data["items"].keep_if {|x| x["product"]["brand"].include? "Canon"}).each {|x| puts "+ #{x["product"]["title"]}"}

####################
# 5.) Find all `items` that have **product** **author** **name** of "eBay" and are brand "Canon".

# puts "All Canon items on Ebay: "

# SOLUTION 1
# google_data["items"].each {|x| puts "+ #{x["product"]["title"]}" if x["product"]["author"]["name"].include? "eBay" and x["product"]["brand"].include? "Canon"}

# SOLUTION 2
# (google_data["items"].keep_if {|x| x["product"]["author"]["name"].include? "eBay" and x["product"]["brand"].include? "Canon"}).each {|x| puts "+ #{x["product"]["title"]}"}



####################
# 6.) Print all the products with their **brand**, **price**, and a **image link**
# SOLUTION 1
# puts "All Items"
# google_data["items"].each {|x| puts "+ #{x["product"]["brand"]} $#{x["product"]["inventories"][0]["price"]} #{x["product"]["images"][0]["link"]}" }




