# README

Officer Arrest Tracker is a simple CRUD app that utilizes MVC and hand-rolled routes to create a database a police department could use to view officer information and arrest records.  This project was built using ```Rails 5.2.6``` and a ```PostgreSQL``` database.  

Additional styling was added using ```HTML```, ```CSS```, and ```Bootstrap version 4```.

To get started:

 1.  **Create a new directory on your computer where you'd like the program to live** 

     ```mkdir /Users/your_user_name/your_folder/officer_arrest_tracker```
  
 2.  **Navigate into the recently created directory** 

     ```/Users/your_user_name/your_folder  $cd officer_arrest_tracker ```
  
 3.  **Clone the repository by first clicking on the code button and then copying the repository information (use SSH if you have setup a key)**

     ![image](https://user-images.githubusercontent.com/95776577/183747041-40f47875-442e-4008-8d00-8c45bf2731fe.png)

  
 4.  **Inside the recently created directory, git clone the recently copied repository information** 

      ```/Users/your_user_name/your_folder/officer_arrest_tracker main $git clone git@github.com:JohnSantosuosso/officer_arrest_tracker.git```

 5. **Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below.  See my post on IDEs for additional information.** 

     ```bundle install```

 6.  **Reset and create & database:** 

    ```rails db:{drop,create,migrate,seed}```

 7.  **How to run the test suite:**

    ```rspec spec```

 8.  **Viewing instructions:**

    Run ```rails s``` in terminal.  In your web browser, enter the URL ```localhost:3000``` and enter the site.
