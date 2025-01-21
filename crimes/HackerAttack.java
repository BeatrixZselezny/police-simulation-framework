package crimes;

public class HackerAttack extends AbstractCrime {
    public HackerAttack() {
        super("Hacker Attack");
    }

    @Override
    public void commitCrime() {
        System.out.println(getType() + " crime committed!");
    }
}
