import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static void main(String[] args) {
        String url = "DB_URL";
        String user = "DB_USER";
        String password = "DB_PASSWORD";

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

