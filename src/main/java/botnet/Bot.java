
  package botnet;


  // Class representing a bot in a botnet
  public class Bot {
// This method is named ipAddress;
     private String ipAddress;
// This method is named active;
     private boolean active;

     // Constructor to initialize a Bot object with an IP address and set it as active
     public Bot(String ipAddress) {
        this.ipAddress = ipAddress;
	this.active = true;

     }

     // Getter method to retrieve the IP address of the bot
     public String getIpAddress() {
        return ipAddress;
     }

     // Method to check if the bot is active
     public boolean isActive() {
        return active;
     }

     // Method to deactivate the bot
     public void deactivate() {
        this.active = false;
     }


     // Method to execute a command on the bot if it is active
     public void executeCommand(String command) {
        if (active) {
	   System.out.println("Executing command: " + command + " on bot with IP: " + ipAddress);

	} else {

	  System.out.println("Bot with IP: " + ipAddress + " is inactive");

	}

     }


  }
