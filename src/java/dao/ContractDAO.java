package dao;

import dal.DBContext;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Contract;

public class ContractDAO extends DBContext {

    public ContractDAO() {
        super();
    }

    public void createContract(Contract contract) {
        String query = "INSERT INTO Contracts (username, StartDateTime, EndDateTime, TotalCost, Status) "
                + "VALUES (?, ?, ?, ?, ?)";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, contract.getUsername());
            preparedStatement.setTimestamp(2, new Timestamp(contract.getStartDateTime().getTime()));
            preparedStatement.setTimestamp(3, new Timestamp(contract.getEndDateTime().getTime()));
            preparedStatement.setDouble(4, contract.getTotalCost());
            preparedStatement.setString(5, contract.getStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public List<Contract> getAllContracts() {
        List<Contract> contracts = new ArrayList<>();
        String query = "SELECT * FROM Contracts";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                int contractID = resultSet.getInt("ContractID");
                String username = resultSet.getString("username");
                Timestamp startDateTime = resultSet.getTimestamp("StartDateTime");
                Timestamp endDateTime = resultSet.getTimestamp("EndDateTime");
                double totalCost = resultSet.getDouble("TotalCost");
                String status = resultSet.getString("Status");

                Contract contract = new Contract();
                contract.setContractID(contractID);
                contract.setUsername(username);
                contract.setStartDateTime(new java.util.Date(startDateTime.getTime()));
                contract.setEndDateTime(new java.util.Date(endDateTime.getTime()));
                contract.setTotalCost(totalCost);
                contract.setStatus(status);

                contracts.add(contract);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return contracts;
    }

    public Contract getContractByID(int contractID) {
        Contract contract = null;
        String query = "SELECT * FROM Contracts WHERE ContractID = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, contractID);
            try ( ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    String username = resultSet.getString("username");
                    Timestamp startDateTime = resultSet.getTimestamp("StartDateTime");
                    Timestamp endDateTime = resultSet.getTimestamp("EndDateTime");
                    double totalCost = resultSet.getDouble("TotalCost");
                    String status = resultSet.getString("Status");

                    contract = new Contract();
                    contract.setContractID(contractID);
                    contract.setUsername(username);
                    contract.setStartDateTime(new java.util.Date(startDateTime.getTime()));
                    contract.setEndDateTime(new java.util.Date(endDateTime.getTime()));
                    contract.setTotalCost(totalCost);
                    contract.setStatus(status);
                }
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return contract;
    }

    public boolean updateContract(Contract contract) {
        String query = "UPDATE Contracts SET username = ?, StartDateTime = ?, EndDateTime = ?, TotalCost = ?, Status = ? WHERE ContractID = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, contract.getUsername());
            preparedStatement.setTimestamp(2, new Timestamp(contract.getStartDateTime().getTime()));
            preparedStatement.setTimestamp(3, new Timestamp(contract.getEndDateTime().getTime()));
            preparedStatement.setDouble(4, contract.getTotalCost());
            preparedStatement.setString(5, contract.getStatus());
            preparedStatement.setInt(6, contract.getContractID());
            preparedStatement.executeUpdate();
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return false;
        }
    }

    public void deleteContract(int contractID) {
        String query = "DELETE FROM Contracts WHERE ContractID = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, contractID);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
