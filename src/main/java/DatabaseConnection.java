import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    public static void main(String[] args) {
        // ÍGY olvassuk ki a környezeti változókat:
        String url = System.getenv("DB_URL");
        String user = System.getenv("DB_USER");
        String password = System.getenv("DB_PASS");

        // Ellenőrzés
        if (url == null || user == null) {
            System.err.println("Hiba: DB_URL vagy DB_USER nincs beállítva!");
            return; // Kilépünk, ha nincs adat
        }

        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            System.out.println("Connected to the PostgreSQL server successfully.");
            
            // Ha végeztünk, zárjuk be a kapcsolatot
            conn.close();
            
        } catch (ClassNotFoundException e) {
            System.out.println("Driver hiányzik!");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Csatlakozási hiba!");
            e.printStackTrace();
        }
    }
}
