
  package cybercriminals;


  public class Scammer extends CyberCriminal {
     public Scammer(String name, int age) {
        super(name, age);

     } 


     @Override

     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is committing online scams." + command);
     }

  }
