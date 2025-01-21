package crimes;

public class Fraud extends AbstractCrime {
    public Fraud() {
        super("Fraud");
    }

    @Override
    public void commitCrime() {
        System.out.println(getType() + " crime committed!");
    }
}
