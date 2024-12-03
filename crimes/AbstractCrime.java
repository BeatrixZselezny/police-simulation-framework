
  package crimes;


  // Abstract class representing a generic crime, implementing the Crime interface
  public abstract class AbstractCrime implements Crime {
     private boolean caught;
     private String type;


     // Constructor to initialize an AbstractCrime object with a type and set it as not caught
     public AbstractCrime(String type) {
        this.type = type;
	this.caught = false;

     }


     // Method to check if the crime has been caught
     @Override

     public boolean isCaught() {
        return caught;
     }

     // Method to get the type of crime
     @Override

     public String getType() {
        return type;

     }

     // Method to set the caught status of the crime
     public void setCaught(boolean caught) {
        this.caught = caught;

     }

     // Abstract method to be implemented by subclasses to define how the crime is committed
     public abstract void commitCrime();

  }
