package com.police-simulation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;

public class JdbcTest {
    public static void main(String[] args) {
        String url = "jdbc:postgresql://localhost:5432/policeproject";
        String user = "DB_USER";
        String password = "DB_PASSWORD";

        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();

            // SQL files reading and writeing
            String createTablesSql = new String(Files.readAllBytes(Paths.get("database/sql/create_tables.sql")));
            String insertDataSql = new String(Files.readAllBytes(Paths.get("database/sql/insert_data.sql")));

            stmt.executeUpdate(createTablesSql);
            stmt.executeUpdate(insertDataSql);

            System.out.println("Tables created and data inserted successfully.");

            stmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("PostgreSQL JDBC Driver not found. Include it in your library path.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("Connection failure.");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("SQL file reading error.");
            e.printStackTrace();
        }
    }
}

