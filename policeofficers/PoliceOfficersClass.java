 package policeofficers;


 /** Class representing the all police officers' Patrols.
  *
  * Main method execute all police officers' Patrols actions.
  */
 import crimes.Crime;




// This class is named PoliceOfficersClass
public class PoliceOfficersClass {

     /**
      * Main method to execute all police officers' patrol actions.
      *
      * @param args command line arguments
      */
// This method is named main
	 public static void main(String[] args) {
		 System.out.println("We are Police Officers!");


         // Initialize all police officers' patrols
         PoliceOfficersClass poc = new PoliceOfficersClass();
	 PoliceOfficersClass tom = new PoliceOfficersClass();
	 PoliceOfficersClass lucy = new PoliceOfficersClass();
	 PoliceOfficersClass leslie = new PoliceOfficersClass();
	 PoliceOfficersClass angela = new PoliceOfficersClass();
	 PoliceOfficersClass alan = new PoliceOfficersClass();

         // Execute officers' introductions and print their details
	 poc.OfficerJane();
	 poc.printJaneDetails();
	 tom.OfficerTom();
	 tom.printTomDetails();
	 lucy.OfficerLucy();
	 lucy.printLucyDetails();
	 leslie.OfficerLeslie();
	 leslie.printLeslieDetails();
	 angela.OfficerAngela();
	 angela.printAngelaDetails();
	 alan.OfficerAlan();
	 alan.printAlanDetails();

   }

         // Method to introduce Officer Jane
	 public void OfficerJane() {
                 System.out.println("I'm, Police officer Jane! ");
	 }

         // Method to introduce Officer Tom
                  public void OfficerTom() {
	         System.out.println("I'm, Police officer Tom!");
         }

         // Method to introduce Officer Lucy
	 public void OfficerLucy() {
		 System.out.println("I'm, Police officer Lucy!");
	 }

         // Method to introduce Officer Leslie
	 public void OfficerLeslie() {
		 System.out.println("I'm, Police officer Leslie!");
	 }

         // Method to introduce Officer Angela
	 public void OfficerAngela() {
		 System.out.println("I'm, Police officer Angela!");
	 }

         // Method to introduce Officer Alan
	 public void OfficerAlan() {
		 System.out.println("I'm, Police officer Alan!");
	 }



         // Define officer Jane properties
         String[][] jane = {
		 {"Name:", "Jane Smith"},
		 {"Age:", "34"},
		 {"Rank:", "Corporal"},
		 {"Department:", "Patrol"}
	 };
         // Define officer Tom properties
	 String[][] tom = {
		 {"Name:", "Tom Wargas"},
		 {"Age:", "45"},
		 {"Rank:", "Sergant"},
		 {"Department:", "Patrol"}
	 };
         // Define officer Lucy properties
	 String[][] lucy = {
		 {"Name:", "Lucy Walles"},
		 {"Age:", "23"},
		 {"Rank:", "Junior Patrol"},
		 {"Department:", "Patrol"}
	 };
         // Define officer Leslie properties
	 String[][] leslie = {
		 {"Name:", "Leslie Jackson"},
		 {"Age:", "48"},
		 {"Rank:", "Senior Sergant"},
		 {"Department:", "Patrol"}
	 };
         // Define officer Angela properties
	 String[][] angela = {
		 {"Name:", "Angela Morris"},
		 {"Age:", "39"},
		 {"Rank:", "Guard Leader"},
		 {"Department:", "Patrol"}
	 };
         // Define officer Alan properties
	 String[][] alan = {
		 {"Name:", "Alan White"},
		 {"Age:", "30"},
		 {"Rank:", "Patrol"},
		 {"Department:", "Patrol"}
	 };



         //  Method to print officer Jane details
	 public void printJaneDetails() {
		 for (int i = 0; i < jane.length; i++) {
			 System.out.println(jane[i][0] + " " + jane[i][1]);
		 }
          }

         //  Method to print officer Tom details
	 public void printTomDetails() {
		 for (int i = 0; i < tom.length; i++) {
			 System.out.println(tom[i][0] + " " + tom[i][1]);

        	 }

          }

         //  Method to print officer Lucy details
	 public void printLucyDetails() {
		 for (int i = 0; i < lucy.length; i++) {
			 System.out.println(lucy[i][0] + " " + lucy[i][1]);
		 }
	 }

         //  Method to print officer Leslie details
	 public void printLeslieDetails() {
		 for (int i = 0; i < leslie.length; i++) {
			 System.out.println(leslie[i][0] + " " + leslie[i][1]);
		 }
        }

         //  Method to print officer Angela details
	 public void printAngelaDetails() {
		 for (int i = 0; i < angela.length; i++) {
			 System.out.println(angela[i][0] + " " + angela[i][1]);
		 }
        }

         //  Method to print officer Alan details
	 public void printAlanDetails() {
		 for (int i = 0; i < alan.length; i++) {
			 System.out.println(alan[i][0] + " " + alan[i][1]);
		 }
	 }


}

