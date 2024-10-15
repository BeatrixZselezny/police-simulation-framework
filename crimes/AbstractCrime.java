
  package crimes;


  public abstract class AbstractCrime implements Crime {
     private boolean caught;
     private String type;


     public AbstractCrime(String type) {
        this.type = type;
	this.caught = false;

     }


     @Override

     public boolean isCaught() {
        return caught;
     }

     @Override

     public String getType() {
        return type;

     }

     public void setCaught(boolean caught) {
        this.caught = caught;

     }

     public abstract void commitCrime();
  
  }
