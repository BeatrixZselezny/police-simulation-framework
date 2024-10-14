
  package cybercriminals;


  public class ScriptKiddie extends CyberCriminal {
     public ScriptKiddie(String name, int age) {
        super(name, age);

     }


     @Override
   
     public void commitCyberCrime(String command) {
        System.out.println(getName() + " is using pre written scripts to hack." + command);

     }
  }
