package locations;
import victims.Victim;
import java.util.ArrayList;
import java.util.List;


// Class representing a Bar location with a list of victims
public class Bar {
    private String name;
    private List<Victim> victims;

    // Constructor to initialize a Bar object with a name and list of victims
    public Bar(String name, List<Victim> victims) {
        this.name = name;
        this.victims = victims;
    }

    // Default constructor to initialize a Bar object with a default name and an empty list of victims public Bar() {
    public Bar() {
        this.name = "Default Bar Name";
        this.victims = new ArrayList<>();
    }

    // Method to get the name of the bar
    public String getName() {
        return name;
    }

    // Method to find a victim based on gender, age, and hair color
    public Victim findVictim(String gender, int age, String hairColor) {
        for (Victim victim : victims) {
            if (victim.getGender().equals(gender) && victim.getAge() == age && victim.getHairColor().equals(hairColor)) {
                return victim;
            }
        }
        return null;
    }
}

