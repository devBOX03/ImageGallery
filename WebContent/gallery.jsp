<%@ page import = "java.util.List" %>
<%@ page import = "service.bean" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>
<body>	
<div class="container">
	  <br>
	  <!-- Nav pills -->
	  <ul class="nav nav-pills" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link" data-toggle="pill" href="#form">Image Upload</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link active" data-toggle="pill" href="#gallery">Gallery</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="form" class="container tab-pane fade"><br>
	     <center>
	      <h3>Upload Platform</h3>
	         <form action="UploadImage" method="post" enctype="multipart/form-data">
	          <table>
			  <div class="form-group">
			    <tr>
			    <td><label for="text">Name:</label></td>
			    <td><input type="text" name="imageName" required></td>
			    </tr>
			  </div>
			  <div class="form-group">
			    <tr>
			    <td><label for="file">Choose Image:</label></td>
			    <td><input type="file" name="image" required/></td>
			    </tr>
			  </div>
			  </table>
			  <button type="Upload" class="btn btn-success">Submit</button>
			</form> 
			</center>
	      </div>
	    <div id="gallery" class="container tab-pane active"><br>
      	 <div class="container-fluid bg-3 text-center">    
		  <h3>My Gallery</h3><br>
		  <div class="row"> 
		    <%
			List<bean> imageIdList = (List<bean>)request.getAttribute("imageList");
			for(bean image : imageIdList){
			%>
			<div class="col-sm-3">
		    <img src="getImage.jsp?id=<%= image.getId()%>" class="img-responsive" style="width:200px" alt="Image">
			<p> <%= image.getImageName() %></p>
			</div>
			<%
			}
		    %>  
		  </div>
		</div>
	   </div>
	</div>
</div>
  <footer id="main-footer" class="bg-dark" style="position: absolute; bottom: 0;width: 100%;color: white; ">
    <div class="container">
      <div class="row">
        <div class="col text-center">
          <div class="py-4">
            <h1 class="h3">devBOX</h1>
            <p>Copyright &copy;2017</p>
            </div>
        </div>
      </div>
    </div>
  </footer>
	
</body>
</html>