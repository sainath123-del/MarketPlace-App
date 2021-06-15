
## T2A2 - Marketplace Project
  
### Link your GitHub repository
https://github.com/sainath123-del/MarketPlace-App 

### A link (URL) to your deployed app (i.e. website)
https://mighty-woodland-13995.herokuapp.com/


## Identification of the problem you are trying to solve by building this particular marketplace app.


The app which i am building is based on sports. I like to play one of the sport is cricket  
=======
By creating marketplace cricket app, I am solving the problem who has interest in sports. Where user can add there own product for sale and user can buy new diffirent product from this app. 


## Why is it a problem that needs solving?

People who like to play cricket they will always looks for something different where they find online instead of going to shop. They can sell the unwanted things with good price and the important thing is they can update their products



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

<img width="1440" alt="Screen Shot 2021-06-15 at 7 34 41 pm" src="https://user-images.githubusercontent.com/79548205/122030212-ed3e1700-ce10-11eb-8be5-195078b4d227.png">

<img width="1440" alt="Screen Shot 2021-06-15 at 7 35 17 pm" src="https://user-images.githubusercontent.com/79548205/122030229-f0d19e00-ce10-11eb-9789-9353bb7fba94.png">

<img width="1436" alt="Screen Shot 2021-06-15 at 7 31 21 pm" src="https://user-images.githubusercontent.com/79548205/122029614-5c673b80-ce10-11eb-897f-4b33dde12645.png">



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
  
  
  A User need to signup and sign in user can see all the product of which is related to cricket.
  A User can buy and sell multiple items, only if they are logged in.
  A User can upload an image when creating a product.
  A User can click on an item and see more details about the listed item. Price, description.
  A User can log in and out of their account. There is an option to tick a 'remember me' option,         making user experience much better.
  A User can see what items they have listed to sell on via their profile page.
  A User can see the items they have purchased on their profile page.

  

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
 
 ## Discuss the database relations to be implemented in your application
The data base is a relational database, as shown in the ERD. The information in one table is related to the information in the other tables, and relies on the data from each. Taking this into consideration the relationships, I had to make sure that each table only held the relevant information and required on the information that it needed.
The MVC Model database is a great template and will be used for any future designs or apps which I work on.
 
 ## An ERD for your app 

 
 <img width="729" alt="Screen Shot 2021-06-03 at 9 33 21 pm" src="https://user-images.githubusercontent.com/79548205/120638382-63f32000-c4b3-11eb-813c-b7bf1a5beb14.png">
 
 
 ## Explain the different high-level components (abstractions) in your app
 The model, views and controllers are efficient in creating a facade of logical workflow for the user. When a user accesses the site they are only seeing the graphical user interface represented by the views module. However, in reality when for example they post a new product they are altering the PostgreSQL database handled via the model. The user cannot achieve any of these tasks without the controller module providing the site with visible functionality. The controller is the middle man for the model and views modules and when programmed correctly vastly enhances a user’s experience. Overall, the MVC architecture divides complex tasks into more manageable sections that all work harmoniously with one another. On their own, the models, views and controllers would be practically useless to the user.

Another abstraction used within the Cricket app is the Devise Ruby gem. This gem validates a user's credentials which are then used to provide authorization to certain pages of the site depending on their admin rights. 
The Devise gem itself does not discriminate between a buyer and a seller; this is in fact handled by the controller. An example of this would be permission rights to edit and delete a product. Each individual Product corresponds with the user’s ID who created the post. Only the creator can edit the listing and for everyone else registered on the database can only view the product, purchase the product or contact the seller. These personalised authorizations are considered a high-level component as the user is unaware of the deep logic behind how their credentials are altering their overall experience with the site.

 
## Third party services used
Third party services used in this app is Amazon Web Service S3.This is where all of the images that are uploaded to this app.The purpose of using Amazon S3, is to make for the best user experience possible. Having an app that operates fast is vital, as users want to get what they want at a resonable pace. Making use of Amazon S3 makes sure that the site will stay at a good quality speed, allowing for the best possible user experience.

 


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








<img width="1365" alt="Screen Shot 2021-06-15 at 4 08 57 pm" src="https://user-images.githubusercontent.com/79548205/122001775-2a47e080-cdf4-11eb-9ee2-5aefc26f7e81.png">


<img width="1354" alt="Screen Shot 2021-06-15 at 4 09 12 pm" src="https://user-images.githubusercontent.com/79548205/122001786-2f0c9480-cdf4-11eb-82dd-58b46190d091.png">


<img width="1354" alt="Screen Shot 2021-06-15 at 4 09 20 pm" src="https://user-images.githubusercontent.com/79548205/122001790-303dc180-cdf4-11eb-92a8-5e6d331764e7.png">

## Describe the way tasks are allocated and tracked in your project
 Throughout the project, I learned Devise is a gem that comes standard with Rails. It used for Authentication and Authorisation for the app. It generates a model and views to deal with a user signing up for an account and then only letting authorised users commit actions to content created by a user with in the app. It achieves this by keeping track of there ID within the database and comparing it to the content owners ID, denying access to unauthorised users.

PostgreSQL
Postgres is a relational database. It is very useful for making sure all the data that is required is available when we need it. it is also very easy to create clear relationships between different tables of information. This in effect makes it very easy to call for information related to other information with in the app. for example how created a product and who bought it.
