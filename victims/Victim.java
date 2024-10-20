package victims;

public class Victim {
    private String name;
    private int age;
    private String gender;
    private String hairColor;
    private int resistanceLevel;
    private boolean trafficked;
    private boolean isRescued;

    public Victim(String name, int age, String gender, String hairColor, int resistanceLevel) {
        this.name = name;
        this.age = age;
        this.gender = gender;
        this.hairColor = hairColor;
        this.resistanceLevel = resistanceLevel;
        this.trafficked = false;
    }

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

    public boolean isTrafficked() {
        return trafficked;
    }

    public void setTrafficked(boolean trafficked) {
        this.trafficked = trafficked;
    }

    public void setRescued(boolean rescued) {
        this.isRescued = rescued;
    }

    public boolean isRescued() {
        return isRescued;
    }
}

