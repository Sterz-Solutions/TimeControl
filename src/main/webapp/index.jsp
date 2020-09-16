<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ page import="de.sterzsolutions.timecontrol.database.SQLServerConnUtils_JTDS" %>
<%@ page import="de.sterzsolutions.timecontrol.database.ConnectionUtils" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="static de.sterzsolutions.timecontrol.database.ConnectionUtils.deleteCustomerFromTable" %>


<html lang="de">
<head>
    <title>TimeControl</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSS only -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="normalize.css">
    <link rel="stylesheet" type="text/css" href="main.css">
</head>

<body>
<%
    Connection connection = SQLServerConnUtils_JTDS.getSQLServerConnection_JTDS();
%>
<div>
<nav class="navbar navbar-expand-md">
    <a class="navbar-brand" href="#">Dashboard</a>
    <button class="navbar-toggler navbar-dark" type="button" data-toggle="collapse" data-target="#main-navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="main-navigation">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="customers.jsp">Kunden</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="projects.jsp">Projekte</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="timecontrol.jsp">TimeControl</a>
            </li>
        </ul>
    </div>
</nav>
</div>
<br>
<div class="row">
<div class="table-responsive" style="width: 45%" id="customerTable">
    <h2 class="sub-header">Kunden</h2>
    <form method="POST">
    <div class="table-responsive table-hover">
        <table class="table table-striped table-dark table-bordered">
            <thead class="thead-dark">
            <tr>
                <th style="width: 5%">No#</th>
                <th style="width: 15%">Vorname</th>
                <th style="width: 15%">Name</th>
                <th style="width: 20%">Büro/Firma</th>

            </tr>
            </thead>
            <tbody>
            <%

                String query = "select * from Customers";
                try (Statement stmt = connection.createStatement();ResultSet customersRs = stmt.executeQuery(query);){

                while (customersRs.next()) {
                    %>
            <tr>
                <td><%=customersRs.getInt("customer_id") %>
                </td>
                <td><%=customersRs.getString("firstname")%>
                </td>
                <td><%=customersRs.getString("name")%>
                </td>
                <td><%=customersRs.getString("company")%>
                </td>

            </tr>
            <%
                }
                }
            %>
            </tbody>
        </table>
    </div>
    </form>
</div>
    <div style="width: 10%"> </div>
    <div class="table-responsive" style="width: 45%" id="projectTable">
        <h2 class="sub-header">Projekte</h2>
        <form method="POST">
            <div class="table-responsive table-hover">
                <table class="table table-striped table-dark table-bordered">
                    <thead class="thead-dark">
                    <tr>
                        <th style="width: 5%">No#</th>
                        <th style="width: 15%">Arbeitstitel</th>
                        <th style="width: 15%">Arbeitszeit</th>
                        <th style="width: 20%">Büro/Firma</th>

                    </tr>
                    </thead>
                    <tbody>
                    <%

                        String projectQuery = "select * from projects";
                        try (Statement stmt = connection.createStatement();ResultSet projectRs = stmt.executeQuery(projectQuery);){

                            while (projectRs.next()) {
                    %>
                    <tr>
                        <td><%=projectRs.getInt("projekt_id") %>
                        </td>
                        <td><%=projectRs.getString("arbeitstitel")%>
                        </td>
                        <td>
                        </td>
                        <td><%=projectRs.getInt("customer")%>
                        </td>

                    </tr>
                    <%
                            }
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </form>
    </div>

</div>

<!-- JS, Popper.js, and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</body>
</html>
