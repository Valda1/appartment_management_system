package com.example.housemanagementsystem.users;

import com.example.housemanagementsystem.SceneController;
import com.example.housemanagementsystem.database.DataRepository;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

public class UserController{

@FXML
private TextField firstNameField;
@FXML
private TextField lastNameField;
@FXML
private PasswordField passwordField;
@FXML
private TextField apartmentField;
@FXML
private TextField confirmPasswordField;
@FXML
private TextField emailField;
@FXML
private TextField phoneField;

UserRepository userRepository = new UserRepository();

@FXML
protected void onUserLoginClick(ActionEvent actionEvent) {
    try {
        String firstName = firstNameField.getText();
        String lastName = lastNameField.getText();
        String password = passwordField.getText();

        int userID = this.userRepository.verifyLoginData(firstName, lastName, password);
        DataRepository.getInstance().setLoggedInUserID(userID);
        SceneController.showAlert("Login successful", "You have logged in successfully!", Alert.AlertType.CONFIRMATION);

        SceneController.changeScene(actionEvent, "profile");

    }catch (Exception e){
        SceneController.showAlert("Login failed", e.getMessage(), Alert.AlertType.ERROR);
    }
}

    public void navigateToScene(ActionEvent actionEvent) {
        Button source = (Button) actionEvent.getSource();
        SceneController.changeScene(actionEvent, source.getId());
    }

    /*public void onRegisterNewOwnerClick(ActionEvent actionEvent) {
        try{
            User user = new User(
                    null,
                    apartmentField.getText(),
                    UserType.OWNER,
                    firstNameField.getText(),
                    lastNameField.getText(),
                    passwordField.getText(),
                    emailField.getText(),
                    phoneField.getText()
            );

            this.userRepository.registerOwner(user);

            SceneController.showAlert("Registration successful!",
                    "Apartment owner " + firstNameField.getText() + " " + lastNameField.getText() + " has been registered successfully!",
                    Alert.AlertType.CONFIRMATION);

            SceneController.changeScene(actionEvent, "profile");

        }catch (Exception e){
            SceneController.showAlert("Registration failed!", e.getMessage(), Alert.AlertType.ERROR);
        }
    }*/

}
