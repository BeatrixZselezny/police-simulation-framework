  package criminals;

  import java.util.List;

  public abstract class CriminalOrganization {
     protected String name;

     public CriminalOrganization(String name) {
        this.name = name;
     }

     public String getName() {
        return name;
     }


     public abstract List<? extends Criminal> getMembers();

     @Override
     
     public String toString() {
        return "Organization: " + name;
     }

  }
