  package cybercriminals;

  public class Abuser extends CyberCriminal {
     public Abuser(String name, int age) {
        super(name, age);
     }


    @Override

    public void commitCyberCrime(String command) {
       System.out.println(getName() + " is harming others due to severe mental issues." + command);

    }
  }
