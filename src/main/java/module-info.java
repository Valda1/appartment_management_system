module com.example.housemanagementsystem {
    requires javafx.controls;
    requires javafx.fxml;


    opens com.example.housemanagementsystem to javafx.fxml;
    exports com.example.housemanagementsystem;
}