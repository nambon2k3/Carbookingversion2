package dao;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Car;

public class CarDAO extends DBContext {

    public CarDAO() {
        super();
    }

    public void createCar(Car car) {
        String query = "INSERT INTO Cars (CarType, Capacity, RentalPricePerDay) "
                + "VALUES (?, ?, ?)";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, car.getCarType());
            preparedStatement.setInt(2, car.getCapacity());
            preparedStatement.setDouble(3, car.getRentalPricePerDay());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void editCar(Car car) {
        String query = "UPDATE Cars SET CarType = ?, Capacity = ?, RentalPricePerDay = ? WHERE CarID = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, car.getCarType());
            preparedStatement.setInt(2, car.getCapacity());
            preparedStatement.setDouble(3, car.getRentalPricePerDay());
            preparedStatement.setInt(4, car.getCarID());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void deleteCar(int carID) {
        String query = "DELETE FROM Cars WHERE CarID = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, carID);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Car> getAllCars() {
        List<Car> cars = new ArrayList<>();
        String query = "SELECT * FROM Cars";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int carID = resultSet.getInt("CarID");
                String carType = resultSet.getString("CarType");
                int capacity = resultSet.getInt("Capacity");
                double rentalPricePerDay = resultSet.getDouble("RentalPricePerDay");

                Car car = new Car();
                car.setCarID(carID);
                car.setCarType(carType);
                car.setCapacity(capacity);
                car.setRentalPricePerDay(rentalPricePerDay);

                cars.add(car);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return cars;
    }

    public Car getCarByID(int carID) {
        Car car = null;
        String query = "SELECT * FROM Cars WHERE CarID = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, carID);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String carType = resultSet.getString("CarType");
                    int capacity = resultSet.getInt("Capacity");
                    double rentalPricePerDay = resultSet.getDouble("RentalPricePerDay");

                    car = new Car();
                    car.setCarID(carID);
                    car.setCarType(carType);
                    car.setCapacity(capacity);
                    car.setRentalPricePerDay(rentalPricePerDay);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return car;
    }

    // You can implement additional methods as needed
}
