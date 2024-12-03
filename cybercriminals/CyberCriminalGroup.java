
  package cybercriminals;
  import java.util.ArrayList;
  import java.util.List;
  import criminals.Criminal;


  // Class representing a group of CyberCriminals, extending CyberCriminal
  public class CyberCriminalGroup extends CyberCriminal {
     private List<CyberCriminal> members;

     // Constructor to initialize a CyberCriminalGroup object with name, age, and an empty list of members
     public CyberCriminalGroup(String name, int age) {
        super(name, age);
	this.members = new ArrayList<>();

     }

     // Method to add a member (CyberCriminal) to the group
     public void addMember(CyberCriminal member) {
        members.add(member);
     }


     // Overriding the commitCyberCrime method to print a message about the cyber crime being committed
     @Override

     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is leading a cyber crime group." + command);
	for (CyberCriminal member : members) {
	   member.commitCyberCrime(command);

	}
     }
  }
