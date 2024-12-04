
  package crimes;

  // Class representing the crime of car theft, extending AbstractCrime
  public class CarTheft extends AbstractCrime {
     // Constructor to initialize a CarTheft object with the type "Car Theft"
     public CarTheft() {
        super("Car Theft");
     }


     // Method to handle the scenario when the car theft is caught
     @Override
// This method is named getCaught
     public void getCaught() {
	System.out.println(getType() + " caught!");
	setCaught(true);

       }

     // Method to commit the car theft crime
     @Override
// This method is named commitCrime
     public void commitCrime() {
        System.out.println(getType() + " crime committed!");
        setCaught(true);

       }

     }



  
