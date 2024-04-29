package com.example.claps;

import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.animation.*;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.chart.BarChart;
import javafx.scene.chart.CategoryAxis;
import javafx.scene.chart.NumberAxis;
import javafx.scene.chart.XYChart;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.scene.paint.Color;
import javafx.scene.shape.Arc;
import javafx.stage.Stage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Objects;
import java.util.concurrent.TimeUnit;

public class mainSceneController {
    public Button buttonLogout;
    public Arc arcVerbruikDag;
    public Button buttonMenu;
    public ImageView logoText;
    public Label lblVandaag;
    public Button btnToggleUsage;
    public BarChart BCweek;
    public Label lblHalfUsage;
    public Label lblUsage;
    public Label lblWeek;
    public Label lbl0;
    private Scene scene;
    private Stage stage;
    public double arcLength;
    public static int limitInt;
    public static double arcMaxLength;
    public boolean dataInit = false;
    public double halfUsage = (usage / 2);
    public double halfLimit;
    public double usageSeventyFive;
    public double usageNinety;
    public float arcDeg;
    public float degrees;
    public float startAngle;
    public static int usage = 0;
    menuSceneController tfLimietDag;
    //public int limitInt = menuSceneController.limit;
    loginSceneController klantID = new loginSceneController();

    public void connectButton() {
        DBUtils connectNow = new DBUtils();
        Connection connectDB = connectNow.getConnection();

        String connectQuery = "SELECT * FROM watermeter WHERE klant_ID = " + loginSceneController.klantID + "";

        try {
            Statement statement = connectDB.createStatement();
            ResultSet queryResult = statement.executeQuery(connectQuery);
            while (queryResult.next()) {
                usage = queryResult.getInt("waterverbruik");
                limitInt = queryResult.getInt("limiet");
                lblVandaag.setVisible(true);
                lblHalfUsage.setVisible(true);
                lblUsage.setVisible(true);
                lblWeek.setVisible(true);
                lbl0.setVisible(true);

                //haal limit op uit database!!!!!
                //arcDeg = 360 / menuSceneController.limit;
                startAngle = 90;
                arcVerbruikDag.setVisible(true);
                arcVerbruikDag.setStartAngle(startAngle);
                arcLength = ((double)usage / limitInt * 360);
                arcVerbruikDag.setLength(arcLength);

                //maak text rood als te veel gebruik
                if(usage >= limitInt) {
                    lblVandaag.setTextFill(Color.RED);
                    arcVerbruikDag.setStroke(Color.RED);
                }

                String limitSt = String.valueOf(limitInt);
                String usageString = ("Vandaag:\n" + usage + "/" + limitSt);
                String usageSt = String.valueOf(usage);
                int halfUsageInt = (int)halfUsage;
                String halfLimitSt = String.valueOf(halfUsageInt);
                lblVandaag.setText(usageString);
                lblUsage.setText(usageSt);
                System.out.println(usage + limitSt);
                System.out.println(usageNinety);
                System.out.println(usageSeventyFive);
                System.out.println(halfUsage);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        //X as maken: dagen van de week
        CategoryAxis xAxis = new CategoryAxis();
        xAxis.setLabel("dagen");

        //Y as maken: het aantal liter waterverbruik
        NumberAxis yAxis = new NumberAxis();
        yAxis.setLabel("verbruik");

        //maak de bar chart
        BarChart<String, Number> barChart = new BarChart<>(xAxis, yAxis);
        barChart.setTitle("Verbruik");

        //XYchart
        XYChart.Series<Object, Object> waterverbruik = new XYChart.Series<>();
        waterverbruik.getData().add(new XYChart.Data<>("Ma", 20));
        waterverbruik.getData().add(new XYChart.Data<>("Di", 60));
        waterverbruik.getData().add(new XYChart.Data<>("Wo", 80));
        waterverbruik.getData().add(new XYChart.Data<>("Do", 40));
        waterverbruik.getData().add(new XYChart.Data<>("Vr", 70));
        waterverbruik.getData().add(new XYChart.Data<>("Za", 160));
        XYChart.Data<Object, Object> data = new XYChart.Data<>("Zo", usage);
        waterverbruik.getData().add(data);

        if (!dataInit) {
            //vul de barchart met data voor de week
            BCweek.getData().add(waterverbruik);
            halfLimit = (limitInt / 2);
            usageSeventyFive = (limitInt * 0.75);
            usageNinety = (limitInt * 0.9);


            if (arcLength >= limitInt) { //check of  100% voorbij is
                dataInit = true;
                Alert alert = new Alert(Alert.AlertType.INFORMATION, "LET OP! Uw ingestelde limiet is gepasseerd. Uw waterdruk is verlaagd.");
                alert.show();
                System.out.println("ID: " + loginSceneController.klantID);

            } else if (arcLength >=usageNinety ) { //check of 90% voorbij is
                dataInit = true;
                Alert alert = new Alert(Alert.AlertType.INFORMATION, "LET OP! U hebt al meer dan 90% van uw limiet verbruikt vandaag. Let AUB op uw verbruik!");
                alert.show();
                System.out.println("ID: " + loginSceneController.klantID);

            } else if (arcLength >= usageSeventyFive ) {//check of 75% voorbij is
                dataInit = true;
                Alert alert = new Alert(Alert.AlertType.INFORMATION, "U hebt al meer dan 75% van uw limiet verbruikt vandaag. Let AUB op uw verbruik!");
                alert.show();
                System.out.println("ID: " + loginSceneController.klantID);

            } else if (arcLength >= halfUsage) {//check of 50% voorbij is
                dataInit = true;
                Alert alert = new Alert(Alert.AlertType.INFORMATION, "U bent halverwege uw limiet vandaag. Let AUB op uw verbruik!");
                alert.show();
                System.out.println("ID: " + loginSceneController.klantID);
            }
        }
        else {

            BCweek.getData().clear();
            try {
                TimeUnit.MILLISECONDS.sleep(650);
            } catch (InterruptedException ie) {
                Thread.currentThread().interrupt();
            }
            BCweek.getData().add(waterverbruik);
            System.out.println("ID: " + loginSceneController.klantID);

        }
    }

    public void logoutButton(ActionEvent event) throws IOException {
        Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("loginScene.fxml")));
        stage = (Stage) ((Node)event.getSource()).getScene().getWindow();
        scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    public void menuButton(ActionEvent event) throws IOException {
        //menuButton popup maken hier plez
        Parent root = FXMLLoader.load(Objects.requireNonNull(getClass().getResource("menuScene.fxml")));
        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        Scene scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

}
