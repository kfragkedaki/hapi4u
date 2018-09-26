import java.io.*;
import java.util.List;
import java.util.ArrayList;
import javax.servlet.*;
import javax.servlet.http.*;
import hapi4u_javafiles.DataValidation;
import hapi4u_javafiles.User;
import hapi4u_javafiles.UserDAO;
import hapi4u_javafiles.PharmacyDAO;

public class RegisterController extends HttpServlet {


  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    response.setContentType("text/html; charset=ISO-8859-7");
    PrintWriter out = new PrintWriter(response.getWriter(), true);

    String password = request.getParameter("password");;
    String email = request.getParameter("email");
	String valid_password = request.getParameter("valid_password");

	DataValidation dv = new DataValidation();
	UserDAO udao = new UserDAO();
	PharmacyDAO pdao = new PharmacyDAO();

	HttpSession session = request.getSession(true);

	try{
		List<User> users = new ArrayList<User>();
		users = udao.getUsers();
		for(int i=0; i<users.size(); i++) {
			if ( email.equals(users.get(i).getEmail()) ) {

				session.setAttribute("message", "This email has been already used!");
				response.sendRedirect("../hapi4u/register.jsp");
			}
		}

	} catch (Exception ex) {
      out.println("Exception: " + ex.getMessage());
    }



