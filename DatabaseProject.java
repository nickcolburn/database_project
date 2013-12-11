/*
 *  Copyright (C) 2013 Alvaro Monge <alvaro.monge@csulb.edu>
 *  California State University Long Beach (CSULB) ALL RIGHTS RESERVED
 * 
 * Licensed under the Open Software License (OSL 3.0).
 *     http://opensource.org/licenses/AFL-3.0
 * 
 *  Use of this software is authorized for CSULB students in Dr. Monge's classes, so long
 *  as this copyright notice remains intact. Students must request permission from Dr. Monge
 *  if the code is to be used in other venues outside of Dr. Monge's classes.
 * 
 *  This program is distributed to CSULB students in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * 
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Nick Colburn
 */
public class DatabaseProject {

  /**
   * Logger object for logging error messages and warnings
   */
  private final static Logger LOGGER = Logger.getLogger(DatabaseProject.class.getName());
  
  // JDBC Driver and URL strings
  /**
   * JDBC Derby Driver -- Derby Client/Server
   */
  //private final static String DB_DRIVER = "org.apache.derby.jdbc.ClientDriver";
  /**
   * JDBC Connection URL for the toybank database, using the Derby client/server
   * driver
   */
  //private final static String DB_URL = "jdbc:derby://localhost:1527/toybank";
  /**
   * JDBC Derby Driver -- Embedded
   */
//   private final static String DB_DRIVER = "org.apache.derby.jdbc.EmbeddedDriver";
  /**
   * JDBC Connection URL for the toybank database, using absolute path to Derby
   * DB (assumes Linux/Mac OS)
   */
//   private final static String DB_URL = "jdbc:derby:/NetBeansProjects/323/UsingJDBC/toybank";
  /**
   * JDBC MySQL Driver
   */
   private final static String DB_DRIVER = "com.mysql.jdbc.Driver";
  /**
   * JDBC Connection URL for the toybank database, using the MySQL driver
   */
   //private final static String DB_URL = "jdbc:mysql://infoserver.cecs.csulb.edu:3306/toybank";
   /**
    * JDBC Connection URL for the tech_review database (local instance), using the MySQL driver
    */
    private final static String DB_URL = "jdbc:mysql://127.0.0.1:3306/cecs323";
    /**
     * JDBC Connection URL for the tech_review database on infoserver, using the MySQL driver
     */
     //private final static String DB_URL = "jdbc:mysql://infoserver:3306/cecs323m8";
  /**
   * Query to retrieve all devices based on price 
   */
  private final static String SQL__DEVICES_BY_PRICE =
          "SELECT d.name, d.model_number AS model_number, m.name AS manufacturer_name, s.name AS software_name, d.listed_price " 
		  +"FROM Devices d "
		  +"LEFT OUTER JOIN Manufacturers m ON d.mfctr_id = m.mfctr_id "
		  +"LEFT OUTER JOIN Software s ON d.soft_id = s.soft_id "
		  +"GROUP BY d.listed_price "
		  +"HAVING d.listed_price > ?";
  
  /**
   * Query to retrieve all devices based on review rating 
   */
  private final static String SQL_FIND_DEVICES_BY_RATING =
          "SELECT r.rating AS Rating, d.name as Device_Name, d.model_number as Model_Number, m.name as Manufacturer_Name, s.name as Software_Name " 
		  +"FROM Reviews r "
		  +"NATURAL JOIN Devices d "
		  +"LEFT OUTER JOIN Manufacturers m ON d.mfctr_id = m.mfctr_id "
		  +"LEFT OUTER JOIN Software s ON d.soft_id = s.soft_id "
		  +"WHERE r.rating > 4.0";

  /**
   * Query to retrieve all devices in the DB
   */
  private final static String SQL_FIND_ALL_DEVICES =
          "SELECT d.dev_id, m.name AS manufacturer_name, d.name AS device_name, d.model_number AS model_number, d.listed_price AS listed_price, s.name AS software_name "
          +"FROM Devices d "
          +"LEFT OUTER JOIN Manufacturers m ON d.mfctr_id = m.mfctr_id "
          +"LEFT OUTER JOIN Software s ON d.soft_id = s.soft_id ";
  
