# OODD Project 2

## LibraryManagementSystem

To test or use the deployed app on heroku visit https://librarymanagementsystemaar.herokuapp.com

### Admin Credentials:

Email: admin@lms.com

Password: password

(Please do not update admin password while editing other attributes of Admin's profile. Else the admin won't be able to login with the same credentials. Appreciate your consideration!)

### Testing Implemented For Books controller and model

### Prerequisites

Steps to run the project on your machine:

```git clone https://github.ncsu.edu/asyal/LibraryManagementSystem.git```

Please make sure you do the following once you have cloned the repository to your local machine:

1. Install postgresql on your MAC using the following command in your RubyMine Terminal.
```
brew services start postgresql
```
2. Run the following commands to get all the dependencies and migrate changes in your database.
```
bundle install
bundle update
rake db:migrate
rake db:seed
```

3. Visit http://localhost:3000 to use the app.


The first page you visit when you open the library management system web app:

<img width="1440" alt="Screenshot 2019-10-02 at 11 44 34 PM" src="https://media.github.ncsu.edu/user/12952/files/e0ad5880-e572-11e9-9259-5e108dc5591c">

<img width="1440" alt="Screenshot 2019-10-02 at 11 45 21 PM" src="https://media.github.ncsu.edu/user/12952/files/e145ef00-e572-11e9-8a01-ad78ea311ee0">

This is the "Profile" page of the admin user which displays all the exisiting users in the system.

<img width="1440" alt="Screenshot 2019-10-02 at 11 45 50 PM" src="https://media.github.ncsu.edu/user/12952/files/e1de8580-e572-11e9-8b6f-61c40240c120">

To view all universities, click on "My Universiies".

<img width="1440" alt="Screenshot 2019-10-02 at 11 46 04 PM" src="https://media.github.ncsu.edu/user/12952/files/e1de8580-e572-11e9-82b9-5b8236c0cea6">

To create a new university, click on "New University", fill in the details and click on "Create User". (to go back use browsers back button)

<img width="1440" alt="Screenshot 2019-10-03 at 1 03 58 AM" src="https://media.github.ncsu.edu/user/12952/files/78af4000-e57b-11e9-9e6a-7ba53efa415a">

The following page would show, when a new university is successfully created.

<img width="1440" alt="Screenshot 2019-10-03 at 1 04 22 AM" src="https://media.github.ncsu.edu/user/12952/files/78af4000-e57b-11e9-8e8d-98264230a935">

To view all universities with he newly added universiy, click on "My Universiies".

<img width="1440" alt="Screenshot 2019-10-03 at 1 06 10 AM" src="https://media.github.ncsu.edu/user/12952/files/7947d680-e57b-11e9-9622-2cf3c47ca8a7">

<img width="1439" alt="Screenshot 2019-10-03 at 1 05 40 AM" src="https://media.github.ncsu.edu/user/12952/files/7947d680-e57b-11e9-9fd5-a42165fd1203">



<img width="1440" alt="Screenshot 2019-10-03 at 1 06 24 AM" src="https://media.github.ncsu.edu/user/12952/files/79e06d00-e57b-11e9-97c3-d24e397760e4">

<img width="1440" alt="Screenshot 2019-10-03 at 1 07 21 AM" src="https://media.github.ncsu.edu/user/12952/files/79e06d00-e57b-11e9-92da-b18379cb1a38">

<img width="1439" alt="Screenshot 2019-10-03 at 1 07 32 AM" src="https://media.github.ncsu.edu/user/12952/files/7a790380-e57b-11e9-9e76-bf545bd34ef5">

<img width="1440" alt="Screenshot 2019-10-03 at 1 08 12 AM" src="https://media.github.ncsu.edu/user/12952/files/7b119a00-e57b-11e9-8849-3b27b490a00f">

<img width="1440" alt="Screenshot 2019-10-03 at 1 08 24 AM" src="https://media.github.ncsu.edu/user/12952/files/7b119a00-e57b-11e9-994d-e41b42badc06">


To view all books in all universiies in all libraries, click on "View All Books".

<img width="1440" alt="Screenshot 2019-10-02 at 11 46 22 PM" src="https://media.github.ncsu.edu/user/12952/files/e2771c00-e572-11e9-9593-fb11f9561b37">

To search books based on any of the following categories: </br>
Title</br>
Author </br>
Publication Date </br>
Subject </br>
Fill in that feild and press "Search" button.

<img width="1440" alt="Screenshot 2019-10-02 at 11 46 42 PM" src="https://media.github.ncsu.edu/user/12952/files/e30fb280-e572-11e9-9112-f28a751e6572">


To create a new user, go on he profiles page, click on "New User", fill in the requires details and click on "Create User". (to go back use browsers back button)

<img width="1440" alt="Screenshot 2019-10-02 at 11 47 42 PM" src="https://media.github.ncsu.edu/user/12952/files/e30fb280-e572-11e9-9dd0-553b7066eab7">

The new user is cretaed and you are signed in as the new user now.

<img width="1440" alt="Screenshot 2019-10-02 at 11 47 54 PM" src="https://media.github.ncsu.edu/user/12952/files/e3a84900-e572-11e9-8843-52925ac58e87">
