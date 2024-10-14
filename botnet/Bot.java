
  package botnet;



  public class Bot {
     private String ipAddress;
     private boolean active;

     public Bot(String ipAddress) {
        this.ipAddress = ipAddress;
	this.active = true;

     }
 
     public String getIpAddress() {
        return ipAddress;
     }
     
     public boolean isActive() {
        return active;
     }

     public void deactivate() {
        this.active = false;
     }


     public void executeCommand(String command) {
        if (active) {
	   System.out.println("Executing command: " + command + " on bot with IP: " + ipAddress);

	} else {
	
	  System.out.println("Bot with IP: " + ipAddress + " is inactive");
	
	}
   
     }


  }
