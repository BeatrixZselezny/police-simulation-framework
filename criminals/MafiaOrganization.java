 package criminals;
 import java.util.List;




   public class MafiaOrganization {
	   public static void main(String[] args) {
		   Mafia mafia = new Mafia("Italian Mafia");
		   MafiaBoss boss = new MafiaBoss("Don Vito", 60, 100, 80, 90);
		   Underboss underboss = new Underboss("Michael", 40, 90, 75, 85);
		   Capo capo = new Capo("Sonny", 35, 85, 70, 80);
		   Soldier soldier1 = new Soldier("Paulie", 30, 70, 60, 65);
		   Soldier soldier2 = new Soldier("Clemenza", 45, 75, 65, 70);
		   Soldier soldier3 = new Soldier("Corzi", 28, 65, 55, 60);
		   Soldier soldier4 = new Soldier("Morales", 41, 80, 70, 75);
		   Soldier soldier5 = new Soldier("Mauro", 26, 60, 50, 55);
		   Consigliere consigliere = new Consigliere("Tom", 40, 95, 60, 95);

		   boss.addSubordinate(underboss);
		   boss.addSubordinate(consigliere);
		   underboss.addSubordinate(capo);
		   capo.addSoldier(soldier1);
		   capo.addSoldier(soldier2);
		   capo.addSoldier(soldier3);
		   capo.addSoldier(soldier4);
		   capo.addSoldier(soldier5);

		   mafia.addMember(boss);



		   DrugDen drugDen = new DrugDen("Downtown Drug Den");
		   DrugDealer dealer1 = new DrugDealer("Tony", 35, 10, 80);
		   drugDen.addMember(dealer1);


		   Brothel brothel = new Brothel("Red Light District");
		   HumanTrafficker trafficker1 = new HumanTrafficker("Alice", 30, 8, 75);
		   brothel.addMember(trafficker1);
                   
		   printOrganizationMembers(mafia);
		   printOrganizationMembers(drugDen);
		   printOrganizationMembers(brothel);

	   }

	   public static void printOrganizationMembers(CriminalOrganization organization) {
	    System.out.println("Organization: " + organization.getName());
	    for (Criminal member : organization.getMembers()) {
	        printCriminal(member);
	    }
	}



	   public static void printCriminal(Criminal criminal) {
	      System.out.println(criminal);
	      if (criminal instanceof MafiaBoss) {
	          List<MafiaCriminal> subordinates = ((MafiaBoss) criminal).getSubordinates();
		  for (MafiaCriminal subordinate : subordinates) {
		      printCriminal(subordinate);
		  }  
	        } else if (criminal instanceof Underboss) {
		     List<MafiaCriminal> subordinates = ((Underboss) criminal).getSubordinates();	 
		     for (MafiaCriminal subordinate : subordinates) {
			     printCriminal(subordinate);
		     }
		  }  else if (criminal instanceof Capo) {
	   	     List<? extends MafiaCriminal> soldiers = ((Capo) criminal).getSoldiers();
                     for (MafiaCriminal soldier : soldiers) {
		             printCriminal(soldier);
		     }

	      }
	}
}

