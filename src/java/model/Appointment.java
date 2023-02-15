package model;

public class Appointment {

    private String date;
    private int time;
    private Customer customer;
    private Service service;
    public static String HTMLTABLEHEADER = "<tr><th>Data</th><th>Hora</th><th>Cliente</th><th>Serviço</th></tr>";

    public Appointment() {
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

    public void setCustomer(String name) {
        this.customer = new Customer(name);
    }

    public String getCustomer() {
        return this.customer.getName();
    }

    public void setService(String name) {
        this.service = new Service(name);
    }

    public String getService() {
        return this.service.getName();
    }

    public String toHTMLRow() {
        return "<tr><td>" + date + "</td><td>" + time + ":00h</td><td>" + customer.getName() + "</td><td>" + service.getName() + "</td></tr>";
    }
}
