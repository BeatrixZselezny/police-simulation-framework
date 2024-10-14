  package criminals;

  import java.util.ArrayList;
  import java.util.List;

  public class Brothel extends CriminalOrganization {
     private List<HumanTrafficker> members;

     public Brothel(String name) {
        super(name);
	this.members = new ArrayList<>();
     }

     public void addMember(HumanTrafficker member) {
        this.members.add(member);
     }


     @Override

     public List<HumanTrafficker> getMembers() {
        return members;
     }
     
  }
