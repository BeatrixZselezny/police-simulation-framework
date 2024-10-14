
  package crimes;

  import criminals.Criminal;
  import policeofficers.PoliceOfficersClass;


  public class CrimeSimulation {
     public static void main(String[] args) {
        Criminal criminal = new Criminal("John Doe");
	PoliceOfficersClass police = new PoliceOfficersClass();

	Crime robbery = new Robbery();
	Crime hacking = new Hacking();
	Crime drugDealing = new DrugDealing();
	Crime carTheft = new CarTheft();

	criminal.performCrime(robbery);
	criminal.performCrime(hacking);
	criminal.performCrime(drugDealing);
	criminal.performCrime(carTheft);


	police.catchCriminal(robbery);
	police.catchCriminal(hacking);
	police.catchCriminal(drugDealing);
	police.catchCriminal(carTheft);
     }
  
  }
