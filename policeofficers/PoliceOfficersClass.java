 package policeofficers;


 import crimes.Crime;




public class PoliceOfficersClass {
	 public static void main(String[] args) {
		 System.out.println("We are Police Officers!");

	 

         PoliceOfficersClass poc = new PoliceOfficersClass();
	 PoliceOfficersClass tom = new PoliceOfficersClass();
	 PoliceOfficersClass lucy = new PoliceOfficersClass();
	 PoliceOfficersClass leslie = new PoliceOfficersClass();
	 PoliceOfficersClass angela = new PoliceOfficersClass();
	 PoliceOfficersClass alan = new PoliceOfficersClass();
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


	 public void OfficerJane() {
                 System.out.println("I'm, Police officer Jane! ");
	 }
         
         public void OfficerTom() {
	         System.out.println("I'm, Police officer Tom!");	 
         }

	 public void OfficerLucy() {
		 System.out.println("I'm, Police officer Lucy!");
	 }

	 public void OfficerLeslie() {
		 System.out.println("I'm, Police officer Leslie!");
	 }

	 public void OfficerAngela() {
		 System.out.println("I'm, Police officer Angela!");
	 }

	 public void OfficerAlan() {
		 System.out.println("I'm, Police officer Alan!");
	 }




         String[][] jane = {
		 {"Name:", "Jane Smith"},
		 {"Age:", "34"},
		 {"Rank:", "Corporal"},
		 {"Department:", "Patrol"}
	 };

	 String[][] tom = {
		 {"Name:", "Tom Wargas"},
		 {"Age:", "45"},
		 {"Rank:", "Sergant"},
		 {"Department:", "Patrol"}
	 };

	 String[][] lucy = {
		 {"Name:", "Lucy Walles"},
		 {"Age:", "23"},
		 {"Rank:", "Junior Patrol"},
		 {"Department:", "Patrol"}
	 };

	 String[][] leslie = {
		 {"Name:", "Leslie Jackson"},
		 {"Age:", "48"},
		 {"Rank:", "Senior Sergant"},
		 {"Department:", "Patrol"}
	 };

	 String[][] angela = {
		 {"Name:", "Angela Morris"},
		 {"Age:", "39"},
		 {"Rank:", "Guard Leader"},
		 {"Department:", "Patrol"}
	 };

	 String[][] alan = {
		 {"Name:", "Alan White"},
		 {"Age:", "30"},
		 {"Rank:", "Patrol"},
		 {"Department:", "Patrol"}
	 };




	 public void printJaneDetails() {
		 for (int i = 0; i < jane.length; i++) {
			 System.out.println(jane[i][0] + " " + jane[i][1]);
		 }
          }

	 public void printTomDetails() {
		 for (int i = 0; i < tom.length; i++) {
			 System.out.println(tom[i][0] + " " + tom[i][1]);

        	 }

          }

	 public void printLucyDetails() {
		 for (int i = 0; i < lucy.length; i++) {
			 System.out.println(lucy[i][0] + " " + lucy[i][1]);
		 }
	 }

	 public void printLeslieDetails() {
		 for (int i = 0; i < leslie.length; i++) {
			 System.out.println(leslie[i][0] + " " + leslie[i][1]);
		 }
        }

	 public void printAngelaDetails() {
		 for (int i = 0; i < angela.length; i++) {
			 System.out.println(angela[i][0] + " " + angela[i][1]);
		 }
        }

	 public void printAlanDetails() {
		 for (int i = 0; i < alan.length; i++) {
			 System.out.println(alan[i][0] + " " + alan[i][1]);
		 }
	 }
 

}

