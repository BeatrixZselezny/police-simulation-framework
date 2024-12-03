  package criminals;
  import java.util.List;

  // Abstract class representing a generic criminal organization
  public abstract class CriminalOrganization {
     protected String name;

     // Constructor to initialize a CriminalOrganization object with a name
     public CriminalOrganization(String name) {
        this.name = name;
     }

     // Method to get the name of the criminal organization
     public String getName() {
        return name;
     }


     // Abstract method to get the list of members in the criminal organization
     public abstract List<? extends Criminal> getMembers();

     // Overriding the toString method to provide a string representation of the criminal organization
     @Override

     public String toString() {
        return "Organization: " + name;
     }

  }