  /**
   * Query to insert a user into the DB (needed to insert a review)
   */
  private final static String SQL_INSERT_USER =
		  "INSERT INTO Users(username, first_name, last_name) VALUES "
		  +"(?, ?, ?)";
  /**
   * Query to delete a user from the DB
   */
  private final static String SQL_DELETE_USER =
		  "DELETE FROM Users "
		  +"WHERE username = ?";
  /**
   * Query to insert a review into the DB
   */
  private final static String SQL_INSERT_REVIEW =
		  "INSERT INTO Reviews(dev_id, username, rating, review) VALUES "
          +"(?, ?, ?, ?)";        
  
  /**
   * Query to display all reviews in DB
   */
  private final static String SQL_DISPLAY_ALL_REVIEWS =
		  "SELECT d.name, r.rating, r.username, r.review "
		  +"FROM Reviews r INNER JOIN Devices d ON r.dev_id = d.dev_id "
		  +"ORDER BY rating";
  
  /**
   * Scanner object attached to the user's input (via keyboard)
   */
  private Scanner userInput = new Scanner(System.in);
  /**
   * DB connection object
   */
  private Connection connection = null;

  /**
   * A small demo of the JDBC API to open a DB connection and execute a query.
   *
   * @param args the command line arguments
   */
  public static void main(String[] args) {
    LOGGER.setLevel(Level.INFO);

    DatabaseProject demo = new DatabaseProject();
    
    demo.connectToDB();

    if (demo.isConnected()) {
      DatabaseProject.displayInstructions();
      demo.displayMainMenu();      
      

      // Connection is still open... so can execute other statements.

      demo.closeConnection();
    } else {
      System.out.println("Exiting, connection was not established!");
    }
  }

  /**
   * Loads the JDBC driver class
   */
  public DatabaseProject() {
    try {
      Class.forName(DB_DRIVER);
    } catch (ClassNotFoundException cnfe) {
      LOGGER.log(Level.SEVERE, "Unable to load JDBC driver, due to error: {0}", cnfe);
      System.exit(1);
    }
  }

  /**
   * Gets a connection to the database using the JDBC driver that's been loaded
   * and registered with DriverManager.
   */
  public void connectToDB() {
    try {
      System.out.println("\nTo get started, enter the database username and password");
      System.out.print("\nusername: ");
      String dbUser = userInput.nextLine();
      System.out.print("password: ");
      String dbPassword = userInput.nextLine();

      connection = DriverManager.getConnection(
              DB_URL, // The URL specifying the location of the server and name of database
              dbUser,
              dbPassword);

      connection.setAutoCommit(false); // commits must be explicit, rather than implicit

    } catch (SQLException sqe) {
      LOGGER.log(Level.SEVERE, "Unable to establish a connection to the database due to error {0}", sqe.getMessage());
      connection = null;
    }
  }

  /**
   * Determines whether or not the program is connected to the database
   *
   * @return true if connected, false otherwise
   */
  public boolean isConnected() {
    return connection != null;
  }

  /**
   * Close the connection associated with this object
   */
  public void closeConnection() {
    //It's important to close the connection when you are done with it
    try {
      connection.close();
    } catch (Throwable ignore) {
      /* Propagate the original exception (or rewrap it as a more specific exception)
       instead of this one that you may want just logged */
      LOGGER.log(Level.SEVERE, "Unable to close DB connection due to error {0}", ignore.getMessage());
    }
  }

  /**
   * Issues a commit to the DB to make permanent all changes made to the DB.
   */
  public void commitChanges() {
    try {
      connection.commit();
    } catch (SQLException sqle) {
      LOGGER.log(Level.SEVERE, "Unable to commit changes to the DB due to error {0}", sqle.getMessage());
    }
  }
  
  /**
   * Rollback any changes made to the DB during the current transaction.
   */
  public void rollbackChanges() {
	    try {
	      connection.rollback();
	    } catch (SQLException sqle) {
	      LOGGER.log(Level.SEVERE, "Unable to rollback changes to the DB due to error {0}", sqle.getMessage());
	    }
	  }
  
  /**
   * Executes a SELECT statement on the opened connection and displays its
   * retrieved information
  */
  public void displayAllDevices() {
    try {
      //  use the Connection object here 
      Statement stmt = connection.createStatement();
      try {
        ResultSet rs = stmt.executeQuery(SQL_FIND_ALL_DEVICES);
        try {
        	String dev_id = "#";
        	String deviceName = "Device Name";
        	String manufacturer = "Manufacturer";
        	String lPrice = "Listed Price";
        	String software = "Software";
        	System.out.printf("%-2s %-20s %-20s %-15s %-20s %n",dev_id, deviceName, manufacturer,lPrice,software);
        	System.out.println("   -----------          ------------         ------------    ----------");
        	while (rs.next()) {
        	  displayOneDevice(rs);
          }
        } finally {
          try {
            rs.close();
          } catch (Throwable ignore) {
            LOGGER.log(Level.SEVERE, "Unable to close result set due to error {0}", ignore.getMessage());
          }
        }

      } finally {
        //It's important to close the statement when you are done with it
        try {
          stmt.close();
        } catch (Throwable ignore) {
          LOGGER.log(Level.SEVERE, "Unable to close statement due to error {0}", ignore.getMessage());
        }
      }
    } catch (SQLException sqle) {
      LOGGER.log(Level.SEVERE, "Unable to execute DB statement due to error {0}", sqle.getMessage());
    }
  }

