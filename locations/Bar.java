package locations;

import victims.Victim;
import java.util.ArrayList;
import java.util.List;

public class Bar {
    private String name;
    private List<Victim> victims;

    public Bar(String name, List<Victim> victims) {
        this.name = name;
        this.victims = victims;
    }

    public Bar() {
        this.name = "Default Bar Name";
        this.victims = new ArrayList<>();
    }

    public String getName() {
        return name;
    }

    public Victim findVictim(String gender, int age, String hairColor) {
        for (Victim victim : victims) {
            if (victim.getGender().equals(gender) && victim.getAge() == age && victim.getHairColor().equals(hairColor)) {
                return victim;
            }
        }
        return null;
    }
}
  
