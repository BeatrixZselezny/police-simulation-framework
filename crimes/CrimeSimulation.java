
  package crimes;

  import criminals.Criminal;
  import policeofficers.PoliceOfficersClass;


  public class CrimeSimulation {
     public static void main(String[] args) {

	Crime drugDealing = new DrugDealing();
	Crime carTheft = new CarTheft();

        carTheft.commitCrime();
	drugDealing.commitCrime();

	carTheft.getCaught();
	drugDealing.getCaught();
	
     }
  
  }