	if (dv.isValidPassword(password) && dv.isValidEmailAddress(email) && password.equals(valid_password)) {
		try {
			int user_id = udao.getUsers().size() + pdao.getPharmacies().size() + 1 + 1;
			User user = new User( user_id, email, password, "0", "0");
			udao.saveUser(user);

			session.setAttribute("user_object", user);
			response.sendRedirect("../hapi4u/index.jsp");

		} catch (Exception ex){
			out.println("Exception: " + ex.getMessage());
		}

		return;

    } else {

		int countErrors = 0;

		try {

			out.println("<!DOCTYPE html>");
			out.println("<html lang='en'>");
			out.println("");
			out.println("	<head>");
			out.println("");
			out.println("		<meta charset='utf-8'>");
			out.println("		<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>");
			out.println("		<meta name='description' content=''>");
			out.println("		<meta name='author' content=''>");
			out.println("");
			out.println("		<title>Hapi4u</title>");
			out.println("");
			out.println("		<!-- Bootstrap core CSS -->");
			out.println("		<link href='../hapi4u/vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'>");
			out.println("");
			out.println("		<!-- Custom fonts for this template -->");
			out.println("		<link href='../hapi4u/vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'>");
			out.println("		<link href='../hapi4u/vendor/simple-line-icons/css/simple-line-icons.css' rel='stylesheet' type='text/css'>");
			out.println("		<link href='https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic' rel='stylesheet' type='text/css'>");
			out.println("");
			out.println("		<!-- Custom styles for this template -->");
			out.println("		<link href='../hapi4u/css/landing-page.min.css' rel='stylesheet'>");
			out.println("		<link href='../hapi4u/css/register.css' rel='stylesheet'>");
			out.println("		<link href='../hapi4u/css/landing-page.css' rel='stylesheet'>");
			out.println("");
			out.println("	</head>");
			out.println("  <body>");
			out.println("  ");
			out.println("<!-- Navigation -->");
			out.println("	<nav class='navbar navbar-expand-lg navbar-dark fixed-top' id='mainNav' style='background-color:#14141f'>");
			out.println("		<div class='container'>");
			out.println("			<a class='navbar-brand js-scroll-trigger' href='../hapi4u/index.jsp#page-top' id='title'></i> Hapi4u</a>");
			out.println("			<button class='navbar-toggler navbar-toggler-right' type='button' data-toggle='collapse' data-target='#navbarResponsive' aria-controls='navbarResponsive' aria-expanded='false' aria-label='Toggle navigation'>");
			out.println("			  Menu");
			out.println("			  <i class='fa fa-bars'></i>");
			out.println("			</button>");
			out.println("			<div class='collapse navbar-collapse' id='navbarResponsive'>");
			out.println("			  <ul class='navbar-nav text-uppercase ml-auto'>");
			out.println("			  <li class='nav-item'>");
			out.println("				  <a class='nav-link js-scroll-trigger' href='../hapi4u/index.jsp#services'> Services</a>");
			out.println("				</li>");
			out.println("				<li class='nav-item'>");
			out.println("				  <a class='nav-link js-scroll-trigger' href='../hapi4u/index.jsp#about'>How it works</a>");
			out.println("				</li>");
			out.println("				<li class='nav-item'>");
			out.println("				  <a class='nav-link js-scroll-trigger' href='../hapi4u/index.jsp#developers'>Our team</a>");
			out.println("				</li>");
			out.println("				<li class='nav-item'>");
			out.println("				  <a class='nav-link js-scroll-trigger' href='../hapi4u/index.jsp#contact'>Communication</a>");
			out.println("				</li>");
			out.println("				<li class='nav-item'>");
			out.println("				  <a class='nav-link js-scroll-trigger' href='../hapi4u/login.jsp'><b>Log in</b></button></a>");
			out.println("				</li>");
			out.println("				<li class='nav-item'>");
			out.println("				  <a class='nav-link js-scroll-trigger' data-target='../hapi4u/register.jsp'><b>Register</b></button></a>");
			out.println("				</li>");
			out.println("			  </ul>");
			out.println("			</div>");
			out.println("		</div>");
			out.println("	</nav>");
			out.println("<div class='container theme-showcase' role='main'>");
			out.println("<h4 class='text-center'>Your inputs are not correct. Please try again!</h4>");
			out.println("<div class='alert alert-danger'>");
			out.println("<div class='form-group row'>");
			out.println("<div class='col-sm-offset-1'>");

				  if (!(dv.isValidEmailAddress(email)))
					out.println(++countErrors + ". The Email is not a valid email adress <br>");

				  if (!(dv.isValidPassword(password)))
					out.println(++countErrors + ". Password need to be at least 4 characters long <br>");

				  if (!(password.equals(valid_password)))
					out.println(++countErrors + ". Passwords do not match <br>");

			out.println("</div>");
			out.println("</div>");
			out.println("</div>");

			out.println("<div class='col-sm-10 col-sm-offset-5'>");
			out.println("<a href='../hapi4u/register.jsp' class='tn btn-primary btn-lg active' role='button' aria-pressed='true' text-align='center'>");
			out.println("<span class='glyphicon glyphicon-chevron-left'></span>Back to the form</a> <br><br><br>");
			out.println("</div>");

			out.println("</div>");
  	  		out.println("	<!-- Footer -->");
	  		out.println("    <footer class='footer bg-dark'>");
	  		out.println("      <div class='container'>");
	  		out.println("        <div class='row'>");
	  		out.println("          <div class='col-lg-7 h-100 text-center text-lg-right my-auto'>");
	  		out.println("            <ul class='list-inline mb-0'>");
	  		out.println("              <li class='list-inline-item mr-3'>");
	  		out.println("                <a href='#'>");
	  		out.println("                  <i class='fa fa-facebook fa-2x fa-fw'></i>");
	  		out.println("                </a>");
	  		out.println("              </li>");
	  		out.println("              <li class='list-inline-item mr-3'>");
	  		out.println("                <a href='#'>");
	  		out.println("                  <i class='fa fa-twitter fa-2x fa-fw'></i>");
	  		out.println("                </a>");
	  		out.println("              </li>");
	  		out.println("              <li class='list-inline-item'>");
	  		out.println("                <a href='#'>");
	  		out.println("                  <i class='fa fa-instagram fa-2x fa-fw'></i>");
	  		out.println("                </a>");
	  		out.println("              </li>");
	  		out.println("            </ul>");
	  		out.println("			<br>");
	  		out.println("			<div id='copyright'>");
	  		out.println("				<p class='text-muted small mb-4 mb-lg-0'>&copy; Hapi4u 2018. All Rights Reserved.</p>");
	  		out.println("			</div>");
	  		out.println("          </div>	  ");
	  		out.println("        </div>");
	  		out.println("      </div>");
	  		out.println("    </footer>");
	  		out.println("");
	  		out.println("    <!-- Bootstrap core JavaScript -->");
	  		out.println("    <script src='../vendor/jquery/jquery.min.js'></script>");
	  		out.println("    <script src='../vendor/bootstrap/js/bootstrap.bundle.min.js'></script>");
	  		out.println("");
	  		out.println("  </body>");
	  		out.println("");
	  		out.println("</html>");

		} catch (Exception ex) {
			out.println("Exception: " + ex.getMessage());
			out.println("</body>");
			out.println("</html>");
		}
	}
  }
}// End of class
