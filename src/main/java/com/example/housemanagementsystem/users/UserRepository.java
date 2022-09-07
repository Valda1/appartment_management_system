package com.example.housemanagementsystem.users;

import com.example.housemanagementsystem.database.DBConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Locale;

public class UserRepository {

    private Connection connection = DBConnectionManager.getConnection();

    public int verifyLoginData(String firstName, String lastName, String password) throws SQLException {
        connection = DBConnectionManager.getConnection();

        String query = "SELECT * FROM users WHERE firstName = ? && lastName = ? && password = ? LIMIT 1;";

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, firstName);
        preparedStatement.setString(2, lastName);
        preparedStatement.setString(3, password);

        ResultSet resultSet = preparedStatement.executeQuery();

        Integer userID = null;
        if (resultSet.next()) userID = resultSet.getInt("userID");

        //DBConnectionManager.closeConnection(resultSet, preparedStatement, connection);

        return userID;

        //throw new UserNotFoundException("User " + fullName + " not found!");

    }


    public UserType checkUserType(Integer userID) throws SQLException{
        connection = DBConnectionManager.getConnection();

        String query = "SELECT userType FROM users WHERE userID = ?;";

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, userID);

        ResultSet resultSet = preparedStatement.executeQuery();

        UserType userType = null;
        if (resultSet.next()) userType = UserType.valueOf(resultSet.getString("userType").toUpperCase());

        return userType;


    }

    public void registerOwner(User user) throws Exception{
        connection = DBConnectionManager.getConnection();

        String query = "INSERT INTO users (apartmentID, userType, firstName, lastName, password, email, phoneNumber)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?);";

        PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, user.getApartmentNo());
        preparedStatement.setString(2, user.getUserType().toString());
        preparedStatement.setString(3, user.getFirstName());
        preparedStatement.setString(4, user.getLastName());
        preparedStatement.setString(5, user.getPassword());
        preparedStatement.setString(6, user.getEmail());
        preparedStatement.setString(7, user.getPhoneNumber());

        int result = preparedStatement.executeUpdate();

        if (result != 1) throw new Exception("Registration failed for user with username " + user.getFirstName() + " " + user.getLastName());

    }


}
