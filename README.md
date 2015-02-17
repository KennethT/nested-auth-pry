The goal of this exercise is to experiment with a belongs_to and has_many both in Rails Console and in Views.

```

√bundle
√rake db:create db:migrate db:seed
√There are Companies, Locations, Reviews, and Products.

```

√The models need to be fixed to make them communicate.

MODELS MODELS MODELS!!!!

Companies have many Locations and Products.

Products have many reviews.


# Stories:

Fill in the line below each direction with the command needed to complete it.

## Rails Console:

For Example:

set a variable called companies = to all the Companies.
  companies = Company.all

√1. set a variable called products = to all the Products ordered by name.
  products = Product.all

√2. set a variable called locations = to all the Locations ordered by street_name.
  locations = Location.all

√3. set a variable called reviews = to all the Reviews ordered by rating.
  reviews = Review.all

√4. set a variable called company = to the Company with an ID of 10.
  company = Company.find(10)

√5. select all of the products that belong to that company.
  company.products

√6. select all of the locations that belong to that company.
  company.locations

√7. select the first product that belongs to that company.
  company.products.first

√8. select all the reviews that belong to that product.
  company.products.first.reviews.all

√9. select all the reviews that belong to the product with id of 1.
  Product.find(1).reviews.all

√10. update each product's rating to 0.
  Product.first.reviews.each {|x| x.rating = 0}

11. select all the reviews with a rating of greater than 5.  Review.where("rating  > 5")


12. select all the companies with a start date before 12/12/2012.  Company.where(['start_date < ?', '12/12/2012'])
            I'll need an explanation Company.where(['start_date < ?', '12/12/2012'])

√13. How many are there?
  16

√14. select all the products with a price greater than 50. Product.where("? > ?")
  Product.where("price > 50")

√15. select review with id of 10 and return the product it belongs to.
  Review.find(10).product








## View Stories

√The root page should be 'companies#index'

√There are no views setup. Root is set to standard rails page.

√Show page for each company.
√Users can create companies.
√Users can create locations.
√Users can create products.
√Users can create reviews.


√Create an index page for companies that lists all companies and attributes in a table, with a link to that companies show page from it's name.
(Set root to this page)

example rows:

```

 name        |  suffix | catch_phrase        | email                      | start_date   | industry |
"Mayert-Rau" | "Inc"   | "Focused framework" | "erick@jacobiokuneva.info" | "2014-05-26" | "Finance"| Create Product | Create Location | Delete Company |
"Google"     | "Inc"   | "Focused Web"       | "google@google.info"       | "2014-05-26" | "Finance"| Create Product | Create Location | Delete Company |

```



√* The company name should link to the companies show page.
√* Link to Create Product and Create Location. The name should link to a show page for that company.
√* Link to delete a company.
√* Show page for company shows all details of company and shows all it's products and locations in separate tables.
√* Users can create Locatons/Products/Reviews.
√* A product showpage that contains all of the products reviews.



Things to remember
* Remember that Products have reviews.
* Now we need to figure out how to nest routes inside of nested routes.



* Remember with the last exercise we did we had Companies and employees and we did

```

  resources :companies do
    resources :employees
  end

```

This time we need to take it a step further to add reviews to products. Companies have locatins and Products, but Products also have reviews.

```

  resources :companies do
    resources :locations
    resources :products do
      resources :reviews
    end
  end

```



Go in terminal and type rake routes.


Notice how we have nested routes that look like this:

```


    company_product_reviews GET    /companies/:company_id/products/:product_id/reviews(.:format)          reviews#index
                            POST   /companies/:company_id/products/:product_id/reviews(.:format)          reviews#create
 new_company_product_review GET    /companies/:company_id/products/:product_id/reviews/new(.:format)      reviews#new
edit_company_product_review GET    /companies/:company_id/products/:product_id/reviews/:id/edit(.:format) reviews#edit
     company_product_review GET    /companies/:company_id/products/:product_id/reviews/:id(.:format)      reviews#show
                            PATCH  /companies/:company_id/products/:product_id/reviews/:id(.:format)      reviews#update
                            PUT    /companies/:company_id/products/:product_id/reviews/:id(.:format)      reviews#update
                            DELETE /companies/:company_id/products/:product_id/reviews/:id(.:format)      reviews#destroy


```

***additional notes by kt to test if we are signin within session, go add
<% binding.pry %> to application.html.erb
then run
    session[:user_id] within pry
It should return a user our user id, anything other than nil is a signed in session by defintion of what defined in our sessions controller***



## Stretch goals:

* Make a "/products" page which lists ALL the products, regardless of company.
* Make a "/reviews" page which lists ALL the reviews, regardless of product.

Return the average rating for a Products Reviews. (In rails console)
