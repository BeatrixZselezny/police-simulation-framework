 
  package cybercriminals;

  public class InsiderThreat extends CyberCriminal {
     public InsiderThreat(String name, int age) {
        super(name, age);
     } 


     @Override

     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is using insider information to commit cyber crimes." + command);

     }
  } 
