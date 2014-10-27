#!/strawberry/perl/bin/perl

use strict;
use warnings;
use CGI;
use CGI::Carp qw(fatalsToBrowser);

use lib '../';
use ebayAPI;
use Data::Dumper;
    use DBD::mysql;

# ./run.pl
# ./eBayAPI.pm
my $production_live = 1;
my $api;
if ( $production_live == 1 ) {
    $api = eBayAPI->new(

        apiUrl => 'https://api.ebay.com/ws/api.dll',
        devID  => 'e68fceb1-b097-4926-8b1c-0c329db0fbf3',
        appID  => 'UWS796178-b2ca-4daf-bf42-dd1dbdb4842',
        certID => '7858eb24-b5b0-4030-9ccd-e6f3e91269ff',
        authToken =>
'AgAAAA**AQAAAA**aAAAAA**vnj7Uw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wNmYqpAJaLogWdj6x9nY+seQ**B2wCAA**AAMAAA**E9FZwUywJKCaHos1XgqtnKQsT+P2V2VJ4ARcYaIJ5Dw+Uyu7fCp3IMWgSbaf9/QMPgDBn6uNFH0ZUCWmSMgMhb2Kc1TFBiLvhEq0ULrMG4yctEFKGN2P2SwSfYNUhDCGH3ifQD/sZ6+pHca42g453x1PtpUokrsqVnqThgTM5OrO+NF+GR1z2s88PfbICr6cd9ep5otOJdLx+wg/jYp5WMVvkEI+F3EQihimMWL/9hRpTCEDyogXSbIb6gQUvpDRtVJwXN072oMVkBuVjgK5epWxN+vQ/J0ZSxbAhH7GFBsu5aLMghAmcV8W3Kip/xl65PTBhblEnI+O+X8mou3oNIvEwkADFZa1xWJBoDBMN1/+4rFWIQh+xjXhb1ncikS3Qt0RTvD+S4gMj0Jx7/P8sxtrI2jiEPwbHgZU6qEaSt3d6xVxeVWJsvqOQsOWpfyVIf/o3mIZnDD9UpO9Exx6gqIaWr9WdtGAqZAS8wsoXX3KMWqlFsZsJ14s97AtfA0zQsXopHydLcF/4dioHgwo8eA2CDlPe+5o6QtY1ZGEgTtpa0Mz4qBrGUigMqK0rnGShqkv4BwXacqRbZbvwlxX9CbuVErQots3FRMTPCE667uLUK2qn5y7XuBqil55zLO/ULqZ/TuWQqFyoHlmp7JZpeg9mZv8Z5Xs+ufFbk71QmolTSf0m1lKp4l2hhquiB071ZfS8rdKdMB0hw1p5HC+D8cwzpDIaiwOeOBwb4fhHoSujaticV0pcitxbBd8S8+z',
        siteID  => 15,
        complvl => 889
    );
}
else {

    $api = eBayAPI->new(
        apiUrl => 'https://api.sandbox.ebay.com/ws/api.dll',
        devID  => 'e68fceb1-b097-4926-8b1c-0c329db0fbf3',
        appID  => 'UWSe69eee-be2d-4fe7-8713-454877ee8ba',
        certID => '844301e5-a4bf-427d-866a-66d844749b8e',
        authToken =>
'AgAAAA**AQAAAA**aAAAAA**2LPtUw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wFk4GhDJaBow2dj6x9nY+seQ**uPoCAA**AAMAAA**y7ZMPcpVV5MEZ8MJNmS/hOQ3CScJYvZs58z5K/csyCXEBTWU2lfNfMaLcNwgVCew0GCRyWzYJemZM8jOKUCZusnI/q/dqUquP0StfJF0LWqx5iEjv2WOrIRtgcwyhaZoszCYbWGiSnQ3CrzKZ4SWMeU+ovLBWgNSD9glXn/JwDPd1ewzgWFkEm0QSrbdcJqe1Gy9t4WWdgzPU1xcjDXAkOYrC5PmWm0TjaAufq9Ek1WgHqNPBjlagYLhjC3zBwz6bgzsbIyuxY6qPuQl7REkV1TEfn7StGjPCS/4/jBYejn/7y6HZixup5MqYKSUd7ZhJNYkmH0rPUNpnwYJX5lKgHnP4w6neoeJTNUldHQo3eDeOYYotXCkKqnKNzn/jHiyWt4O8OQrWQP4Vna2cY57oobDrwfX9M5U9zf/1J28aKl4/f2pO++9DZVE8HAKwwyh6xRMN3rm4/rrZtlJwYeEkWZjyevExgD0TSwzmsxnMtWaml4DacRMwGUxJ1yVzVT6PUJ/+2a7M0IRBUm0g7QG5caoq8VCuQnoWNw2SMHyMLjro8Bou6PLAtb1qyUPyb4PgCNyqddM4LSE1IO9eucU0nlU9z+ftrvDSqS1/2IhZXybvdIa0E2PJ7zbpz2efPQG71j5lf7oICQtmm8VHKJvG0TezgsRDgrfZs8k7zWnAr/0G5oko+H8liGP2BIF5UruDuTiFD+Cf/X2+9W7/gDebeI670KkrZiBT7/ug9HbBHZX49F79HsbhD5xyFIZibn4',

        siteID  => 15,
        complvl => 889

    );
}