  /**
   * Process one row in the ResultSet of the SQL query by displaying it on the
   * console.
   *
   * @param rs the ResultSet object position at a valid row.
   */
  private void displayOneDevice(ResultSet rs) {
    try {
      int dev_id = rs.getInt("dev_id");
      String manufacturer = rs.getString("manufacturer_name");
      String deviceName = rs.getString("device_name");
      String software = rs.getString("software_name");
      System.out.printf("%-2d %-20s %-20s $%-15.2f %-20s %n", dev_id, manufacturer, deviceName, rs.getFloat("Listed_Price"), software);

    } catch (SQLException sqle) {
      LOGGER.log(Level.SEVERE, "Unable to process result due to error {0}", sqle.getMessage());
    }
  }
  
  /**
   * Asks user to provide a first and last name, as well as a username, in order
   * to initiate a product review. Then asks user for the product they would
   * like to begin reviewing.
   */
  public void addReview() {
	  try {
		  userInput.nextLine();
	      PreparedStatement addUserQuery = connection.prepareStatement(SQL_INSERT_USER);	      
	 
	      System.out.println("\n******************************************************************\n"
					+"*                         PRODUCT REVIEW                         *\n"
					+"******************************************************************\n"
					+"Provide the following information                               \n");
	      System.out.print("username: ");
          String username = userInput.nextLine();
          while(username.equals(" ") || username.length() > 20){
                  System.out.print("\nMust enter a username (max 20 char): ");
              username = userInput.nextLine();
          }
          System.out.print("\nFull name: ");
          String line = userInput.nextLine();
          String name[] = line.split(" ");
          addUserQuery.setString(1, username);
          addUserQuery.setString(2, name[0]);
          addUserQuery.setString(3, name[1]);
          addUserQuery.executeUpdate(); 
   	  
    	  displayAllDevices();
    	  System.out.print("\nSelection: ");
		  int selection = userInput.nextInt();
		  userInput.nextLine();
		  System.out.print("\nWrite your review: ");
		  String review = userInput.nextLine();
		  System.out.print("\nHow would you rate this product? (0-5): ");
		  float rating = userInput.nextFloat();
		  
		  PreparedStatement addReview = connection.prepareStatement(SQL_INSERT_REVIEW);
		  addReview.setInt(1, selection);
		  addReview.setString(2, username);
		  addReview.setFloat(3, rating);
		  addReview.setString(4, review);
		  System.out.print("\nAdding your review to the database...");
		  addReview.executeUpdate();
		  System.out.print("Thank you for your feedback.\n");
		  return;			
	  } catch (SQLException sqle) {
          LOGGER.log(Level.SEVERE, "Unable to execute DB statement due to error {0}", sqle.getMessage());
      }
	
  }
  /**
   * Asks user to provide a first and last name, as well as a username, in order
   * to initiate a product review. Then asks user for the product they would
   * like to begin reviewing.
   */
  public void deleteUser() {
	  try {
		  userInput.nextLine();
	      PreparedStatement deleteUserQuery = connection.prepareStatement(SQL_DELETE_USER);	      
	 
	      System.out.println("\n******************************************************************\n"
					+"*                           DELETE USER                          *\n"
					+"******************************************************************\n"
					+" Please choose a Username to delete                               \n");
	      
    	  
    	  System.out.print("\nSelection: ");
		  String username = userInput.nextLine();
		  deleteUserQuery.setString(1, username);
		  System.out.println("\n**WARNING**"
				  			+"\nDeleting this user will remove"
				  			+"\nany reviews associated with them."
				  			+"\nDo you wish to continue? (y/n): ");
		  if(isResponseYes(userInput.nextLine()))
			  deleteUserQuery.executeUpdate();
		  return;
		
	  } catch (SQLException sqle) {
          LOGGER.log(Level.SEVERE, "Unable to execute DB statement due to error {0}", sqle.getMessage());
      }
  }
  
