package com.example.claps;

import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Stage;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Objects;
import java.util.function.UnaryOperator;

public class menuSceneController {
    public TextField tfLimietDag;
    public Button buttonMenu;
    public Button buttonLogout;
    public ProgressBar barUsage;
    loginSceneController klantID = new loginSceneController();
    mainSceneController usage = new mainSceneController();
    public static int limit;
    public Slider sliderLimiet;
    public Button btnSave;

    public void menuButton(ActionEvent event) throws IOException {
        Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("mainScene.fxml")));
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        Scene scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    public void setLimit(ActionEvent event) throws IOException{
        limit = Integer.parseInt(tfLimietDag.getText());
        UnaryOperator<TextFormatter.Change> filter = change -> {
            String text = change.getText();

            if (text.matches("\\d?")) { // this is the important line
                return change;
            }else {
                Alert alert = new Alert(Alert.AlertType.INFORMATION, "Limiet niet geldig");
            }
            return null;
        };
        tfLimietDag.setTextFormatter(new TextFormatter<String>(filter));

        DBUtils connectNow = new DBUtils();
        Connection connectDB = connectNow.getConnection();

        String setLimitSQL = "UPDATE watermeter SET limiet = " + limit + " WHERE klant_ID = " + loginSceneController.klantID + "";

        try{
            Statement statement = connectDB.createStatement();
            statement.executeUpdate(setLimitSQL);
            statement.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        menuButton(event);
    }

    public void viewUsage(ActionEvent event) throws IOException{
        barUsage.setVisible(false);
        System.out.println("peepeepoopoo");
    }

    public void logoutButton(ActionEvent event) throws IOException {
        Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("loginScene.fxml")));
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        Scene scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }
}
