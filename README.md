# README

Officer Arrest Tracker is a simple CRUD app that utilizes MVC and hand-rolled routes to create a database a police department could use to view officer information and arrest records.  This project was built using ```Rails 5.2.6``` and a ```PostgreSQL``` database.  

Additional styling was added using ```HTML```, ```CSS```, and ```Bootstrap version 4```.

To get started:

 1.  **Create a new directory on your computer where you'd like the program to live** 

     ```mkdir /Users/your_user_name/your_folder/officer_arrest_tracker```
  
 2.  **Navigate into the recently created directory** 

     ```/Users/your_user_name/your_folder  $cd officer_arrest_tracker ```
  
 3.  **Clone the repository by clicking on the code button on Github repo page. Then, copy the repo information using SSH. **

     ![183747041-40f47875-442e-4008-8d00-8c45bf2731fe](https://user-images.githubusercontent.com/95776577/183752233-c9130b38-ce16-4b4c-aeb4-fdf0d0d4a137.png)


  
 4.  **Inside the recently created directory, clone the recently copied repository information** 

      ```/Users/your_user_name/your_folder/officer_arrest_tracker main $git clone git@github.com:JohnSantosuosso/officer_arrest_tracker.git```

 5. **Open the repository in your preferred IDE.  If you are using VSCode, use the code command shown below.  See my post on IDEs for additional information.** 

     ```/Users/your_user_name/your_folder/officer_arrest_tracker main $code```

 6.  **Reset and create & database:** 

     ```rails db:{drop,create,migrate,seed}```

 7.  **How to run the test suite:**

     ```rspec spec```

 8.  **Viewing instructions:**

     Run ```rails s``` in terminal.  
     In your web browser, enter the URL ```localhost:3000``` and enter the site.
