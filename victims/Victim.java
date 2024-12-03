package victims;


// Class representing a Victim with various attributes and methods// Class representing a Victim with various attributes and methods
public class Victim {
    private String name;
    private int age;
    private String gender;
    private String hairColor;
    private int resistanceLevel;
    private boolean trafficked;
    private boolean isRescued;

    // Constructor to initialize a Victim object with details
    public Victim(String name, int age, String gender, String hairColor, int resistanceLevel) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.hairColor = hairColor;
        this.resistanceLevel = resistanceLevel;
        this.trafficked = false;
    }

    // Getter methods to access private attributes
    public String getName() {
        return name;
    }

    public int getAge() {
        return age;
    }

    public String getGender() {
        return gender;
    }

    public String getHairColor() {
        return hairColor;
    }

    public int getResistanceLevel() {
        return resistanceLevel;
    }

    // Method to check if the victim has been trafficked
    public boolean isTrafficked() {
        return trafficked;
    }

    // Setter methods to update the trafficked and rescued status
    public void setTrafficked(boolean trafficked) {
        this.trafficked = trafficked;
    }

    public void setRescued(boolean rescued) {
        this.isRescued = rescued;
    }

    // Method to check if the victim has been rescued
    public boolean isRescued() {
        return isRescued;
    }
}

