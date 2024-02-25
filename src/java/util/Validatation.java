/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import dao.UserDAO;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Admin
 */
public class Validatation {

    public String validateSignUpInput(String username, String password, String repass, String email) {
        String errorMsg = "";
        UserDAO user = new UserDAO();
        // Check if username,email existed in the database or violating rules and password violating rules or not match
        if (user.checkExistedUserWithUsername(username)) {
            errorMsg = "Username is already existed, please use another username.";
        } else if (!validateUsername(username)) {
            errorMsg = "Username must contains at least 6 non-special characters, please use another username.";
        } else if (!password.equals(repass)) {
            errorMsg = "Password re-enter is not match";
        } else if (!validatePassword(password)) {
            errorMsg = "Password must contains at least 6 characters";
        } else if (user.checkExistedEmail(email)) {
            errorMsg = "Email is already used, please use another email.";
        } else if (!validateEmail(email)) {
            errorMsg = "Email is not valid, please a valid email.";
        }
        return errorMsg;
    }

    public boolean validateUsername(String username) {
        // Define the regular expression pattern
        String pattern = "^[a-zA-Z0-9_]{6,}$";
        Pattern regex = Pattern.compile(pattern);
        Matcher matcher = regex.matcher(username);
        return matcher.find();
    }

    public boolean validateEmail(String email) {
        // Define the regular expression pattern
        String regex = "^[a-z0-9!#$%&'*+/=?^_`{|}~-]+@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public boolean validatePassword(String password) {
        // Check if the username has at least non-space 6 characters
        return password.trim().length() >= 6;
    }
}