  /**
   * 
   */
  public void displayAllReviews()  {
	  try {
	      //  use the Connection object here 
	      Statement stmt = connection.createStatement();
	      try {
	        ResultSet rs = stmt.executeQuery(SQL_DISPLAY_ALL_REVIEWS);
	        try {
	        	String userName = "Username";
	        	String rating = "Rating (0-5)";
	        	String deviceName = "Device Name";
	        	String review = "Review";
	        	System.out.printf("%n%-20s %-20s %-20s %-100s %n",deviceName,rating,userName,review);
	        	System.out.println("-----------          ------------         --------             ------");
	        	while (rs.next()) {
	        	  displayOneReview(rs);
	          }
	        } finally {
	          try {
	            rs.close();
	          } catch (Throwable ignore) {
	            LOGGER.log(Level.SEVERE, "Unable to close result set due to error {0}", ignore.getMessage());
	          }
	        }

	      } finally {
	        //It's important to close the statement when you are done with it
	        try {
	          stmt.close();
	        } catch (Throwable ignore) {
	          LOGGER.log(Level.SEVERE, "Unable to close statement due to error {0}", ignore.getMessage());
	        }
	      }
	    } catch (SQLException sqle) {
	      LOGGER.log(Level.SEVERE, "Unable to execute DB statement due to error {0}", sqle.getMessage());
	    }
  }
  
  /**
   * 
   * @param rs
   */
  private void displayOneReview(ResultSet rs) {
	    try {
	      // Note the two different ways in which to retrieve the value of a column
	      // Either by specifying the column number or by specifying the column name	    	
        	String deviceName = rs.getString(1);
        	float rating = rs.getFloat(2);
        	String userName = rs.getString(3);
        	String review = rs.getString(4);
        	System.out.printf("%-20s %-20.1f %-20s %-100s %n",deviceName,rating,userName,review);
        	
	    } catch (SQLException sqle) {
	      LOGGER.log(Level.SEVERE, "Unable to process result due to error {0}", sqle.getMessage());
	    }
	  }
  
  
  /**
   * Asks user for the name of the device manufacturer they wish to search for.
   */
  public void searchByRating() {
	  try {
		  userInput.nextLine();
	      PreparedStatement preparedQuery = connection.prepareStatement(SQL_FIND_DEVICES_BY_RATING);
	      try{ 
	    	  System.out.println("Enter the minimum rating you would like to see: ");
	    	  float ratingInput = userInput.nextFloat();
	    	  preparedQuery.setFloat(1, ratingInput);
	    	  
	          ResultSet returnedDevices = preparedQuery.executeQuery();
	          try{
		          do {
		        	  float rating = returnedDevices.getFloat("Rating");
		        	  String deviceName = returnedDevices.getString("Device_Name");
		        	  String model = returnedDevices.getString("Model_Number");
		        	  String software = returnedDevices.getString("Software_Name");
		        	  System.out.printf("%-2.1f %-20s %-20s %-20s %n", rating, deviceName, model, software);
		          
		          } while (returnedDevices.next());
	          }finally{
	        	  try{
	        		  returnedDevices.close();
	        	  }catch(Throwable ignore){
	        		  LOGGER.log(Level.SEVERE,"Unable to process result due to error {0}", ignore.getMessage());
	        	  }
	          }
		  }finally{
	        	  try{
	        		  preparedQuery.close();
	        		  return;
	        	  }catch (Throwable ignore) {
		      LOGGER.log(Level.SEVERE, "Unable to process statement to error {0}", ignore.getMessage());
	        	  }
		  }
	  }catch (SQLException sqle) {
	      LOGGER.log(Level.SEVERE, "Unable to execute DB statement due to error {0}", sqle.getMessage());
	  }
  }

  /**
   * Tests the String to see if it starts with y or Y, for yes response by user.
   *
   * @param userResponse the String with the user's input
   * @return true if it starts with y or Y, false otherwise
   */
  public static boolean isResponseYes(String userResponse) {
    boolean result = false;
    if (null != userResponse) {
      char firstCharacter = userResponse.charAt(0);
      if (firstCharacter == 'y' || firstCharacter == 'Y') {
        result = true;
      }
    }

    return result;
  }
  
