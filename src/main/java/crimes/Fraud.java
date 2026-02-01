package crimes;

public class Fraud extends AbstractCrime {
    public Fraud() {
        super("Fraud");
    }

    @Override
    public void commitCrime() {
        System.out.println("A csaló éppen hamis profilokat készít a közösségi médiában...");
    }

    @Override
    public void getCaught() {
        System.out.println("A csalót fülön csíptük a pénzmosás közben! 🐾⚖️");
    }
}
