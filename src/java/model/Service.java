package model;

public class Service {
    private int id;
    private String name;
    private Double price;

    public Service(int id, String name, Double price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }
    
    public Service(String name, Double price) {
        this.name = name;
        this.price = price;
    }
    
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }
}
