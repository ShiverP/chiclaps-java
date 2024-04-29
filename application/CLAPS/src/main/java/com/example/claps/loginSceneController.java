package com.example.claps;

import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.PasswordField;
import javafx.scene.control.TextField;
import javafx.scene.image.ImageView;
import javafx.stage.Stage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Objects;

public class loginSceneController {
    public ImageView logoText;
    public TextField tfEmail;
    public PasswordField tfWachtwoord;
    public Button btnLogin;
    public Button btnAanmelden;
    public Button btnGegVergeten;
    private Stage stage;
    private Scene scene;
    private Parent root;
    public String klantEmail;
    public String klantPassword;
    public static int klantID;

    public void loginButtonOnAction(ActionEvent event){
        if(!tfEmail.getText().isBlank() && !tfWachtwoord.getText().isBlank()){
            klantEmail = tfEmail.getText();
            klantPassword = tfWachtwoord.getText();

            System.out.println(klantEmail + " " + klantPassword);
            validateLogin(event);

        }else{
            System.out.println("Please enter email and password");
        }
    }

    public void validateLogin(ActionEvent event){
        DBUtils connectNow = new DBUtils();
        Connection connectDB = connectNow.getConnection();

        String getCustomerInfo = "SELECT * FROM klant WHERE email = '" + klantEmail + "' AND wachtwoord ='" + klantPassword + "'";
        String verifyLogin = "SELECT count(1) FROM klant WHERE email = '" + klantEmail + "' AND wachtwoord ='" + klantPassword + "'";


        try {
            Statement statement1 = connectDB.createStatement();
            Statement statement = connectDB.createStatement();
            ResultSet idResult = statement1.executeQuery(getCustomerInfo);
            ResultSet queryResult = statement.executeQuery(verifyLogin);

            while (queryResult.next() & idResult.next()) {
                if (queryResult.getInt(1) == 1){
                    klantID = idResult.getInt("id");
                    System.out.println(klantID);
                    System.out.println("Login succesvol!");
                    root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("mainScene.fxml")));
                    stage = (Stage)((Node)event.getSource()).getScene().getWindow();
                    scene = new Scene(root);
                    stage.setScene(scene);
                    stage.show();
                } else {
                    System.out.println("Login mislukt!");
                    tfEmail.clear();
                    tfWachtwoord.clear();
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

}
