<?php

	$emailTo = "controlflow7@gmail.com";
	$subject = "Hi friend";
	$body = "What's crackalackin?";

	$headers = "From: zsheill7@gmail.com";
	if (mail($emailTo, $subject, $body, $headers)) {
		echo "The email was sent";
	} else {
		echo "The email could not be sent";
	}



?>