module com.example.housemanagementsystem {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;
    requires commons.configuration;
    requires lombok;

    opens com.example.housemanagementsystem to javafx.fxml;
    exports com.example.housemanagementsystem;
    exports com.example.housemanagementsystem.users;
    opens com.example.housemanagementsystem.users to javafx.fxml;


}