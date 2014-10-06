

use strict;
use warnings;
use lib "ebayAPI";
use ebayAPI::ebayAPI;



	ebayAPI->ebayAccount(

		apiUrl => 'https://api.ebay.com/ws/api.dll',
		devID => 'e68fceb1-b097-4926-8b1c-0c329db0fbf3',
		appID => 'UWS796178-b2ca-4daf-bf42-dd1dbdb4842',
		certID => '7858eb24-b5b0-4030-9ccd-e6f3e91269ff',
		authToken => 'AgAAAA**AQAAAA**aAAAAA**vnj7Uw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wNmYqpAJaLogWdj6x9nY+seQ**B2wCAA**AAMAAA**E9FZwUywJKCaHos1XgqtnKQsT+P2V2VJ4ARcYaIJ5Dw+Uyu7fCp3IMWgSbaf9/QMPgDBn6uNFH0ZUCWmSMgMhb2Kc1TFBiLvhEq0ULrMG4yctEFKGN2P2SwSfYNUhDCGH3ifQD/sZ6+pHca42g453x1PtpUokrsqVnqThgTM5OrO+NF+GR1z2s88PfbICr6cd9ep5otOJdLx+wg/jYp5WMVvkEI+F3EQihimMWL/9hRpTCEDyogXSbIb6gQUvpDRtVJwXN072oMVkBuVjgK5epWxN+vQ/J0ZSxbAhH7GFBsu5aLMghAmcV8W3Kip/xl65PTBhblEnI+O+X8mou3oNIvEwkADFZa1xWJBoDBMN1/+4rFWIQh+xjXhb1ncikS3Qt0RTvD+S4gMj0Jx7/P8sxtrI2jiEPwbHgZU6qEaSt3d6xVxeVWJsvqOQsOWpfyVIf/o3mIZnDD9UpO9Exx6gqIaWr9WdtGAqZAS8wsoXX3KMWqlFsZsJ14s97AtfA0zQsXopHydLcF/4dioHgwo8eA2CDlPe+5o6QtY1ZGEgTtpa0Mz4qBrGUigMqK0rnGShqkv4BwXacqRbZbvwlxX9CbuVErQots3FRMTPCE667uLUK2qn5y7XuBqil55zLO/ULqZ/TuWQqFyoHlmp7JZpeg9mZv8Z5Xs+ufFbk71QmolTSf0m1lKp4l2hhquiB071ZfS8rdKdMB0hw1p5HC+D8cwzpDIaiwOeOBwb4fhHoSujaticV0pcitxbBd8S8+z',

		siteID => 15,
		complvl => 889

	);

=pod
	ebayAPI->addItem(

		title => 'Nikon D90 Api Testing 4 - DO NOT BUY!!!!!',
		startPrice => 1.50,
		quantity => 1,	
		description =>'this is just testing, please do not buy!!!',
		countryCode =>'AU',
		currencyCode =>'AUD',
		listingDuration=>'Days_10',
		location=>'Liverpool',
		postalCode=> 2170,
		paymentMethod=>'PayPal',
		conditionID=>1000,
		dispatchTimeMax=>3,
		listingType=>'Chinese',
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
		categoryID=>31388
		

	);
	
=cut
	

	ebayAPI->updateItem(

		itemID => 301333083035,

		pictureurl => "http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg"

	);

	