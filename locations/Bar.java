
  package locations;

  import victims.Victim;
  import java.util.ArrayList;
  import java.util.List;




  public class Bar {
     private List<Victim> victims;
        
     public Bar(List<Victim> victims) {
        this.victims = victims;
     }

     public Bar() {
        this.victims = new ArrayList<>();
     }

     public Victim findVictim(String gender, int age, String hairColor) {
        for (Victim victim : victims) {
	   if (victim.getGender() .equals(gender) && victim.getAge() == age && victim.getHairColor() .equals(hairColor)) {
	   return victim;
	   }
	} 
       return null;	
     }
 
  }
  
