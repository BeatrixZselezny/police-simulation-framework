
  package botnet;

  import cybercriminals.CyberCriminal;


  // Class representing a botnet master, extending from CyberCriminal
  public class BotnetMaster extends CyberCriminal {
     // Constructor to initialize a BotnetMaster object with a name and age
     public BotnetMaster(String name, int age) {
        super(name, age);

     }

     // Overriding the commitCyberCrime method to send a command to the botnet
     @Override

// This method is named commitCyberCrime
     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is sending command to botnet: " + command);

     }

     // Method to control the bots in the botnet by executing a given command
     public void controlBots(Botnet botnet, String command) {
         System.out.println(getName() + " is sending command to botnet: " + command);
	 botnet.executeCommand(command);

     }
  }

