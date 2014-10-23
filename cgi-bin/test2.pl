#!/strawberry/perl/bin/perl
	use CGI ':standard';
	print header;
	print start_html("Example CGI.pm Form");
	print "<h1> Example CGI.pm Form</h1>\n";
        print_prompt();
	
	  
	
	do_work();
	test();

	print_tail();
	print end_html;
	

sub test{


my $BASE_URL = 'test2.pl';

print "<a href='".toggle_on()."'>ON</a>";

print "<a href=" . &toggle_on . ">ON2</a>";
print "<a href=\"?action=toggle_on()\">ON</a>\n";

}	
	
sub toggle_on{


print "sdfhgsdfh";

}	
	
	
	
	sub print_prompt {
	   print start_form;
	   print "<em>What's your name?</em><br>";
	   print textfield('name');
	   print checkbox('Not my real name');
	   print "<p><em>Where can you find English Sparrows?</em><br>";
	   print checkbox_group(
				 -name=>'Sparrow locations',
				 -values=>[England,France,Spain,Asia,Hoboken],
				 -linebreak=>'yes',
				 -defaults=>[England,Asia]);
	   print "<p><em>How far can they fly?</em><br>",
		radio_group(
			-name=>'how far',
			-values=>['10 ft','1 mile','10 miles','real far'],
			-default=>'1 mile');
	   print "<p><em>What's your favorite color?</em>  ";
	   print popup_menu(-name=>'Color',
				    -values=>['black','brown','red','yellow'],
				    -default=>'red');
	   print hidden('Reference','Monty Python and the Holy Grail');
	   print "<p><em>What have you got there?</em><br>";
	   print scrolling_list(
			 -name=>'possessions',
			 -values=>['A Coconut','A Grail','An Icon',
				   'A Sword','A Ticket'],
			 -size=>5,
			 -multiple=>'true');
	   print "<p><em>Any parting comments?</em><br>";
	   print textarea(-name=>'Comments',
				  -rows=>10,
				  -columns=>50);
	   print "<p>",reset;
	   print submit('Action','Shout');
	   print submit('Action','Scream');
	   print end_form;
	   print "<hr>\n";
	}
	sub do_work {
	   print "<h2>Here are the current settings in this form</h2>";
	   for my $key (param) {
	      print "<strong>$key</strong> -> ";
	      my @values = param($key);
	      print join(", ",@values),"<br>\n";
	  }
	  

	  
	  
	}
	sub print_tail {
	
		

	}
