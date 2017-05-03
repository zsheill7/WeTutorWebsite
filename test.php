<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">
  </head>
  <body>

  	<div class="container">
   	 <h1>Get in Touch!</h1>

   	 <div id="error>"></div>
   	 <form method="post">
  <div class="form-group">
    <label for="email">Email address</label>
    <input type="email" class="form-control" id="email" placeholder="Enter your email address">
    <small class="text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="subject">Subject</label>
    <input type="text" class="form-control" id="subject" name="subject">
  </div>
  
  <div class="form-group">
    <label for="content">What would you like to ask us?</label>
    <textarea class="form-control" id="content"  name="subject" rows="3"></textarea>
  </div>
 
  <button type="submit" id="submit" class="btn btn-primary">Submit</button>
</form>

    </div>
    <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>

    <script type="text/javascript">
    	$("form").submit(function (e) {
    		e.preventDefault();

    		var error = "";
    		if ($("#subject").val() == "") {
    			error += "<p>The subject field is required.</p>";
    		}
    		if ($("#content").val() == "") {
    			error += "<p>The content field is required.</p>";
    		}

    		if (error != "") {
    			$("#error").html('<div class="alert alert-danger" role="alert"><strong>There were errors in your form:</strong>' + error + '</div>');
    		}
    	})
    </script>
  </body>
</html>