my $q = new CGI;


print $q->header();

# Output stylesheet, heading etc


	my $driver = "mysql";
    my $database = "lol";
    my $user = "test"; 
    my $password = "test";

    my $dbh = DBI->connect(
        "DBI:$driver:$database",
        $user, $password,
    ) or die $DBI::errstr;


	my $h2_add = "Add eBay Listing";
	my $h2_del = "Delete eBay Item";
	my $h2_update = "Update eBay Item";
	my $h2_opt = "Update/Delete eBay Item";
	
	
  if ($q->param('form1')) {
        output_top($q,$h2_add);
        display_results($q);
		
    } elsif($q->param('form2')){
	output_top($q,$h2_opt);
	update($q);
	
	}elsif ( $q->param('submit_list_btn') ) {
 
      output_top($q,$h2_add);
		
		call_api($q);
        # Parameters are defined, therefore the form has been submitted
        # print $pi;

    }elsif($q->param('delete_btn')){
	delete_top($q);
	delete_item($q);
	
	}elsif($q->param('end_item')){
	output_top($q,$h2_del);
	end_item($q);
	
	
		}elsif($q->param('update_btn')){
	output_top($q,$h2_update);
	update_item_form($q);
	
	}elsif($q->param('excute_update')){
	output_top($q,$h2_update);
	excute_update($q);
	
	}
	
	
	
	else {
	
	output_top($q,$h2_add);
    lol($q);
    output_form($q);
}

# Output footer and end html
output_end($q);

 exit 0;

 
