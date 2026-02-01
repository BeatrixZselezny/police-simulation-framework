package victims;


// Class representing a Victim with various attributes and methods// Class representing a Victim with various attributes and methods
public class Victim {
// This method is named name;
    private String name;
// This method is named age;
    private int age;
// This method is named gender;
    private String gender;
// This method is named hairColor;
    private String hairColor;
// This method is named resistanceLevel;
    private int resistanceLevel;
// This method is named trafficked;
    private boolean trafficked;
// This method is named isRescued;
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

// This method is named attributes
    // Getter methods to access private attributes
    public String getName() {
        return name;
    }

// This method is named getAge
    public int getAge() {
        return age;
    }

// This method is named getGender
    public String getGender() {
        return gender;
    }

// This method is named getHairColor
    public String getHairColor() {
        return hairColor;
    }

// This method is named getResistanceLevel
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

// This method is named setRescued
    public void setRescued(boolean rescued) {
        this.isRescued = rescued;
    }

    // Method to check if the victim has been rescued
    public boolean isRescued() {
        return isRescued;
    }
}

