/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author lvhn1
 */
public class Car {
    
    private int carID;
    private String carType;
    private int capacity;
    private double rentalPricePerDay;
    private String img;

    public Car() {
    }

    public Car(int carID, String carType, int capacity, double rentalPricePerDay) {
        this.carID = carID;
        this.carType = carType;
        this.capacity = capacity;
        this.rentalPricePerDay = rentalPricePerDay;
    }

    public Car(int carID, String carType, int capacity, double rentalPricePerDay, String img) {
        this.carID = carID;
        this.carType = carType;
        this.capacity = capacity;
        this.rentalPricePerDay = rentalPricePerDay;
        this.img = img;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
    

    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public String getCarType() {
        return carType;
    }

    public void setCarType(String carType) {
        this.carType = carType;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public double getRentalPricePerDay() {
        return rentalPricePerDay;
    }

    public void setRentalPricePerDay(double rentalPricePerDay) {
        this.rentalPricePerDay = rentalPricePerDay;
    }
    
    
    
}
