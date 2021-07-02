package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@WebFilter(urlPatterns = "/principal/*") /* intercepta todas as requisi��es que vierem do projeto ou mapeado */
public class FilterAutenticacao implements Filter {

	public FilterAutenticacao() {

	}

	/* Encerra os processos quando o servidor � parado */
	/* Mataria os processo de conex�o com o banco, caso servidor ficar offline */
	public void destroy() {

	}

	/* Intercepta as requisi��es e as respostas no sistema */
	/* Tudo que fizer no sitema vai passar por aqui */
	/* Valida��o de autentica��o */
	/* Dar commit e rolback de transa��es do banco */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		String usuarioLogado = (String) session.getAttribute("usuario");

		String urlParaAutenticar = req.getServletPath(); /* Url qu eest� sendo acessada */

		/* Validar se est� logado, senao redireciona para tela de login */
		if (usuarioLogado == null || (usuarioLogado != null && usuarioLogado.isEmpty())
				&& !urlParaAutenticar.contains("/principal/ServletLogin")) {
			RequestDispatcher redireciona = request.getRequestDispatcher("/index.jsp?url=" + urlParaAutenticar);
			request.setAttribute("msg", "Por favor Realize o Login!");
			redireciona.forward(request, response);
			return;

		} else {

			chain.doFilter(request, response);
		}
	}

	/* Inicia os processos ou recursos quando o servidor sobe o projeto */
	/* inicia a conex�o com o banco */
	public void init(FilterConfig fConfig) throws ServletException {

	}

}
