package dao;

import at.favre.lib.crypto.bcrypt.BCrypt;
import at.favre.lib.crypto.bcrypt.BCrypt.Result;
import model.Customer;
import connection.ConnectionFactory;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.AuthenticationException;

public class CustomerDAO {

    Connection con;

    public CustomerDAO() {
        con = ConnectionFactory.getConnection();
    }

    public String toString(Customer customer) {
        return customer.getName() + customer.getTel();
    }

    public void cadastrar(Customer customer) {
        if (!customer.isConfirmed()) {
            throw new IllegalArgumentException("Senhas não coincidem");
        }

        String hash = BCrypt.withDefaults().hashToString(12, customer.getPassword().toCharArray());

        PreparedStatement stmt = null;
        String sql = "INSERT INTO yara.customer (name, phone, hash) VALUES (?, ?, ?);";
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, customer.getName());
            stmt.setString(2, customer.getTel());
            stmt.setString(3, hash);
            stmt.execute();
            stmt.close();
        } catch (SQLException u) {
            throw new RuntimeException(u);
        }
    }

    public Customer login(String tel, String password) throws AuthenticationException {
        Customer customer = new Customer();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select * from customer where phone = ?";

        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, tel);
            rs = stmt.executeQuery();

            if (!rs.next()) {
                throw new AuthenticationException("Incorrect username or password");
            }

            Result r = BCrypt.verifyer().verify(password.toCharArray(), rs.getString("hash"));
            if (!r.verified) {
                throw new AuthenticationException("Incorrect username or password");
            }

            customer.setId(rs.getInt("id"));
            customer.setName(rs.getString("name"));
            customer.setTel(rs.getString("phone"));
            
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

        return customer;
    }

    public ArrayList<Customer> getCustomers() {
        ArrayList<Customer> array = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select * from customer";

        try {
            stmt = con.prepareStatement(sql);
            rs = stmt.executeQuery();

            while (rs.next()) {
                Customer customer = new Customer();
                customer.setId(rs.getInt("id"));
                customer.setName(rs.getString("name"));
                customer.setTel(rs.getString("phone"));
                customer.setPassword(rs.getString("hash"));
                array.add(customer);
            }
        } catch (SQLException ex) {
            throw new RuntimeException(ex);
        }

        return array;
    }

    /*
    public Aluno getAluno(String cpf) {
        Aluno aluno = new Aluno();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "select * from Aluno where Cpf = ?";
        
        try {
            stmt = con.prepareStatement(sql);
            stmt.setString(1, cpf);
            rs = stmt.executeQuery();
            if (rs.next()) {
                aluno.setCpf(cpf);
                aluno.setCurso(rs.getString("Curso"));
                aluno.setDataIncio(rs.getDate("DataInicio"));
                aluno.setDataTermino(rs.getDate("DataTermino"));
                aluno.setEmail(rs.getString("Email"));
                aluno.setIdAluno(rs.getInt("IdAluno"));
                aluno.setIdSupervisor(rs.getInt("IdSupervisor"));
                aluno.setNome(rs.getString("Nome"));
                aluno.setPeriodo(rs.getString("Periodo"));
                aluno.setRamal(rs.getString("Ramal"));
                aluno.setTelefone(rs.getString("Telefone"));
                aluno.setToken(rs.getString("Token"));
            }
            stmt.close();
        } catch (SQLException u) {
            throw new RuntimeException(u);
        }
        return aluno;
    }*/
}
