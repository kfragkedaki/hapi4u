import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import hapi4u_javafiles.User;


public class RegisterController extends HttpServlet {


  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {

    response.setContentType("text/html; charset=ISO-8859-7");
    PrintWriter out = new PrintWriter(response.getWriter(), true);

	HttpSession session = request.getSession(true);
    User user= (User)session.getAttribute("user-object");

	if( session.getAttribute("user-object") == null ) {
	  	request.setAttribute("message", "You are not authorized to access this resource. Please login.");
	  	request.getRequestDispatcher("/login.jsp").forward(request,response);
    }

    String username = request.getParameter("username");
    String password = request.getParameter("password");;
    String email = request.getParameter("email");
	String valid_password = request.getParameter("valid_password");

    try {
		out.println("<html lang='en'>");
		out.println("");
		out.println("	<head>");
		out.println("");
		out.println("		<meta charset='utf-8'>");
		out.println("		<meta name='viewport' content='width=device-width, initial-scale=1, shrink-to-fit=no'>");
		out.println("		<meta name='description' content=''>");
		out.println("		<meta name='author' content=''>");
		out.println("");
		out.println("		<title>Hapi4uu</title>");
		out.println("");
		out.println("		<!-- Bootstrap core CSS -->");
		out.println("		<link href='vendor/bootstrap/css/bootstrap.min.css' rel='stylesheet'>");
		out.println("");
		out.println("		<!-- Custom fonts for this template -->");
		out.println("		<link href='vendor/font-awesome/css/font-awesome.min.css' rel='stylesheet' type='text/css'>");
		out.println("		<link href='vendor/simple-line-icons/css/simple-line-icons.css' rel='stylesheet' type='text/css'>");
		out.println("		<link href='https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic' rel='stylesheet' type='text/css'>");
		out.println("");
		out.println("		<!-- Custom styles for this template -->");
		out.println("		<link href='css/landing-page.min.css' rel='stylesheet'>");
		out.println("		<link href='css/register.css' rel='stylesheet'>");
		out.println("");
		out.println("	</head>");
		out.println("");
		out.println("	<body>");
		out.println("");
		out.println("	<!-- Navigation -->");
		out.println("	<nav class='navbar navbar-expand-lg navbar-dark fixed-top' id='mainNav' style='background-color:#14141f'>");
		out.println("		<div class='container'>");
		out.println("			<a class='navbar-brand js-scroll-trigger' href='index.html#page-top' id='title'></i> Hapi4u</a>");
		out.println("			<button class='navbar-toggler navbar-toggler-right' type='button' data-toggle='collapse' data-target='#navbarResponsive' aria-controls='navbarResponsive' aria-expanded='false' aria-label='Toggle navigation'>");
		out.println("			  Menu");
		out.println("			  <i class='fa fa-bars'></i>");
		out.println("			</button>");
		out.println("			<div class='collapse navbar-collapse' id='navbarResponsive'>");
		out.println("			  <ul class='navbar-nav text-uppercase ml-auto'>");
		out.println("			  <li class='nav-item'>");
		out.println("				  <a class='nav-link js-scroll-trigger' href='index.html#services'> ?p??es?e?</a>");
		out.println("				</li>");
		out.println("				<li class='nav-item'>");
		out.println("				  <a class='nav-link js-scroll-trigger' href='index.html#about'>??? ?e?t????e?</a>");
		out.println("				</li>");
		out.println("				<li class='nav-item'>");
		out.println("				  <a class='nav-link js-scroll-trigger' href='index.html#developers'>? ?µada µa?</a>");
		out.println("				</li>");
		out.println("				<li class='nav-item'>");
		out.println("				  <a class='nav-link js-scroll-trigger' href='index.html#contact'>?p????????a</a>");
		out.println("				</li>");
		out.println("				<li class='nav-item'>");
		out.println("				  <a class='nav-link js-scroll-trigger' data-target='#login'><b>??s?d??</b></button></a>");
		out.println("				</li>");
		out.println("				<li class='nav-item'>");
		out.println("				  <a class='nav-link js-scroll-trigger' data-target='#register'><b>????af?</b></button></a>");
		out.println("				</li>");
		out.println("			  </ul>");
		out.println("			</div>");
		out.println("		</div>");
		out.println("	</nav>");
		out.println("	");
		out.println("	<div class='container theme-showcase' role='main'>");
		out.println("	");
		out.println("			<h2 class='form-signin-heading text-center'>????af?</h2>");
		out.println("			<h4 class='form-signin-heading text-center'><small>??µ??????se ???a??asµ? st? hapi4u s?µp???????ta? ap??? t?? pa?a??t? f??µa!</small></h4>");
		out.println("			");
		out.println("			<div class='container'>");
		out.println("");
		out.println("				<hr>");
		out.println("          ");
		out.println("				<form name='form-register' method='post' action='registerController.jsp' class='form-horizontal'>");
		out.println("					<div class='form-group row'>");
		out.println("						<label for='email' class='col-sm-2 offset-sm-2 control-label' style='text-align:right'><b>???µa ???st?:</b></label>");
		out.println("						<div class='col-sm-5'>");
		out.println("							<input type='text' name='email' placeholder='Username' class='form-control' id='email'>");
		out.println("						</div>");
		out.println("					</div>");
		out.println("					<div class='form-group row'>");
		out.println("						<label for='email' class='col-sm-2 offset-sm-2 control-label' style='text-align:right'><b>Email:</b></label>");
		out.println("						<div class='col-sm-5'>");
		out.println("							<input type='text' name='email' placeholder='Email' class='form-control' id='email'>");
		out.println("						</div>");
		out.println("					</div>");
		out.println("					<div class='form-group row'>");
		out.println("						<label for='password' class='col-sm-2 offset-sm-2 control-label' style='text-align:right'><b>??d????:</b></label>");
		out.println("						<div class='col-sm-5'>");
		out.println("							<input type='password' name='password' placeholder='Password' class='form-control' id='password'>");
		out.println("						</div>");
		out.println("						");
		out.println("					</div> ");
		out.println("					<div class='form-group row'>");
		out.println("						<label for='password' class='col-sm-3 offset-sm-1 control-label' style='text-align:right'><b>?p?ßeßa??s? ??d????:</b></label>");
		out.println("						<div class='col-sm-5'>");
		out.println("							<input type='password' name='password' placeholder='Password' class='form-control' id='password'>");
		out.println("						</div>");
		out.println("						");
		out.println("					</div> ");
		out.println("");
		out.println("					<br>");
		out.println("					<br>");
		out.println("					<div class='text-center'>");
		out.println("						<button type='submit' class='btn btn-lg btn-primary ' href='hom-e.html' ><b>??µ??????a ???a??asµ??</b></button>");
		out.println("					</div> ");
		out.println("				</form>  ");
		out.println("		");
		out.println("			</div>");
		out.println("");
		out.println("	</div>");
		out.println("	<!-- /container -->");
		out.println("	");
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
		out.println("    <script src='vendor/jquery/jquery.min.js'></script>");
		out.println("    <script src='vendor/bootstrap/js/bootstrap.bundle.min.js'></script>");
		out.println("");
		out.println("  </body>");
		out.println("");
		out.println("</html>");



      /*
       * Converts the name from ISO-8859-1 to ISO-8859-7 (Greek) in case
       * the user typed his/her name in Greek
       */
      username = new String(username.getBytes("ISO-8859-1"), "ISO-8859-7");


	 /* User user = new User( email, password);
	  UserDAO udao = new UserDAO();
	  udao.saveStudent(student); */

    } catch (Exception ex) {
      out.println("Exception: " + ex.getMessage());
      out.println("</body>");
      out.println("</html>");
    }
  }
}// End of class
