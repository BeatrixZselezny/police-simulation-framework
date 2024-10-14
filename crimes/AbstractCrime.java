
  package crimes;


  public abstract class AbstractCrime implements Crime {
     String type;
     boolean isCaught;


     public AbstractCrime(String type) {
        this.type = type;
	this.isCaught = false;

     }


     @Override

     public void getCaught() {
        this.isCaught = true;
	System.out.println("Caught for crime: " + type);
     }
  }
