
  package crimes;

  import criminals.Criminal;
  import policeofficers.PoliceOfficersClass;

  // Class to simulate various crimes and their handling
  public class CrimeSimulation {
     public static void main(String[] args) {
        // Creating instances of different types of crimes
	Crime drugDealing = new DrugDealing();
	Crime carTheft = new CarTheft();

        // Committing the crimes
        carTheft.commitCrime();
	drugDealing.commitCrime();

        // Handling the scenario when the crimes are caught
	carTheft.getCaught();
	drugDealing.getCaught();

     }

  }
