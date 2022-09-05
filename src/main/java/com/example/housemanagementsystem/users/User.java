package com.example.housemanagementsystem.users;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
    private Integer userID;
    private Integer apartmentNo;
    private UserType userType;
    private String firstName;
    private String lastName;
    private String password;
    private String email;
    private Integer phoneNumber;
}
