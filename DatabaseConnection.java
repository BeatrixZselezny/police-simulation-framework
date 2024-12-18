import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/policeproject";
        String user = "debiana";
        String password = "Mt|9#F2?6LsJ$x<N.";

        try {
            // Töltsd be a PostgreSQL JDBC driver osztályt
            Class.forName("org.postgresql.Driver");

            // Csatlakozz az adatbázishoz
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the PostgreSQL server successfully.");
        } catch (ClassNotFoundException e) {
            System.out.println("PostgreSQL JDBC Driver not found. Include it in your library path.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        }
    }
}