  /**
   * Displays a brief summary of what this program does.
   */
  public static void displayInstructions() {
    System.out.println("Tech Review Java Application\n\n");
    System.out.println("This application requires that you have the tech review relational database.\n"
            + "As a user, you will interact with a menu having a variety of options pertaining to\n"
    		+ "your curiosities about the most recent smartphones on the market.\n");
  }
  
  public void displayMainMenu() {
	  int selection = 0;
	  do{
		  System.out.println("\n******************************************************************\n"
			  				+"*                    WELCOME TO THE MAIN MENU                    *\n"
			  				+"******************************************************************\n"
			  				+"* Please make a selection from the following:                    *\n"
			  				+"* 1. View Products                                               *\n"
			  				+"* 2. Write A Review                                              *\n"
			  				+"* 3. Delete User                                                 *\n"
			  				+"* 4. Commit Changes                                              *\n"
			  				+"* 5. Rollback Changes                                            *\n"
			  				+"* 6. Exit                                                        *\n"
			  				+"******************************************************************\n");
	  System.out.print("\nSelection: ");
	  selection = userInput.nextInt();
	  }while(mainMenuOption(selection) != 6);
  }
  public int mainMenuOption(int menuOpt)
  {
	  boolean valid;
	  do {
		  valid = true;
		  switch(menuOpt)
		  {
		  	case 0:{
		  		//prevents menu from going to default if returning from a submenu
		  		break;
		  	}
		  	case 1:{
		  		productSearchMenu();
		  		break;
		  	}
		  	case 2:{
		  		addReview();
		  		break;
		  	}
		  	case 3:{
		  		deleteUser();
		  		break;
		  	}
		  	case 4:{
		  		userInput.nextLine();
		  		System.out.println("Are you sure you want to commit these changes (y/n)?:");
		  		if(isResponseYes(userInput.nextLine()) == true){
		  			System.out.print("Committing changes to the database...");
		  			commitChanges();
		  			System.out.print("done\n");
		  			break;
		  		}
		  	}
		  	case 5:{
		  		userInput.nextLine();
		  		System.out.println("Are you sure you want to rollback these changes (y/n)?:");
		  		if(isResponseYes(userInput.nextLine()) == true){
		  			System.out.print("Rolling back changes to the database...");
		  			rollbackChanges();
		  			System.out.print("done\n");
		  			break;
		  		}		  		
		  	}
		  	case 6:{
		  		userInput.nextLine();
		  		System.out.println("Do you want to commit the last changes made (y/n)?:");
		  		if(isResponseYes(userInput.nextLine()) == true){
		  			System.out.print("Committing changes to the database...");
		  			commitChanges();
		  			System.out.print("done\n");
		  		}
		  		System.out.println("Goodbye...");
		  		break;
		  	}
	  		default: {
	  			System.out.println("\n" + menuOpt + " is an invalid option.\n"
	  							  +"Please re-enter a menu option: ");
	  			menuOpt = userInput.nextInt();
	  			valid = false;
	  			break;
	  		}
		  }
	  }while(valid==false);
	  return menuOpt;
  }
  public void productSearchMenu(){
	  int selection = 0;
	  do{
		  System.out.println("\n******************************************************************\n"
	  						+"*                      PRODUCT SEARCH MENU                       *\n"
	  						+"******************************************************************\n"
	  						+"* Please make a selection from the following:                    *\n"
	  						+"* 1. Display All Products                                        *\n"
	  						+"* 2. View By Rating                                              *\n"
	  						+"* 3. Display All Reviews                                         *\n"
	  						+"* 4. Return To Main Menu                                         *\n"
	  						+"******************************************************************\n");
		  System.out.print("\nSelection: ");
		  selection = userInput.nextInt();
	  }while(productMenuOption(selection) != 4);
	  return;
  }
  public int productMenuOption(int menuOpt){
	  boolean valid;
	  do {
		  valid = true;
		  switch(menuOpt)
		  {
		  	case 0:{
		  		//prevents menu from going to default if returning from a submenu
		  		break;
		  	}
		  	case 1:{
		  		displayAllDevices();
		  		break;
		  	}
		  	case 2:{
		  		searchByRating();
		  		break;
		  	}
		  	case 3:{
		  		displayAllReviews();
		  		break;
		  	}
		  	case 4:{
		  		return(menuOpt);
		  	}
		  	default: {
	  			System.out.println("\n" + menuOpt + " is an invalid option.\n"
	  							  +"Please re-enter a menu option: ");
	  			menuOpt = userInput.nextInt();
	  			valid = false;
	  			break;
	  		}
		  }
	  }while(valid==false);
	  return menuOpt;
  }
}
