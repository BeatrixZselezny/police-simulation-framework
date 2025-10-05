package com.police-simulation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;
import io.github.cdimascio.dotenv.Dotenv;

public class DatabaseInitializer {
    public static void main(String[] args) {
<<<<<<< HEAD:src/main/java/com/yourcompany/DatabaseInitializer.java
        String url = "jdbc:postgresql://localhost:5432/policeproject";
        String user = "debiana";
        String password = "Ezviccvolt";
=======
        Dotenv dotenv = Dotenv.load();

        String url = dotenv.get("DB_URL");
        String user = dotenv.get("DB_USER");
        String password = dotenv.get("DB_PASSWORD");
>>>>>>> 82d638a (I was doing PSQL Security audit):src/main/java/com/police-simulation/DatabaseInitializer.java

        try {
            Class.forName("org.postgresql.Driver");
            Connection conn = DriverManager.getConnection(url, user, password);
            Statement stmt = conn.createStatement();

            String createPoliceOfficersSql = new String(Files.readAllBytes(Paths.get("database/sql/create_policeofficers.sql")));
            String insertPoliceOfficersSql = new String(Files.readAllBytes(Paths.get("database/sql/insert_policeofficers.sql")));
            String createDetectivesSql = new String(Files.readAllBytes(Paths.get("database/sql/create_detectives.sql")));
            String insertDetectivesSql = new String(Files.readAllBytes(Paths.get("database/sql/insert_detectives.sql")));
            String createBotnetSql = new String(Files.readAllBytes(Paths.get("database/sql/create_botnet.sql")));
            String insertBotnetSql = new String(Files.readAllBytes(Paths.get("database/sql/insert_botnet.sql")));
            String createCrimesSql = new String(Files.readAllBytes(Paths.get("database/sql/create_crimes.sql")));
            String insertCrimesSql = new String(Files.readAllBytes(Paths.get("database/sql/insert_crimes.sql")));
            String createCriminalsSql = new String(Files.readAllBytes(Paths.get("database/sql/create_criminals.sql")));
            String insertCriminalsSql = new String(Files.readAllBytes(Paths.get("database/sql/insert_criminals.sql")));
            String createPoliceRelationsSql = new String(Files.readAllBytes(Paths.get("database/sql/create_police_relations.sql")));
            String insertPoliceRelationsSql = new String(Files.readAllBytes(Paths.get("database/sql/insert_police_relations.sql")));

            stmt.executeUpdate(createPoliceOfficersSql);
            stmt.executeUpdate(insertPoliceOfficersSql);
            stmt.executeUpdate(createDetectivesSql);
            stmt.executeUpdate(insertDetectivesSql);
            stmt.executeUpdate(createBotnetSql);
            stmt.executeUpdate(insertBotnetSql);
            stmt.executeUpdate(createCrimesSql);
            stmt.executeUpdate(insertCrimesSql);
            stmt.executeUpdate(createCriminalsSql);
            stmt.executeUpdate(insertCriminalsSql);
            stmt.executeUpdate(createPoliceRelationsSql);
            stmt.executeUpdate(insertPoliceRelationsSql);

            System.out.println("Tables created and data inserted successfully.");

            stmt.close();
            conn.close();
        } catch (ClassNotFoundException e) {
            System.out.println("PostgreSQL JDBC Driver not found.");
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

