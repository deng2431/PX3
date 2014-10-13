
#!/usr/bin/perl 
use strict;
use warnings;
use lib '../';
use ebayAPI; 

# ./run.pl
# ./eBayAPI.pm
my $production_live = 1;
my $api;
if($production_live ==1 ){
 $api = eBayAPI->new(


	


		
		apiUrl => 'https://api.ebay.com/ws/api.dll',
		devID => 'e68fceb1-b097-4926-8b1c-0c329db0fbf3',
		appID => 'UWS796178-b2ca-4daf-bf42-dd1dbdb4842',
		certID => '7858eb24-b5b0-4030-9ccd-e6f3e91269ff',
		authToken => 'AgAAAA**AQAAAA**aAAAAA**vnj7Uw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wNmYqpAJaLogWdj6x9nY+seQ**B2wCAA**AAMAAA**E9FZwUywJKCaHos1XgqtnKQsT+P2V2VJ4ARcYaIJ5Dw+Uyu7fCp3IMWgSbaf9/QMPgDBn6uNFH0ZUCWmSMgMhb2Kc1TFBiLvhEq0ULrMG4yctEFKGN2P2SwSfYNUhDCGH3ifQD/sZ6+pHca42g453x1PtpUokrsqVnqThgTM5OrO+NF+GR1z2s88PfbICr6cd9ep5otOJdLx+wg/jYp5WMVvkEI+F3EQihimMWL/9hRpTCEDyogXSbIb6gQUvpDRtVJwXN072oMVkBuVjgK5epWxN+vQ/J0ZSxbAhH7GFBsu5aLMghAmcV8W3Kip/xl65PTBhblEnI+O+X8mou3oNIvEwkADFZa1xWJBoDBMN1/+4rFWIQh+xjXhb1ncikS3Qt0RTvD+S4gMj0Jx7/P8sxtrI2jiEPwbHgZU6qEaSt3d6xVxeVWJsvqOQsOWpfyVIf/o3mIZnDD9UpO9Exx6gqIaWr9WdtGAqZAS8wsoXX3KMWqlFsZsJ14s97AtfA0zQsXopHydLcF/4dioHgwo8eA2CDlPe+5o6QtY1ZGEgTtpa0Mz4qBrGUigMqK0rnGShqkv4BwXacqRbZbvwlxX9CbuVErQots3FRMTPCE667uLUK2qn5y7XuBqil55zLO/ULqZ/TuWQqFyoHlmp7JZpeg9mZv8Z5Xs+ufFbk71QmolTSf0m1lKp4l2hhquiB071ZfS8rdKdMB0hw1p5HC+D8cwzpDIaiwOeOBwb4fhHoSujaticV0pcitxbBd8S8+z',
		siteID => 15,
		complvl => 889);
		}
		else{
		
		$api = eBayAPI->new(
		apiUrl => 'https://api.sandbox.ebay.com/ws/api.dll',
		devID => 'e68fceb1-b097-4926-8b1c-0c329db0fbf3',
		appID => 'UWSe69eee-be2d-4fe7-8713-454877ee8ba',
		certID => '844301e5-a4bf-427d-866a-66d844749b8e',
		authToken => 'AgAAAA**AQAAAA**aAAAAA**2LPtUw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wFk4GhDJaBow2dj6x9nY+seQ**uPoCAA**AAMAAA**y7ZMPcpVV5MEZ8MJNmS/hOQ3CScJYvZs58z5K/csyCXEBTWU2lfNfMaLcNwgVCew0GCRyWzYJemZM8jOKUCZusnI/q/dqUquP0StfJF0LWqx5iEjv2WOrIRtgcwyhaZoszCYbWGiSnQ3CrzKZ4SWMeU+ovLBWgNSD9glXn/JwDPd1ewzgWFkEm0QSrbdcJqe1Gy9t4WWdgzPU1xcjDXAkOYrC5PmWm0TjaAufq9Ek1WgHqNPBjlagYLhjC3zBwz6bgzsbIyuxY6qPuQl7REkV1TEfn7StGjPCS/4/jBYejn/7y6HZixup5MqYKSUd7ZhJNYkmH0rPUNpnwYJX5lKgHnP4w6neoeJTNUldHQo3eDeOYYotXCkKqnKNzn/jHiyWt4O8OQrWQP4Vna2cY57oobDrwfX9M5U9zf/1J28aKl4/f2pO++9DZVE8HAKwwyh6xRMN3rm4/rrZtlJwYeEkWZjyevExgD0TSwzmsxnMtWaml4DacRMwGUxJ1yVzVT6PUJ/+2a7M0IRBUm0g7QG5caoq8VCuQnoWNw2SMHyMLjro8Bou6PLAtb1qyUPyb4PgCNyqddM4LSE1IO9eucU0nlU9z+ftrvDSqS1/2IhZXybvdIa0E2PJ7zbpz2efPQG71j5lf7oICQtmm8VHKJvG0TezgsRDgrfZs8k7zWnAr/0G5oko+H8liGP2BIF5UruDuTiFD+Cf/X2+9W7/gDebeI670KkrZiBT7/ug9HbBHZX49F79HsbhD5xyFIZibn4',
		
		
		
		
		
		siteID => 15,
		complvl => 889

	);
	}

=pod	
	$api->get_category(
	
	query=>"iphone 6"
	
	);
	

	
	
	
	print $api;
	
	$api->hi(
	
	title => 'dgfhdfgh',
	
	test => 'sdgasdfh'
	
	);
	



my $item_id = $api->add_item(

		title => "Camera Nikon",
		startPrice => 1.50,
		quantity => 1,	
		description =>'test listing',
		countryCode =>'AU',
		currencyCode =>'AUD',
		listingDuration=>'Days_10',
		location=>'Liverpool',
		postalCode=> 2170,
		paymentMethod=>'PayPal',
		conditionID=>1000,
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
		ShippingServiceCost=> 3.0,
		shippingServicePriority=>1,
		# categoryID=>171788
		

	);

=cut

my $item_id = 301347024014;

$api->delete_item(
	
# http://search.cpan.org/~tkeefer/eBay-API/lib/eBay/API/XML/DataType/Enum/EndReasonCodeType.pm
		itemId => $item_id,
		end_reason => "Incorrect"
		
		);


=pod
if ($item_id) {
	# update_item()
	$api->update_item(
		itemId => $item_id,
		setThumbnail => "http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg",
		pictureurl => "http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg",
		pictureurl1 => "http://www.ephotozine.com/articles/nikon-d5200-dslr-sample-photo-gallery-21069/images/highres-nikon-d5200-3_1357642698.jpg",
	    quantity => 6 # <- can you please make sure that quantity is set?
	);
}
=cut

=pod
else {
	print $api->error() # <- error() should returns the error message;
}
=cut
=pod
# delete_item() should return true (return 1;) on succesful()
if ($api->delete_item($item_id)) {
	print "Item Deleted";
}
else {
	print $api->error(); # <- error() should returns the error message;	
}
	
=cut
=pod	

	ebayAPI->updateItem(

		itemID => 301347024014,
		setThumbnail => "http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg",
		pictureurl => "http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg",
		pictureurl1 => "http://www.ephotozine.com/articles/nikon-d5200-dslr-sample-photo-gallery-21069/images/highres-nikon-d5200-3_1357642698.jpg"

	);
=cut
	