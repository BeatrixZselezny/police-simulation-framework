  package criminals;

  import java.util.ArrayList;
  import java.util.List;

  public class Mafia extends CriminalOrganization {
     private List<Criminal> members;

     public Mafia(String name) {
        super(name);
	this.members = new ArrayList<>();
     }

     public void addMember(MafiaCriminal member) {
        this.members.add(member);
     }

     @Override

     public List<? extends Criminal> getMembers() {
        return members;
     }
  }
