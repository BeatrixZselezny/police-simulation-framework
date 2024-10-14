
  package botnet;



  import java.util.ArrayList;
  import java.util.List;
  import cybercriminals.CyberCriminal;


  public class Botnet {
     private String name;
     private List<Bot> bots;


     public Botnet(String name) {
        this.name = name;
	this.bots = new ArrayList<>();

     }

     public void addBot(Bot bot) {
        bots.add(bot);

     }

     public void executeCommand(String command) {
        for (Bot bot : bots) {
	    bot.executeCommand(command);
	}

     }

     public void launchDDoSAttack(String target) {
         System.out.println("Launching DDoS attack on: " + target);
	 executeCommand("DDoS attack on " + target);
     }

     public void sendSpamEmails(String message) {
         System.out.println("Sending spam emails with message: " + message);
	 executeCommand("Send spam email: " + message);

     }

     public void mineCryptocurrency() {
         System.out.println("Mining cryptocurrency...");
	 executeCommand("Mine cryptocurrency");

     }
  }
