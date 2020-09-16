package de.sterzsolutions.timecontrol.model;

public class Customer {

    private int customer_id;
    private String name;
    private String firstname;
    private String company;
    private String address;
    private int plz;
    private String city;

    public Customer(int customer_id, String name, String firstname, String company, String address, int plz, String city) {
        this.customer_id = customer_id;
        this.name = name;
        this.firstname = firstname;
        this.company = company;
        this.address = address;
        this.plz = plz;
        this.city = city;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setFirstname(String firstname) {
        this.firstname = firstname;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getPlz() {
        return plz;
    }

    public void setPlz(int plz) {
        this.plz = plz;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }
}
