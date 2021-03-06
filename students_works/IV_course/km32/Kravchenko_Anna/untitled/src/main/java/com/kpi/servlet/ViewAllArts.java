package com.kpi.servlet;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ann on 24.12.2016.
 */
@WebServlet("/viewAllArts")
public class ViewAllArts extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        /*String[] imageCodeArray = new String[10];*/
        List<String> imageCodeArray = new ArrayList<>();

        try {
            Connection connection = ConnectDataBase.connect("java:/comp/env", "jdbc/HRDB").getConnection(); /*создание связи*/
            PreparedStatement statement = connection.prepareStatement("SELECT img FROM viewallarts", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
            {
           /* statement.setInt(1, i);*/
            ResultSet resultSet = statement.executeQuery();
           while (resultSet.next()){
            Blob b = resultSet.getBlob("img");
            String nameVariable = "data:image/jpg;base64," + Base64.encode(b.getBytes(1,(int)b.length()));
           imageCodeArray.add(nameVariable);
           }
            resultSet.close();}
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("imageCodeArray", imageCodeArray);
        req.getRequestDispatcher("viewAllArts.jsp").forward(req, resp);
    }
}
