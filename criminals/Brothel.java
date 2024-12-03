  package criminals;

  import java.util.ArrayList;
  import java.util.List;

  // Class representing a brothel as a criminal organization
  public class Brothel extends CriminalOrganization {
     private List<HumanTrafficker> members;

     // Constructor to initialize a Brothel object with a name and an empty list of members
     public Brothel(String name) {
        super(name);
	this.members = new ArrayList<>();
     }

     // Method to add a member (human trafficker) to the brothel
     public void addMember(HumanTrafficker member) {
        this.members.add(member);
     }


     // Overriding the method to get the list of members (human traffickers) in the brothel
     @Override

     public List<HumanTrafficker> getMembers() {
        return members;
     }

  }
