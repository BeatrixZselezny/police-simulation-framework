  package criminals;

  public abstract class Criminal {
     protected String name;
     protected int age;

     public Criminal(String name, int age) {
        this.name = name;
	this.age = age;
     }


     public String getName() {
        return name;
     }
        


     @Override

     public String toString() {
        return "Name: " + name + ", Age: " + age;
     }

  }
