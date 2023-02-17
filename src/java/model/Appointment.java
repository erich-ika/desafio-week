package model;

public class Appointment {

    private String date;
    private int time;
    public Customer customer;
    public Service service;
    public static String HTMLTABLEHEADER = "<tr><th>Data</th><th>Hora</th><th>Cliente</th><th>Serviço</th></tr>";

    public Appointment() {
        customer = new Customer();
        service = new Service();
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public void setService(int id) { // for JSP compatibility
        this.service = new Service();
        this.service.setId(id);
    }

    public String toHTMLRow() {
        return "<tr><td>" + date + "</td><td>" + time + ":00h</td><td>" + customer.getName() + "</td><td>" + service.getName() + "</td></tr>";
    }
}
