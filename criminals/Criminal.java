  package criminals;

// This class is named representing
  // Abstract class representing a generic criminal
  public abstract class Criminal {
// This method is named name;
     protected String name;
// This method is named age;
     protected int age;

     // Constructor to initialize a Criminal object with name and age
     public Criminal(String name, int age) {
        this.name = name;
	this.age = age;
     }


     // Method to get the name of the criminal
     public String getName() {
        return name;
     }


     // Overriding the toString method to provide a string representation of the criminal
     @Override

// This method is named toString
     public String toString() {
        return "Name: " + name + ", Age: " + age;
     }

  }
