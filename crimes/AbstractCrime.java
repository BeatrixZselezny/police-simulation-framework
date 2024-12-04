
  package crimes;


// This class is named representing
  // Abstract class representing a generic crime, implementing the Crime interface
  public abstract class AbstractCrime implements Crime {
// This method is named caught;
     private boolean caught;
// This method is named type;
     private String type;


     // Constructor to initialize an AbstractCrime object with a type and set it as not caught
     public AbstractCrime(String type) {
        this.type = type;
	this.caught = false;

     }


     // Method to check if the crime has been caught
     @Override

// This method is named isCaught
     public boolean isCaught() {
        return caught;
     }

     // Method to get the type of crime
     @Override

// This method is named getType
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
