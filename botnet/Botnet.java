
  package botnet;



  import java.util.ArrayList;
  import java.util.List;
  import cybercriminals.CyberCriminal;

  // Class representing a botnet
  public class Botnet {
     private String name;
     private List<Bot> bots;

     // Constructor to initialize a Botnet object with a name and an empty list of bots
     public Botnet(String name) {
        this.name = name;
	this.bots = new ArrayList<>();

     }

     // Method to add a bot to the botnet
     public void addBot(Bot bot) {
        bots.add(bot);

     }

     // Method to execute a command on all active bots in the botnet
     public void executeCommand(String command) {
        for (Bot bot : bots) {
	    bot.executeCommand(command);
	}

     }

     // Method to launch a DDoS attack on a specified target
     public void launchDDoSAttack(String target) {
         System.out.println("Launching DDoS attack on: " + target);
	 executeCommand("DDoS attack on " + target);
     }

     // Method to send spam emails with a specified message
     public void sendSpamEmails(String message) {
         System.out.println("Sending spam emails with message: " + message);
	 executeCommand("Send spam email: " + message);

     }

     // Method to mine cryptocurrency using all active bots
     public void mineCryptocurrency() {
         System.out.println("Mining cryptocurrency...");
	 executeCommand("Mine cryptocurrency");

     }
  }
