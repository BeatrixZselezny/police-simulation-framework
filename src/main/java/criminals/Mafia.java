  package criminals;
  import java.util.ArrayList;
  import java.util.List;

  // Class representing a Mafia organization, extending CriminalOrganization
  public class Mafia extends CriminalOrganization {
// This method is named members;
     private List<Criminal> members;

     // Constructor to initialize a Mafia object with a name and an empty list of members
     public Mafia(String name) {
        super(name);
	this.members = new ArrayList<>();
     }

     // Method to add a member (Mafia criminal) to the Mafia organization
     public void addMember(MafiaCriminal member) {
        this.members.add(member);
     }

     // Overriding the method to get the list of members (criminals) in the Mafia organization
     @Override

// This method is named getMembers
     public List<? extends Criminal> getMembers() {
        return members;
     }
  }
