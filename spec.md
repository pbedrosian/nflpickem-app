Specifications for the Rails Assessment

 X Using Ruby on Rails for the project

 X Include at least one has_many relationship (x has_many y;   e.g. User has_many Recipes)

  User has_many :picks
  Team has_many :picks

 X Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)

  Picks belongs_to :users
  Picks belongs_to :teams

 X Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)

  User has_many :teams, through :picks
  Teams has_many :users, through :picks

 X Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)

  Users cannot be created without email, password
  Picks require team 

 X Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)

    def self.search(query)
        if query.present?
            where('FIRST_NAME like ? OR LAST_NAME like ?', "%#{query}%", "%#{query}%")
        else
            self.all
        end
    end

 X Your application must provide standard user authentication, including signup, login, logout, and passwords.

    Used Devise gem for all of it

 X Your authentication system must also allow login from some other service. Facebook, Twitter, Foursquare, Github, etc...

    Used Omniauth and added facebook

 X You must include and make use of a nested resource with the appropriate RESTful URLs.

    users/1/picks/new
    users/1/picks

 X Your forms should correctly display validation errors.

        new users 
        new picks
        
Confirm: 
 X The application is pretty DRY
 X Limited logic in controllers
 X Views use helper methods if appropriate
 X Views use partials if appropriate