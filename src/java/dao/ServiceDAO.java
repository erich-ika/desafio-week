package dao;

import connection.ConnectionFactory;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Service;

public class ServiceDAO {

    Connection con;

    public ServiceDAO() {
        con = ConnectionFactory.getConnection();
    }

    public ArrayList<Service> getServices() {
        ArrayList<Service> array = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select * from service";

        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Service service = new Service();
                service.setId(rs.getInt("id"));
                service.setName(rs.getString("name"));
                service.setPrice(rs.getDouble("price"));
                array.add(service);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

        return array;
    }
}
