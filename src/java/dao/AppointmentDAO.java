package dao;

import connection.ConnectionFactory;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Appointment;

public class AppointmentDAO {

    Connection con;

    public AppointmentDAO() {
        con = ConnectionFactory.getConnection();
    }

    public ArrayList<Appointment> getAppointments() {
        ArrayList<Appointment> array = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select a.date, a.time, c.name, s.name from appointment a\n"
                + "inner join customer c on a.customer = c.id\n"
                + "inner join service s on a.service = s.id";

        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Appointment appointment = new Appointment();
                appointment.setDate(rs.getString("date"));
                appointment.setTime(rs.getInt("time"));
                appointment.setService(rs.getString("c.name"));
                appointment.setCustomer(rs.getString("s.name"));
                array.add(appointment);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

        return array;
    }
}
