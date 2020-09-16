package de.sterzsolutions.timecontrol.model;

public class test {

    public static void main(String[] args) {

        String newCustomerQuery = "INSERT INTO Customers (customer_id, name, firstname, company, address, plz city) " +
                "VALUES('" + "customer.getCustomer_id()" + "', '" + "customer.getName()" + "', '" + "customer.getFirstname()" +
                "', '" + "customer.getCompany()" + "', '" + "customer.getAddress()" + "', " + "customer.getPlz()" + ", '" + "customer.getCity()" + "')";

        System.out.println(newCustomerQuery);

    }
}