sub excute_update{

my ($q) = @_;

 my @hidden_value = $q->param('hid_item_id');


	my $item_id = @hidden_value[0];


	my $title = $q->param('item_title');
	my $price = $q->param('item_price');
	my $quan = $q->param('item_quantity');
	my $cond = $q->param('condition');
	my $desc = $q->param('description');
	my $pic_url = $q->param('pic_url');
	my $ship_price = $q->param('ship_price');
	

	$api->update_item(
		itemId => $item_id,
	    quantity => $quan, 
		description => $desc,
		startprice => $price,
		title => $title,
		shippingCost=>$ship_price,
		conditioncode =>$cond,
		pictureurl => $pic_url
	);
	
	 # print Dumper ($api->error());
	 
	 my $chek2  = $api -> get_ack();
	 
	 

	if($chek2){
	    	print "The item <b>$title</b> has been updated successfully eBay Listing.";
	print $q->start_form(
            -name => 'main',
            -method => 'POST',
        );
		print $q->start_table;
		print $q->Tr($q->td());print $q->Tr($q->td());
			 print $q->Tr($q->td());
			 print $q->Tr($q->td($q->submit(-name=>'form2',-value => '<< Back')));

	print $q->end_table;
	print $q->end_form();
	
	
		my $sth = $dbh->prepare("
        UPDATE ebay
           SET item_title = ?, item_quan = ?,item_price = ?,item_desc = ?,  item_ship_price = ?,item_pic_url = ?
         WHERE item_id = ?
    ") or die $dbh->errstr;
	
	$sth->execute($title,$quan,$price,$desc,$ship_price,$pic_url,$item_id) or die $dbh->errstr;
	
=pod	
	$dbh->do("
        UPDATE ebay
           SET item_title = $title, item_quan = $quan,item_price = $price,item_desc = $desc,  item_ship_price = $ship_price,item_pic_url = $pic_url
         WHERE item_id = $item_id
    ") or die $dbh->errstr;
=cut	
	
}else{	

	 
	my $count = 1; 
 foreach my $error (@{$api->error()}) {
 
				print "\n\n";
					print "\t ErrorCode: \t $error->{code} \n\n \t Error Short Message:  $error->{short_message}\n\n \t Error Long Message: \t$error->{long_message}\n";

	$count++;
 }
 
 
	
}
	
	

}
 
 
 sub update_item_form{
	
	
	    my ($q) = @_;
		
			my $item = $q->param('item_list');
			
			
			   my $sth = $dbh->prepare("
        SELECT item_title, item_price,item_quan,item_desc,item_ship_price,item_pic_url, item_id
          FROM ebay
		  where item_id = ?
    ") or die $dbh->errstr;
	
	$sth->execute($item) or die $dbh->errstr;
	
	    my @row_array = $sth->fetchrow_array;
	

	my $name = @row_array[0];
	my $price = @row_array[1];
	my $quan = @row_array[2];
	my $desc = @row_array[3];
	my $ship_price = @row_array[4];
	my $pic_url = @row_array[5];
	my $item_id = @row_array[6];

    print $q->start_form(
        -name   => 'main',
        -method => 'POST'
    );
	print $q -> hidden('hid_item_id',$item_id);
    print $q->start_table;
    print $q->Tr( $q->td('<b>Title:</b>'),
        $q->td( $q->textfield( -name => "item_title", -size => 30, -value => $name ) ) );

    print $q->Tr( $q->td('<b>Price:</b>'),
        $q->td( $q->textfield( -name => "item_price", -size => 30,-value => $price ) ) );
    print $q->Tr( $q->td('<b>Quantity:</b>'),
        $q->td( $q->textfield( -name => "item_quantity", -size => 30,-value =>$quan ) ) );

    my %item_condit = ( '1000' => 'New', '3000' => 'Used' );
    print $q->Tr(
        $q->td('<b>Condition:</b>'),
        $q->td(
            $q->popup_menu(
                -name   => 'condition',
                -values => [ keys %item_condit ],
                -labels => \%item_condit,

            )
        )
    );

    print $q->Tr(
        $q->td('<b>Description:</b>'),
        $q->td(
            $q->textarea(
                -name  => 'description',
                -value => $desc,
                -cols  => 40,
                -rows  => 6,
            )
        )
    );

	print $q->Tr( $q->td('<b>Shipping Price:</b>'),
        $q->td( $q->textfield( -name => "ship_price", -size => 30, -value => $ship_price ) ) );
		
		
	print $q->Tr( $q->td('<b>Picture URL:</b>'),
        $q->td( $q->textfield( -name => "pic_url", -size => 30, -value => $pic_url ) ) );
	
    print $q->Tr( 
	$q->td(),$q->td($q->submit( -name=>'form2',-value => '<< Back ')),

        $q->td($q->submit( -name=>'excute_update',-value => 'Update Item' )) );

    print $q->end_table;
	

    print $q->end_form;
	 
	 
	 
	 
	
	}
 
 
 
 
 
 
 
 
 sub end_item{
 my ($q) = @_;
 my @hidden_value = $q->param('hid_end_id');


	my $id = @hidden_value[0];
	my $name = @hidden_value[1];

	$api->delete_item(

# http://search.cpan.org/~tkeefer/eBay-API/lib/eBay/API/XML/DataType/Enum/EndReasonCodeType.pm
    itemId     => $id,
    end_reason => "Incorrect"
);

my $chek1 = $api->get_ack();

# print Dumper ($chek1);

if ($chek1) {
    	print "The item <b>$name</b> was successfully removed from eBay Listing.";
	print $q->start_form(
            -name => 'main',
            -method => 'POST',
        );
		print $q->start_table;
		print $q->Tr($q->td());print $q->Tr($q->td());
			 print $q->Tr($q->td());
			 print $q->Tr($q->td($q->submit(-name=>'form2',-value => '<< Back')));

	print $q->end_table;
	print $q->end_form();
	
	my $sth = $dbh->prepare("
        DELETE FROM ebay
         WHERE item_id = ?
    ") or die $dbh->errstr;

    $sth->execute($id) or die $dbh->errstr;

	
}
else {

    	my $count = 1; 
 foreach my $error (@{$api->error()}) {
 
				print "\n\n";
					print "\t ErrorCode: \t $error->{code} \n\n \t Error Short Message:  $error->{short_message}\n\n \t Error Long Message: \t$error->{long_message}\n";

	$count++;
}
 

 }
 }
 
sub delete_item{

my ($q) = @_; 

			my $item = $q->param('item_list');
			
			
			   my $sth = $dbh->prepare("
        SELECT item_id, item_title, item_price,item_quan
          FROM ebay
		  where item_id = ?
    ") or die $dbh->errstr;
	
	$sth->execute($item) or die $dbh->errstr;
	print $q->h3("Item Details");
	
	print $q->start_form(
            -name => 'main',
            -method => 'POST',
        );
	 print $q->start_table;
	 
	 
    my @row_array = $sth->fetchrow_array;
	
	my $id = @row_array[0];
	my $name = @row_array[1];
	my $price = @row_array[2];
	my $quan = @row_array[3];
	
	print $q -> hidden('hid_end_id',$id,$name);
	
print $q->Tr($q->td());print $q->Tr($q->td());
			 print $q->Tr($q->td());print $q->Tr($q->td());
	print $q->Tr(
          $q->td("<b>Item ID: </b>"),
		   $q->td($id)
			);
			 
			 print $q->Tr(
          $q->td("<b>Item Title: </b>"),
		   $q->td($name)
			);
			
			  print $q->Tr(
          $q->td("<b>Item Price: </b>"),
		   $q->td($price)
			);
			
			   print $q->Tr(
          $q->td("<b>Item Quantity: </b>"),
		   $q->td($quan)
			);
			

			
			 print $q->Tr($q->td());print $q->Tr($q->td());
			 print $q->Tr($q->td());print $q->Tr($q->td());
   print $q->end_table;
   print "<blockquote>  Are you sure you want to remove the following item from eBay listing?</blockquote>";
   print $q->start_table;
 
			print $q->Tr($q->td());
			print $q->Tr($q->td());
			   print $q->Tr(
			   $q->td(),
			   $q->td(),
          $q->td($q->submit(-name=>'form2', -value => 'Cancel' )),
		   $q->td($q->submit(-name=>'end_item', -value => 'Delete' ))
			);

   print $q->end_table;
   
       print $q->end_form();
			# print Dumper($item);


}
 
 
	sub lol{
	      my ($q) = @_; 
		  
		   print $q->start_form(
            -name => 'main',
            -method => 'POST',
        );

        print $q->start_table;
		  
		   print $q->Tr(
          $q->td(),
		   $q->td(),
		    $q->td(),
          $q->td($q->submit(-name=>'form2',-value => 'Update/Delete Item'),
		  
		  
		  )
        );
        print $q->end_table;
        print $q->end_form;
    }

sub update{

	
	
	   my $sth = $dbh->prepare("
        SELECT item_id, item_title, item_price,item_quan
          FROM ebay
    ") or die $dbh->errstr;
	
	$sth->execute() or die $dbh->errstr;
	
	my @item_id;
	my %item_name;
	 
    while (my @row_array = $sth->fetchrow_array) {
	
	my $id = $row_array[0];
	my $name = $row_array[1];
	
	$item_name{$id} = $name;
	#  push (@item_id,$item_id);
	push (@item_id,$id);
	
   
    }
	
	   print $q->start_form(
            -name => 'main',
            -method => 'POST',
        );

        print $q->start_table;
	        print $q->Tr(
          $q->td(),
          $q->td(
          
          )
        );
		 print $q->Tr(
		 
		 $q->td('<b>Select Item:</b>'),
		 $q->td( $q->scrolling_list(-name=>'item_list',
				-values=>\@item_id,
				
				-size=>10,
				-labels=>\%item_name,
			# -attributes=>\%attributes
			)
			)

			);
		 
		 
		 
		 	print $q->Tr($q->td());
		print $q->Tr($q->td());
		print $q->Tr($q->td());

		print $q->Tr( 
		$q->td($q->submit( -value => '<< Back' )),
		$q->td($q->submit(-name=>'update_btn', -value => 'Update Item' )),
		

        $q->td($q->submit(-name=>'delete_btn', -value => 'Delete Item' )));
		
		 print $q->end_table;
		 
		 
		 
	
        print $q->end_form;
	
	
	
=pod	
	    $dbh->do("
        INSERT INTO ebay 
                    (item_id, item_title, item_price,item_quan)
             VALUES (743457,'testing item', 12.50,8)
    ") or die $dbh->errstr;
=cut
}


sub call_api{

my ($q) = @_;
my @hidden_value = $q->param('hid_name');
my $cat = $q->param('categories');

	my $title = @hidden_value[0];
	my $price = @hidden_value[1];
	my $quan = @hidden_value[2];
	my $cond = @hidden_value[3];
	my $desc = @hidden_value[4];
	my $pic_url = @hidden_value[5];
	my $ship_price = @hidden_value[6];









$api->add_item(

		title => $title,
		startPrice => $price,
		quantity => $quan,	
		description =>$desc ,
		countryCode =>'AU',
		currencyCode =>'AUD',
		listingDuration=>'Days_10',
		location=>'Liverpool',
		postalCode=> 2170,
		paymentMethod=>'PayPal',
		conditionID=>$cond,
		dispatchTimeMax=>3,
		listingType=>'FixedPriceItem',
		payPalEmailAddress=>'michael_mrmycool@msn.com',
		returnsAcceptedOption=>'ReturnsAccepted',
		refundOption=>'MoneyBack',
		returnsWithinOption=>'Days_30',
		returnPolicyDetail=> 'this is the testing for return policy descriptions',
		shippingCostPaidByOption=>'Buyer',
		shippingType=>'Flat',
		shippingService=>'AU_Express',
		ShippingServiceCost=> $ship_price,
		shippingServicePriority=>1,
		categoryID=>175675,
		# categoryID=>$cat,
		setThumbnail => $pic_url,
		pictureurl => $pic_url
		

	);

if ($api->get_item_id()){

 my $item_id =  $api->get_item_id();


 
		print $q->h3("Item Details");
	
	print $q->start_form(
            -name => 'main',
            -method => 'POST',
        );
	 print $q->start_table;
	 
  print "<blockquote>  Item has been Successfully added on eBay Listing.</blockquote>";
print $q->Tr($q->td());print $q->Tr($q->td());
			 print $q->Tr($q->td());print $q->Tr($q->td());
	print $q->Tr(
          $q->td("<b>Item ID: </b>"),
		   $q->td($item_id)
			);
			 
			 print $q->Tr(
          $q->td("<b>Item Title: </b>"),
		   $q->td($title)
			);
			
			  print $q->Tr(
          $q->td("<b>Item Price: </b>"),
		   $q->td($price)
			);
			
			   print $q->Tr(
          $q->td("<b>Item Quantity: </b>"),
		   $q->td($quan)
			);
			
		print $q->Tr(
          $q->td("<b>Item Description: </b>"),
		   $q->td($desc)
			);
			
			print $q->Tr(
          $q->td("<b>Item Shipping Cost: </b>"),
		   $q->td($ship_price)
			);
			

			
			 print $q->Tr($q->td());print $q->Tr($q->td());
			 print $q->Tr($q->td());print $q->Tr($q->td());
   print $q->end_table;
 
   print $q->start_table;
 
			print $q->Tr($q->td());
			print $q->Tr($q->td());
			   print $q->Tr(
			   
          $q->td($q->submit( -value => 'List New Item' )),$q->td($q->submit(-name=>'form2', -value => 'Update/Delete Item' ))
			);

   print $q->end_table;
   
       print $q->end_form();

 
 
 
 
 
 
	   my $sth = $dbh->prepare("
        INSERT INTO ebay 
                    (item_id, item_title, item_price,item_quan,item_desc,item_ship_price,item_pic_url)
             VALUES (?,?,?,?,?,?,?)
    ") or die $dbh->errstr;
	
	
	$sth->execute($item_id,$title,$price,$quan,$desc,$ship_price,$pic_url) or die $dbh->errstr;

}


else{	
	 
	my $count = 1; 
 foreach my $error (@{$api->error()}) {
 
				print "\n\n";
					print "\t ErrorCode: \t $error->{code} \n\n \t Error Short Message:  $error->{short_message}\n\n \t Error Long Message: \t$error->{long_message}\n";

	$count++;
 }
 }

 
 
 
 
}


sub output_form2 {
    my ($q ,$text1_value) = @_;
    
	my $title = $q->param('item_title');
	my $price = $q->param('item_price');
	my $quan = $q->param('item_quantity');
	my $cond = $q->param('condition');
	my $desc = $q->param('description');
	my $pic_url = $q->param('pic_url');
	my $ship_price = $q->param('ship_price');


    my @cat_id;
    my %cat_name;



    

    
	
	    $api->find_categories($text1_value);

		if ( $api->list_categories ) {

        foreach my $io ( @{ $api->list_categories } ) {

            my $id   = $io->{cat_id};
            my $name = $io->{cat_name};

            push( @cat_id, $id );

            $cat_name{$id} = $name;

            # print $io->{cat_id}."\t".$io->{cat_name}."\n";

        }

    }

	
        print $q->start_form(
            -name   => 'main',
            -method => 'POST'
        );

		
		
		print $q -> hidden('hid_name',$title,$price,$quan,$cond,$desc,$pic_url,$ship_price);
		
		
	
print $q->start_table;

   print $q->Tr( $q->td('<b>Chose a Category: </b>'),

        $q->td( $q->popup_menu(
            -name    => 'categories',
            -values  => \@cat_id,
            -labels  => \%cat_name
        ))
		);
		
		print $q->Tr($q->td());
		print $q->Tr($q->td());
		print $q->Tr($q->td());
		print $q->Tr($q->td());
		print $q->Tr( $q->td($q->submit( -value => '<< Back' )),$q->td(),

        $q->td($q->submit(-name=>'submit_list_btn', -value => 'Add Listing' )));

		 
		print $q->end_table;
		
        print $q->end_form;
    

}




sub output_top {
    my ($q,$h2) = @_;
    print $q->start_html(
        -title   => 'eBay API',
        -bgcolor => 'white',
        -style   => {
            -code => '
                    /* Stylesheet code */
                    body {
                        font-family: verdana, sans-serif;
						margin-left:auto;
						margin-right:auto;
						height:auto;
						width:800px;
                    }
                    h2 {
                        color: darkblue;
                        border-bottom: 1pt solid;
                        width: 100%;
                    }
                    div {
                        text-align: right;
                        color: steelblue;
                        border-top: darkblue 1pt solid;
                        margin-top: 4pt;
                    }
                    th {
                        text-align: right;
                        padding: 2pt;
                        vertical-align: top;
						
                    }
                    td {
                        padding: 2pt;
                        vertical-align: top;
						float: left;
						text-align: right;
						display: block;
						width: 180px;
                    }
					
                    /* End Stylesheet code */
                ',
        },
    );
    print $q->h2($h2);
}

sub display_results {
    my ($q) = @_;
    my $text1_value = $q->param('item_title');


    output_form2($q,$text1_value);

}

sub output_form {
    my ($q) = @_;

    print $q->start_form(
        -name   => 'main',
        -method => 'POST'
    );

    print $q->start_table;
	print $q->Tr($q->td());print $q->Tr($q->td());
			 print $q->Tr($q->td());print $q->Tr($q->td());
    print $q->Tr( $q->td('<b>Title:</b>'),
        $q->td( $q->textfield( -name => "item_title", -size => 30, -value => 'Laptop AUS' ) ) );

    print $q->Tr( $q->td('<b>Price:</b>'),
        $q->td( $q->textfield( -name => "item_price", -size => 30,-value => '12.90' ) ) );
    print $q->Tr( $q->td('<b>Quantity:</b>'),
        $q->td( $q->textfield( -name => "item_quantity", -size => 30,-value => '4' ) ) );

    my %item_condit = ( '1000' => 'New', '3000' => 'Used' );
    print $q->Tr(
        $q->td('<b>Condition:</b>'),
        $q->td(
            $q->popup_menu(
                -name   => 'condition',
                -values => [ keys %item_condit ],
                -labels => \%item_condit,

            )
        )
    );

    print $q->Tr(
        $q->td('<b>Description:</b>'),
        $q->td(
            $q->textarea(
                -name  => 'description',
                -value => 'this is just testing',
                -cols  => 40,
                -rows  => 6,
            )
        )
    );

	print $q->Tr( $q->td('<b>Shipping Price:</b>'),
        $q->td( $q->textfield( -name => "ship_price", -size => 30, -value => '5.50' ) ) );
		
		
	print $q->Tr( $q->td('<b>Picture URL:</b>'),
        $q->td( $q->textfield( -name => "pic_url", -size => 30, -value => 'http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg' ) ) );
	print $q->Tr($q->td());print $q->Tr($q->td());
			 print $q->Tr($q->td());print $q->Tr($q->td());
    print $q->Tr( $q->td(  ),
	$q->td(),

        $q->td($q->submit( -name=>'form1',-value => 'Continue>>' )) );

    print $q->end_table;
	

    print $q->end_form;

}

sub output_end {
    my ($q) = @_;
    print $q->div("eBay API Form");
    print $q->end_html;
}


sub delete_top {
    my ($q) = @_;
    print $q->start_html(
        -title   => 'eBay API',
        -bgcolor => 'white',
        -style   => {
            -code => '
                    /* Stylesheet code */
                    body {
                        font-family: verdana, sans-serif;
						margin-left:auto;
						margin-right:auto;
						height:auto;
						width:800px;
                    }
                    h2 {
                        color: darkblue;
                        border-bottom: 1pt solid;
                        width: 100%;
                    }
                    div {
                        text-align: right;
                        color: steelblue;
                        border-top: darkblue 1pt solid;
                        margin-top: 4pt;
                    }
                    th {
                        text-align: right;
                        padding: 2pt;
                        vertical-align: top;
						
                    }
                    td {
                        padding: 2pt;
                        vertical-align: top;
						float: left;
						text-align: right;
						display: block;
						width: 280px;
                    }
					
                    /* End Stylesheet code */
                ',
        },
    );
    print $q->h2("Delete eBay Item");
}

1;
