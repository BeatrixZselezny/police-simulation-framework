  
  package botnet;

  import cybercriminals.CyberCriminal;



  public class BotnetMaster extends CyberCriminal {
     public BotnetMaster(String name, int age) {
        super(name, age);

     }

     @Override

     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is sending command to botnet: " + command);

     }

     public void controlBots(Botnet botnet, String command) {
         System.out.println(getName() + " is sending command to botnet: " + command);
	 botnet.executeCommand(command);

     }
  }
  
