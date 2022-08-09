# README

This is a simple CRUD app that utilizes MVC and hand-rolled routes to create a database a police department could use to view officer information and arrest records.  This project was built using ```Rails 5.2.6``` and a ```PostgreSQL``` database.  

Additional styling was added using ```HTML```, ```CSS```, and ```Bootstrap version 4```.

To get started:
* **Create a new directory on your computer where you'd like the program to live

    ```mkdir /Users/your_user_name/your_folder/officer_arrest_tracker```
  
 * **Navigate into the recently created directory

    ```/Users/your_user_name/your_folder  $cd officer_arrest_tracker ```
  
 * **Clone the repository by first clicking on the code button and then copying the repository information (use SSH if you have setup a key)

    ![image](https://user-images.githubusercontent.com/95776577/183747041-40f47875-442e-4008-8d00-8c45bf2731fe.png)

  
 * **Inside the recently created directory, git clone the recently copied repository information

    ```/Users/your_user_name/your_folder/officer_arrest_tracker main $git clone git@github.com:JohnSantosuosso/officer_arrest_tracker.git```

* **Open the repository in your preferred IDE.  If you are using VSCode.  See my post on IDEs for additional information:

    ```bundle install```

* **Reset and create & database:

    ```rails db:{drop,create,migrate,seed}```

* **How to run the test suite:

    ```rspec spec```

* **Viewing instructions:

    Run ```rails s``` in terminal.  In your web browser, enter the URL ```localhost:3000``` and enter the site.
