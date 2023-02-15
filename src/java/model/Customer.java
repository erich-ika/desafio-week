package model;

public class Customer {

    private int id;
    private String name;
    private String tel;
    private String password;
    private boolean confirmed;
    public static String HTMLTABLEHEADER = "<tr><th>ID</th><th>Nome</th><th>Telefone</th><th>Hash</th></tr>";
    
    public Customer() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String phone) {
        this.tel = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isConfirmed() {
        return confirmed;
    }

    public void setPassword2(String password2) {
        confirmed = password.equals(password2);
    }

    public String toString() {
        return id + name + password + confirmed;
    }
    
    public String toHTMLRow() {
        return "<tr><td>" + id + "</td><td>" + name + "</td><td>" + tel + "</td><td>" + password + "</td></tr>";
    }
}
