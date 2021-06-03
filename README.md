
## T2A2 - Marketplace Project
  
### Link your GitHub repository
https://github.com/sainath123-del/MarketPlace-App 


## Identification of the problem you are trying to solve by building this particular marketplace app.

The app which i am building is based on sports. I like to play one of the sport is cricket. Cricket is a passion for all youth. For those who like to play cricket this app will help to buy cricket equipment in reasonable price and they can sell there equipment which they dont need.


## Why is it a problem that needs solving?

People who like to play cricket they will always looks for something different where they find online instead of going to shop. They can sell the unwanted things with good price and the important thing is they can update their products.



### Link your GitHub repository
https://github.com/sainath123-del/MarketPlace-App 


## Description of your marketplace app (website), including:
# Purpose: 
This app is two sided marketplace app where user can sell their product and buy product from app. The main puropose of this app is whenever user want to sell their product they can sell without and they can fix price themself.


- Functionality / features
  Devise User Authentication: 
  User Authorization
  Products 
  
- Sitemap

<img width="527" alt="site map" src="https://user-images.githubusercontent.com/79548205/120629846-9435c100-c4a9-11eb-9ca9-91231c8820a7.png">

- Screenshots
  

<img width="589" alt="Home page" src="https://user-images.githubusercontent.com/79548205/120635642-0d381700-c4b0-11eb-8b97-041ff011d067.png">



- Target audience
- Tech stack 
 HTML
 CSS
 Ruby
 Ruby on Rails 
 VS Code
 Postgresql
 AWS S3
 Heroku
 
 
 ## User stories for your app
  # Before signUp
  
 User can see all the cricket equipment on the market.
 
 User need to signIn to get access for products.
 
 # Buyer
 
 User can view all the product on the market.
 
 User can able to buy all product directly from marketplace.
 
 # Seller
 User can post there product on marketplace.
 
 User can update there posted product.
 
 User can change there products details.
 
 
 ## Wireframes for your app


 
 <img width="434" alt="login page" src="https://user-images.githubusercontent.com/79548205/120635722-26d95e80-c4b0-11eb-8aa4-f99a002cdd22.png">
 <img width="629" alt="Add Product" src="https://user-images.githubusercontent.com/79548205/120635668-16c17f00-c4b0-11eb-8f05-88a01b953e8c.png">
 <img width="702" alt="ProductImage" src="https://user-images.githubusercontent.com/79548205/120630285-073f3780-c4aa-11eb-844f-2c6329a0747a.png">
 
 
 
 ## An ERD for your app

 
 <img width="729" alt="Screen Shot 2021-06-03 at 9 33 21 pm" src="https://user-images.githubusercontent.com/79548205/120638382-63f32000-c4b3-11eb-813c-b7bf1a5beb14.png">
 
 
 ## Explain the different high-level components (abstractions) in your app
 The model, views and controllers are efficient in creating a facade of logical workflow for the user. When a user accesses the site they are only seeing the graphical user interface represented by the views module. However, in reality when for example they post a new product they are altering the PostgreSQL database handled via the model. The user cannot achieve any of these tasks without the controller module providing the site with visible functionality. The controller is the middle man for the model and views modules and when programmed correctly vastly enhances a user’s experience. Overall, the MVC architecture divides complex tasks into more manageable sections that all work harmoniously with one another. On their own, the models, views and controllers would be practically useless to the user.

Another abstraction used within the Cricket app is the Devise Ruby gem. This gem validates a user's credentials which are then used to provide authorization to certain pages of the site depending on their admin rights. 
The Devise gem itself does not discriminate between a buyer and a seller; this is in fact handled by the controller. An example of this would be permission rights to edit and delete a product. Each individual Product corresponds with the user’s ID who created the post. Only the creator can edit the listing and for everyone else registered on the database can only view the product, purchase the product or contact the seller. These personalised authorizations are considered a high-level component as the user is unaware of the deep logic behind how their credentials are altering their overall experience with the site.

 
## Third party services used
# AWS 
 AWS S3 is an amazon sever used to store the data or images
# Postgresql 
Postgresql is used for to store the data in datbase management system
# Bootstrap 
Bootstrap is used for to create a responsive web site design by using Nav bar, html and css
# Devise
This is used for encrpt the password 

 


## Describe your projects models in terms of the relationships (active record associations) they have with each other

The useer models have there user name and email is important for to signup


    t.string "name"
    t.string "email"
    
Adding brand to products for so user can add the brand of the product




class AddBrandRefToProducts < ActiveRecord::Migration[6.1]
  def change
    add_reference :products, :brand, null: false, foreign_key: true
  end
end


Only signed in user can see the products details, if user want to sell their product they must need to fill name, description and price





class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end


User must have a valid email for signup. user can't use one email for two account


   validates  :email, presence: true
   validates :email, uniqueness: true


## Database Schema Design






ActiveRecord::Schema.define(version: 2021_06_03_003750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "product_orders", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_product_orders_on_order_id"
    t.index ["product_id"], name: "index_product_orders_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.decimal "price", precision: 8, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "brand_id", null: false
    t.index ["brand_id"], name: "index_products_on_brand_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "rating"
    t.text "review"
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_ratings_on_product_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "user", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reset_password_token"], name: "index_user_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status"
    t.string "password_digest"
    t.string "encrypted_password"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "product_orders", "orders"
  add_foreign_key "product_orders", "products"
  add_foreign_key "products", "brands"
  add_foreign_key "ratings", "products"
  add_foreign_key "ratings", "users"
end


<img width="641" alt="sechma 1" src="https://user-images.githubusercontent.com/79548205/120630047-c6472300-c4a9-11eb-871b-0ffb087cc618.png">


<img width="582" alt="Schema 3" src="https://user-images.githubusercontent.com/79548205/120630153-e24ac480-c4a9-11eb-87e1-f21e6269073f.png">


