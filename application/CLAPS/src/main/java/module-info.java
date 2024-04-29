module com.example.claps {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires mysql.connector.j;
    requires jdk.jconsole;

    opens com.example.claps to javafx.fxml;
    exports com.example.claps;
}