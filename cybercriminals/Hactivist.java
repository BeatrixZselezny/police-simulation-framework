  package cybercriminals;
  import criminals.Criminal;


  public class Hactivist extends CyberCriminal {
     public Hactivist(String name, int age) {
        super(name, age);

     }

     @Override

     public void commitCyberCrime(String command) {
        System.out.println(getName() + " Is hacking for a political cause." + command);
     }
  }
