  package cybercriminals;

  import criminals.Criminal;

  public abstract class CyberCriminal extends Criminal {
     public CyberCriminal(String name, int age) {
        super(name, age);
     }


     public abstract void commitCyberCrime(String command);


  }
