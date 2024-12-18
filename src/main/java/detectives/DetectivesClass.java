 package detectives;


// This class is named DetectivesClass
public class DetectivesClass {
// This method is named main
	 public static void main(String[] args) {
		 System.out.println("We are Police Detectives!");

	 

         DetectivesClass peter = new DetectivesClass();
	 DetectivesClass marc = new DetectivesClass();
	 DetectivesClass marry = new DetectivesClass();
	 DetectivesClass andy = new DetectivesClass();
	 DetectivesClass phil = new DetectivesClass();
	 DetectivesClass vicky = new DetectivesClass();
	 peter.DetectivePeter();
	 peter.printPeterDetails();
	 marc.DetectiveMarc();
	 marc.printMarcDetails();
	 marry.DetectiveMarry();
	 marry.printMarryDetails();
	 andy.DetectiveAndy();
	 andy.printAndyDetails();
	 phil.DetectivePhil();
	 phil.printPhilDetails();
	 vicky.DetectiveVicky();
	 vicky.printVickyDetails();
	 
   }    


// This method is named DetectivePeter
	 public void DetectivePeter() {
                 System.out.println("I'm, Police detective Peter! ");
	 }
         
// This method is named DetectiveMarc
         public void DetectiveMarc() {
	         System.out.println("I'm, Police detective Marc!");	 
         }

// This method is named DetectiveMarry
	 public void DetectiveMarry() {
		 System.out.println("I'm, Police detective Marry!");
	 }

// This method is named DetectiveAndy
	 public void DetectiveAndy() {
		 System.out.println("I'm, Police detective Andy!");
	 }

// This method is named DetectivePhil
	 public void DetectivePhil() {
		 System.out.println("I'm, Police detective Phil!");
	 }

// This method is named DetectiveVicky
	 public void DetectiveVicky() {
		 System.out.println("I'm, Police detective Vicky!");
	 }




         String[][] peter = {
		 {"Name:", "Peter Winston"},
		 {"Age:", "46"},
		 {"Rank:", "Criminal Investigator"},
		 {"Department:", "Criminal"}
	 };

	 String[][] marc = {
		 {"Name:", "Marc Hamilton"},
		 {"Age:", "40"},
		 {"Rank:", "Financial Investigator"},
		 {"Department:", "Financial"}
	 };

	 String[][] marry = {
		 {"Name:", "Marry Roberts"},
		 {"Age:", "37"},
		 {"Rank:", "Criminal Investigator"},
		 {"Department:", "Criminal"}
	 };

	 String[][] andy = {
		 {"Name:", "Andy Folk"},
		 {"Age:", "28"},
		 {"Rank:", "Technical Investigator"},
		 {"Department:", "Technical"}
	 };

	 String[][] phil = {
		 {"Name:", "Phil Evans"},
		 {"Age:", "49"},
		 {"Rank:", "Financial Investigator"},
		 {"Department:", "Financial"}
	 };

	 String[][] vicky = {
		 {"Name:", "Vicky Moore"},
		 {"Age:", "30"},
		 {"Rank:", "Criminal Investigator"},
		 {"Department:", "Criminal"}
	 };




// This method is named printPeterDetails
	 public void printPeterDetails() {
		 for (int i = 0; i < peter.length; i++) {
			 System.out.println(peter[i][0] + " " + peter[i][1]);
		 }
          }

// This method is named printMarcDetails
	 public void printMarcDetails() {
		 for (int i = 0; i < marc.length; i++) {
			 System.out.println(marc[i][0] + " " + marc[i][1]);

        	 }

          }

// This method is named printMarryDetails
	 public void printMarryDetails() {
		 for (int i = 0; i < marry.length; i++) {
			 System.out.println(marry[i][0] + " " + marry[i][1]);
		 }
	 }

// This method is named printAndyDetails
	 public void printAndyDetails() {
		 for (int i = 0; i < andy.length; i++) {
			 System.out.println(andy[i][0] + " " + andy[i][1]);
		 }
        }

// This method is named printPhilDetails
	 public void printPhilDetails() {
		 for (int i = 0; i < phil.length; i++) {
			 System.out.println(phil[i][0] + " " + phil[i][1]);
		 }
        }

// This method is named printVickyDetails
	 public void printVickyDetails() {
		 for (int i = 0; i < vicky.length; i++) {
			 System.out.println(vicky[i][0] + " " + vicky[i][1]);
		 }
	 }
 

}

