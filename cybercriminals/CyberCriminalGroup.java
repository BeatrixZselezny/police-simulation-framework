
  package cybercriminals;


  import java.util.ArrayList;
  import java.util.List;
  import criminals.Criminal;


  public class CyberCriminalGroup extends CyberCriminal {
     private List<CyberCriminal> members;

     public CyberCriminalGroup(String name, int age) {
        super(name, age);
	this.members = new ArrayList<>();

     }

     public void addMember(CyberCriminal member) {
        members.add(member);
     }


     @Override

     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is leading a cyber crime group." + command);
	for (CyberCriminal member : members) {
	   member.commitCyberCrime(command);

	}
     }
  }
