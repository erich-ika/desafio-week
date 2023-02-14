package model;

import java.sql.Date;

public class Appointment {
    private String date;
    private int time;
    private int customer;
    private int service;

    public Appointment(String date, int time, int customer, int service) {
        this.date = date;
        this.time = time;
        this.customer = customer;
        this.service = service;
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

    public int getCustomer() {
        return customer;
    }

    public void setCustomer(int customer) {
        this.customer = customer;
    }

    public int getService() {
        return service;
    }

    public void setService(int service) {
        this.service = service;
    }
}
