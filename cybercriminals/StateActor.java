
  package cybercriminals;


  public class StateActor extends CyberCriminal {
     public StateActor(String name, int age) {
        super(name, age);

     }


     @Override

     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is hacking on behalf of a goverment" + command);
    }
  }
