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
   * Query to retrieve all loans including the owner of each loan in ascending order of sale price
   */
  private final static String SQL_FIND_ALL_DEVICES =
          "SELECT r.name AS Retailer_Name, d.name AS Device_Name ,d.model_number AS Device_Model, d.listed_price AS Listed_Price,s.sale_price AS Sale_Price "
		  + "FROM Sales s "
		  + "LEFT OUTER JOIN Retailers r on s.retailer_id = r.retailer_id "
		  + "LEFT OUTER JOIN Devices d ON d.dev_id = s.dev_id "
		  + "GROUP BY s.sale_price";

  /**
   * Query to retrieve the loans (number and amount) of a specified customer
   */
  private final static String SQL_FIND_SPECIFIC_DEVICE =
          "SELECT d.name AS Device_name, m.name AS Manufacturer_Name, s.name AS Software_name, s.version AS Software_version "
		  +"FROM Devices d "
		  +"LEFT OUTER JOIN Manufacturers m ON d.mfctr_id = m.mfctr_id "
		  +"LEFT OUTER JOIN Software s ON d.soft_id = s.soft_id "
		  +"WHERE m.name = ?";
  
  /**
   * Query to insert a user into the DB
   */
  private final static String SQL_INSERT_USER =
		  "INSERT INTO Users(username, first_name, last_name) VALUES "
		  +"(?, ?, ?)";
  /**
   * Query to insert a user into the DB
   */
  private final static String SQL_INSERT_REVIEW =
		  "INSERT INTO Reviews(dev_id, username, rating, review) VALUES "
          +"(?, ?, ?)";
        
  
  /**
   * Query to display all reviews in DB
   */
  private final static String SQL_DISPLAY_ALL_REVIEWS =
		  "SELECT d.name, r.rating, r.username, r.review "
		  +"FROM reviews r INNER JOIN devices d ON r.dev_id = d.dev_id "
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
        	String retailerName = "Retailer Name";
        	String deviceName = "Device Name";
        	String lPrice = "Listed Price";
        	String sPrice = "Sale Price";
        	System.out.printf("%-20s %-20s %-15s %-15s %n",retailerName,deviceName,lPrice,sPrice);
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
      // Note the two different ways in which to retrieve the value of a column
      // Either by specifying the column number or by specifying the column name
      String retailerName = rs.getString(1);
      String deviceName = rs.getString(2);
      System.out.printf("%-20s %-20s $%-15.2f $%-15.2f %n", retailerName, deviceName, rs.getFloat("listed_price"), rs.getFloat("sale_price"));

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
	      PreparedStatement addUserQuery = connection.prepareStatement(SQL_INSERT_USER);	      
	 
    	  System.out.println("In order to leave a review, please create a username: ");
    	  String username = userInput.nextLine();
    	  while(username.equals(" ")){
    		  System.out.println("Username is mandatory: ");
        	  username = userInput.nextLine();
    	  }
    	  System.out.println("Provide your full name (this is optional): ");
    	  String line = userInput.nextLine();
    	  String name[] = line.split(" ");
    	  String review = userInput.next();
    	  addUserQuery.setString(1, username);
    	  addUserQuery.setString(2, name[0]);
    	  addUserQuery.setString(3, name[1]);
    	  addUserQuery.setString(4, review);
    	  
    	  System.out.println("What device are you reviewing?\n"
    			  			+"(*Note* device must exist in database): ");
    	  String device = userInput.nextLine();

          addUserQuery.executeUpdate();	
          displayAllReviews();
          return;
	          
	      }catch (SQLException sqle) {
	      LOGGER.log(Level.SEVERE, "Unable to process result due to error {0}", sqle.getMessage());
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
  public void searchByName() {
	  try {
	      PreparedStatement preparedQuery = connection.prepareStatement(SQL_FIND_SPECIFIC_DEVICE);

	      String userResponse;
	      
	      do{
	    	  System.out.println("Name of manufacturer: ");
	    	  String name = userInput.nextLine();
	    	  preparedQuery.setString(1, name);

	          ResultSet returnedDevices = preparedQuery.executeQuery();
	          if (!returnedDevices.next()) {
	            System.out.println("No devices made by " + name + " were found.");
	          } 
	          else {
	            do {
	            	String mfctrName = returnedDevices.getString(1);
	                String deviceName = returnedDevices.getString(2);
	            	String softName = returnedDevices.getString(3);
	                String softVersion = returnedDevices.getString(4);
	                System.out.printf("%-20s %-20s %-20s %-20s %n", mfctrName, deviceName, softName, softVersion);
	              
	            } while (returnedDevices.next());
	          }	    	  
	    	  
	    	  System.out.print("Continue searching (y/n)?: ");
	          userResponse = userInput.nextLine();
	        } while (isResponseYes(userResponse));
	      return;
	      }catch (SQLException sqle) {
	      LOGGER.log(Level.SEVERE, "Unable to process result due to error {0}", sqle.getMessage());
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
	  String selection = "";
	  do{
		  System.out.println("\n******************************************************************\n"
			  				+"*                    WELCOME TO THE MAIN MENU                    *\n"
			  				+"******************************************************************\n"
			  				+"* Please make a selection from the following:                    *\n"
			  				+"* 1. User Account Options                                        *\n"
			  				+"* 2. Product Search                                              *\n"
			  				+"* 3. Write A Review                                              *\n"
			  				+"* 4. Commit Changes                                              *\n"
			  				+"* 5. Undo Changes                                                *\n"
			  				+"* 6. Exit                                                        *\n"
			  				+"******************************************************************\n");
	  System.out.println("Selection: ");
	  selection = userInput.nextLine();
	  }while(!mainMenuOption(selection).equals("6"));
  }
  public String mainMenuOption(String opt1)
  {
	  boolean valid;
	  do {
		  valid = true;
		  switch(opt1)
		  {
		  	case "1":{
		  		
		  	}
		  	case "2":{
		  		productSearchMenu();
		  		break;
		  	}
		  	case "3":{
		  		addReview();
		  		break;
		  	}
		  	case "4":{
		  		System.out.println("Are you sure you want to commit these changes (y/n)?:");
		  		if(isResponseYes(userInput.nextLine()) == true){
		  			System.out.print("Committing changes to the database...");
		  			commitChanges();
		  			System.out.print("done\n");
		  			break;
		  		}
		  	}
		  	case "5":{
		  		System.out.println("Are you sure you want to rollback these changes (y/n)?:");
		  		if(isResponseYes(userInput.nextLine()) == true){
		  			System.out.print("Rolling back changes to the database...");
		  			rollbackChanges();
		  			System.out.print("done\n");
		  			break;
		  		}		  		
		  	}
		  	case "6":{
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
	  			System.out.println("\n" + opt1 + " is an invalid option.\n"
	  							  +"Please re-enter a menu option: ");
	  			opt1 = userInput.nextLine();
	  			valid = false;
	  			break;
	  		}
		  }
	  }while(valid==false);
	  return opt1;
  }
  public void productSearchMenu(){
	  String selection = "";
	  do{
		  System.out.println("\n******************************************************************\n"
	  						+"*                      PRODUCT SEARCH MENU                       *\n"
	  						+"******************************************************************\n"
	  						+"* Please make a selection from the following:                    *\n"
	  						+"* 1. Display All Products                                        *\n"
	  						+"* 2. Search By Product Name                                      *\n"
	  						+"* 3. Display All Reviews                                         *\n"
	  						+"* 4. Return To Main Menu                                         *\n"
	  						+"******************************************************************\n");
		  System.out.println("Selection: ");
		  selection = userInput.nextLine();
	  }while(!productMenuOption(selection).equals("4"));
	  return;
  }
  public String productMenuOption(String opt2){
	  boolean valid;
	  do {
		  valid = true;
		  switch(opt2)
		  {
		  	case "1":{
		  		displayAllDevices();
		  		break;
		  	}
		  	case "2":{
		  		searchByName();
		  		break;
		  	}
		  	case "3":{
		  		displayAllReviews();
		  		break;
		  	}
		  	case "4":{
		  		return(opt2);
		  	}
		  	default: {
	  			System.out.println("\n" + opt2 + " is an invalid option.\n"
	  							  +"Please re-enter a menu option: ");
	  			opt2 = userInput.nextLine();
	  			valid = false;
	  			break;
	  		}
		  }
	  }while(valid==false);
	  return opt2;
  }
}
