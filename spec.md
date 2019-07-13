Specifications for the Sinatra Assessment
Specs:

 [x] Use Sinatra to build the app.

     Requirement met - installed Corneal gem to stub out Sinatra Project.

 [x] Use ActiveRecord for storing information in a database.

     Requirement met - Built models that inherit from ActiveRecord::Base and Database Migrations
     inherit from ActiveRecord::Migration.

 [x] Include more than one model class (e.g. User, Post, Category).

     Requirement met - Built an app that implements a User model and a Project model.

 [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts).

     Requirement met - User model has_many :projects.

 [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User).

     Requirement met - Project model belongs_to :user.

 [x] Include user accounts with unique login attribute (username or email).

     Requirement met - Built a Users_controller that is mounted to Application_controller in config.ru.
     The Users_controller's singular responsibility is to sign up new users, creating new user account,
     logging in existing users - validating/authenticating user access passwords by implementing sessions -
     enable :sessions / set :session secret in Application_Controller configure method, and logging out 
     logged in users. 

 [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying.

     Requirement met - User resource (Projects) belongs to user. Impelented a Projects_Controller mounted
     to Application_Controller, the projects_controller's singular responsbility is to facilitate CRUD actions - 
     create new project, retreive/read project, update project, and destroy project.

 [x] Ensure that users can't modify content created by other users.

     Requirement met - Implemented conditional logic checks to ensure that a user can only edit/delete resources that
     belong to that user.

 [x] Include user input validations.

     Requirement met - Impelented conditioanl logic to validate user input.

 [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
    Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code.

    Bonus challenge met - error messages are rendered to views when specific validation failures occur. My README.md
    includes description, install instructions, and a contributers guide with a link to LICENS.md. 

Confirm:

 [x] You have a large number of small Git commits
 [x] Your commit messages are meaningful
 [x] You made the changes in a commit that relate to the commit message
 [x] You don't include changes in a commit that aren't related to the commit message