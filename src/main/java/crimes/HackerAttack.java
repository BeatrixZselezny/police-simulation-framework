package crimes;

public class HackerAttack extends AbstractCrime {
    public HackerAttack() {
        super("Hacker Attack");
    }

    @Override
    public void commitCrime() {
        System.out.println("A hacker éppen brute-force támadást indít a szerver ellen...");
    }

    @Override
    public void getCaught() {
        System.out.println("Andy White nyomozó bemérte a jelet és lekapcsolta a hackert! 🐾💻🕵️‍♂️");
    }
}
