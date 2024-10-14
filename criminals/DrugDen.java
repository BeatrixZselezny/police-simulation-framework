  package criminals;

  import java.util.ArrayList;
  import java.util.List;

  public class DrugDen extends CriminalOrganization {
     private List<DrugDealer> members;

     public DrugDen(String name) {
        super(name);
	this.members = new ArrayList<>();
     }

     public void addMember(DrugDealer member) {
        this.members.add(member);
     }

     @Override

     public List<DrugDealer> getMembers() {
        return members;
     }

  }
