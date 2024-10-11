package servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import logica.GestionBD;

import java.io.IOException;

@WebServlet("/Inicializador")
public class Inicializador extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Inicializador() {
        super();
    }

    @Override
    public void init() throws ServletException {
        ServletContext contexto = getServletContext();
        GestionBD gestionbd = new GestionBD();
        contexto.setAttribute("gestionbd", gestionbd);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("listas.jsp").forward(request, response);    
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
