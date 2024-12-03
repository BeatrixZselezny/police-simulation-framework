  package criminals;

  // Abstract class representing a generic criminal
  public abstract class Criminal {
     protected String name;
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

     public String toString() {
        return "Name: " + name + ", Age: " + age;
     }

  }
