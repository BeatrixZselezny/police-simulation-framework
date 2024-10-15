
  package crimes;


  public class DrugDealing extends AbstractCrime {
     public DrugDealing() {
        super("Drug Dealing");
     }


     @Override

     public void commitCrime() {
        System.out.println(getType() + " committed!");
	setCaught(true);
     }

     @Override

     public void getCaught() {
        System.out.println(getType() + " caught!");
	setCaught(true);

     }
  }
