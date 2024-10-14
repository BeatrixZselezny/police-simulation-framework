  package cybercriminals;
  
  import cybercriminals.Abuser; 
  import cybercriminals.Hactivist;
  import cybercriminals.ScriptKiddie;
  import cybercriminals.StateActor;
  import cybercriminals.InsiderThreat;
  import cybercriminals.Scammer;
  import botnet.Botnet;
  import botnet.BotnetMaster;
  import botnet.Bot;
  import cybercriminals.Scammer;
  import cybercriminals.CyberCriminalGroup;
  import botnet.Botnet;
  import botnet.BotnetMaster;
  import botnet.Bot;





  public class CyberCriminalOrganization {
     public static void main(String[] args) {
        Abuser abuser = new Abuser("Adele", 40);
	Hactivist hactivist = new Hactivist("Anonymus", 25);
	ScriptKiddie scriptKiddie = new ScriptKiddie("Newbie", 18);
	StateActor stateActor = new StateActor("Agent Smith", 40);
	InsiderThreat insiderThreat = new InsiderThreat("Esther Blue", 58);
	Scammer scammer = new Scammer("Louis Nut", 50);
	BotnetMaster botnetMaster = new BotnetMaster("BotMaster", 30);
	Botnet botnet = new Botnet("Global Botnet");

	Bot bot1 = new Bot("192.168.1.1");
	Bot bot2 = new Bot("192.168.1.2");
	Bot bot3 = new Bot("192.168.1.3");

	botnet.addBot(bot1);
	botnet.addBot(bot2);
	botnet.addBot(bot3);

	botnetMaster.controlBots(botnet, "launchDDoSAttack");
	botnet.launchDDoSAttack("example.com");
	botnet.sendSpamEmails("Buy Now!");
	botnet.mineCryptocurrency();


	CyberCriminalGroup cyberCriminalGroup = new CyberCriminalGroup("Dark Web Group",5);
	cyberCriminalGroup.addMember(hactivist);
	cyberCriminalGroup.addMember(scriptKiddie);

	System.out.println(" Cyber Criminals Organization:");
	abuser.commitCyberCrime(" I wana hurt someone..");
	hactivist.commitCyberCrime(" I wana deface your website!");
	scriptKiddie.commitCyberCrime(" I wana write some funny script to you.");
	stateActor.commitCyberCrime(" I wana espionage behind you");
	insiderThreat.commitCyberCrime(" I wana give outside your company datas");
	scammer.commitCyberCrime(" I wana send in Email some funny to you");
	cyberCriminalGroup.commitCyberCrime(" Coordinate attack");

     }

  }


