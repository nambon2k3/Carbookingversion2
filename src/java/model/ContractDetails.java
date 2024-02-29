/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dao.CarDAO;

/**
 *
 * @author lvhn1
 */
public class ContractDetails {
    
    private int contractDetailID;
    private int contractID;
    private int carID;
    private String status;

    public ContractDetails() {
    }

    public ContractDetails(int contractDetailID, int contractID, int carID, String status) {
        this.contractDetailID = contractDetailID;
        this.contractID = contractID;
        this.carID = carID;
        this.status = status;
    }

    public int getContractDetailID() {
        return contractDetailID;
    }

    public void setContractDetailID(int contractDetailID) {
        this.contractDetailID = contractDetailID;
    }

    public int getContractID() {
        return contractID;
    }

    public void setContractID(int contractID) {
        this.contractID = contractID;
    }

    public int getCarID() {
        return carID;
    }

    public void setCarID(int carID) {
        this.carID = carID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public Car getCar() {
        return new CarDAO().getCarByID(carID);
    }
    
}
