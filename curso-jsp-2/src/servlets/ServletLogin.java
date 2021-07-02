package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ServletLogin") /*MAPEAMENTO DA URL QUE VEM DA TELA*/
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public ServletLogin() {
        
    }

	/*recebe os dados pela url em parametros*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	/*recebe os dados enviados por um formulário*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
			System.out.println(request.getParameter("nome"));
			System.out.println(request.getParameter("idade"));
	}

}
