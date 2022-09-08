package com.example.housemanagementsystem.users;

import com.example.housemanagementsystem.SceneController;
import com.example.housemanagementsystem.database.DataRepository;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;

public class UserController {

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
            UserType userType =  this.userRepository.checkUserType(userID);
            DataRepository.getInstance().setLoggedInUserID(userID);

            if(userType == UserType.MANAGER){
                SceneController.changeScene(actionEvent, "manager_profile");
            }else if(userType == UserType.OWNER){
                SceneController.changeScene(actionEvent, "owner_profile");
            }

            SceneController.showAlert("Login successful", "You have logged in successfully!", Alert.AlertType.CONFIRMATION);

        } catch (Exception e) {
            SceneController.showAlert("Login failed", e.getMessage(), Alert.AlertType.ERROR);
        }
    }

    public void navigateToScene(ActionEvent actionEvent) {
        Button source = (Button) actionEvent.getSource();
        SceneController.changeScene(actionEvent, source.getId());
    }

    public void onRegisterNewOwnerClick(ActionEvent actionEvent) {
        try {
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

            this.validateOwnerRegistrationInfo(user);
            this.userRepository.registerOwner(user);

            SceneController.showAlert("Registration successful!",
                    "Apartment owner " + firstNameField.getText() + " " + lastNameField.getText() + " has been registered successfully!",
                    Alert.AlertType.CONFIRMATION);

            SceneController.changeScene(actionEvent, "manager_profile");

        } catch (Exception e) {
            SceneController.showAlert("Registration failed!", e.getMessage(), Alert.AlertType.ERROR);
        }
    }

    private void validateOwnerRegistrationInfo(User user) throws Exception {

        if (!user.getPassword().equals(confirmPasswordField.getText())) throw new Exception("Password does not match!");
        if (user.getPassword().length() < 6) throw new Exception("Password must be longer than 6 characters!");
        if (user.getFirstName().isEmpty()) throw new Exception("Please provide owner's first name!");
        if (user.getLastName().isEmpty()) throw new Exception("Please provide owner's last name");
        if (user.getPassword().isEmpty()) throw new Exception("Please choose owner's password");
        if (user.getEmail().isEmpty()) throw new Exception("Please provide owner's e-mail address");
        if(user.getApartmentNo().isEmpty()) throw new Exception("Please choose the number of the apartment");
        if(Integer.parseInt( user.getApartmentNo()) < 1 || Integer.parseInt( user.getApartmentNo()) > 15) throw new Exception("Please choose valid apartment number (from 1 to 15)");
        if(user.getPhoneNumber().isEmpty()) throw new Exception("Please provide owner's phone number");
        if(!user.getApartmentNo().matches("[0-9]*")) throw new Exception("Please provide valid apartment number");
        if(!user.getPhoneNumber().matches("[0-9]*")) throw new Exception("Please provide valid phone number");
        if(!user.getFirstName().matches("[a-zA-Z]*")) throw new Exception("Please provide valid first name");
        if(!user.getLastName().matches("[a-zA-Z]*")) throw new Exception("Please provide valid last name");
        if(!user.getEmail().matches("^[a-zA-Z0-9_!#$%&'*+/=?`{|}~^.-]+@[a-zA-Z0-9.-]+$")) throw new Exception("Please provide valid e-mail address");

        //if(user.getApartmentNo().contains("\\s*")) throw new Exception("Please provide valid apartment number");
        //if(user.getPhoneNumber().contains("\\s*")) throw new Exception("Please provide valid apartment number");



        //MAYBE USE TO LOWER CASE
        //maybe possible to use ... .orElseThrow();


    }
}
