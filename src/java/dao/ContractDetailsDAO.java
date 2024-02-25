package dao;

import dal.DBContext;
import model.ContractDetails;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractDetailsDAO extends DBContext {

    public ContractDetailsDAO() {
        super();
    }

    public void createContractDetails(ContractDetails contractDetails) {
        String query = "INSERT INTO ContractDetails (ContractID, CarID, Status) VALUES (?, ?, ?)";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, contractDetails.getContractID());
            preparedStatement.setInt(2, contractDetails.getCarID());
            preparedStatement.setString(3, contractDetails.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<ContractDetails> getAllContractDetails() {
        List<ContractDetails> contractDetailsList = new ArrayList<>();
        String query = "SELECT * FROM ContractDetails";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int contractDetailID = resultSet.getInt("ContractDetailID");
                int contractID = resultSet.getInt("ContractID");
                int carID = resultSet.getInt("CarID");
                String status = resultSet.getString("Status");

                ContractDetails contractDetails = new ContractDetails();
                contractDetails.setContractDetailID(contractDetailID);
                contractDetails.setContractID(contractID);
                contractDetails.setCarID(carID);
                contractDetails.setStatus(status);

                contractDetailsList.add(contractDetails);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return contractDetailsList;
    }

    public ContractDetails getContractDetailsByID(int contractDetailID) {
        ContractDetails contractDetails = null;
        String query = "SELECT * FROM ContractDetails WHERE ContractDetailID = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, contractDetailID);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    int contractID = resultSet.getInt("ContractID");
                    int carID = resultSet.getInt("CarID");
                    String status = resultSet.getString("Status");

                    contractDetails = new ContractDetails();
                    contractDetails.setContractDetailID(contractDetailID);
                    contractDetails.setContractID(contractID);
                    contractDetails.setCarID(carID);
                    contractDetails.setStatus(status);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return contractDetails;
    }

    public boolean updateContractDetails(ContractDetails contractDetails) {
        String query = "UPDATE ContractDetails SET ContractID = ?, CarID = ?, Status = ? WHERE ContractDetailID = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, contractDetails.getContractID());
            preparedStatement.setInt(2, contractDetails.getCarID());
            preparedStatement.setString(3, contractDetails.getStatus());
            preparedStatement.setInt(4, contractDetails.getContractDetailID());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public void deleteContractDetails(int contractDetailID) {
        String query = "DELETE FROM ContractDetails WHERE ContractDetailID = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, contractDetailID);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
