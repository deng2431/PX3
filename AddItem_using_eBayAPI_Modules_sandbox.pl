
use strict; 
 use eBay::API::XML::Call::AddItem;
 use eBay::API::XML::DataType::ItemType; 
 use eBay::API::XML::DataType::CategoryType; 
 use eBay::API::XML::DataType::Enum::CountryCodeType; 
 use eBay::API::XML::DataType::Enum::CurrencyCodeType; 
 use eBay::API::XML::DataType::Enum::ListingTypeCodeType; 
 use eBay::API::XML::DataType::Enum::BuyerPaymentMethodCodeType;

	 
#$pItem->();
	 
	 my $pItem = eBay::API::XML::DataType::ItemType->new();
     $pItem->setCountry(eBay::API::XML::DataType::Enum::CountryCodeType::US);
     $pItem->setCurrency(eBay::API::XML::DataType::Enum::CurrencyCodeType::USD);
     $pItem->setDescription('this is just testing');
     $pItem->setListingDuration('Days_7');
     $pItem->setLocation('San Jose, CA');
     $pItem->setPaymentMethods(eBay::API::XML::DataType::Enum::BuyerPaymentMethodCodeType::PaymentSeeDescription);
     $pItem->setQuantity(1);
     $pItem->getStartPrice()->setValue(11.0);
     $pItem->setTitle('Harry Potter and the Philosopher test');
	# $pItem->setPrimaryCategory()->setCategoryID(377);
	  $pItem->setConditionID(3000);
	  $pItem->setDispatchTimeMax(3);
	  $pItem->setListingType('Chinese');
	  $pItem->setPaymentMethods('PayPal');
	  $pItem->setPayPalEmailAddress('test_deng2431@gmail.com');
	  $pItem->setPostalCode(94089);
	  $pItem->getReturnPolicy()->setReturnsAcceptedOption('ReturnsAccepted');
	  $pItem->getReturnPolicy()->setRefundOption('MoneyBack');
	  $pItem->getReturnPolicy()->setReturnsWithinOption('Days_30');
	  $pItem->getReturnPolicy()->setDescription('This is the first book in the Harry Potter series. In excellent condition!');
	  $pItem->getReturnPolicy()->setShippingCostPaidByOption('Buyer');
	  $pItem->getShippingDetails()->setShippingType('Flat');
	  # $pItem->getShippingDetails()->setShippingServicePriority(1);
	   # $pItem->getShippingDetails()->getShippingServiceOptions()->getShippingService('USPSPriority');
	   # $pItem->getShippingDetails()->getShippingServiceOptions()->setShippingServiceCost(5);
	  
	  my $ship = eBay::API::XML::DataType::ShippingServiceOptionsType->new();
	  $ship->setShippingService('USPSMedia');
	  $ship->setShippingServiceCost(2.50);
	   $ship->setShippingServicePriority(1);
	   $pItem->getShippingDetails()->setShippingServiceOptions($ship);

     my $pCat = eBay::API::XML::DataType::CategoryType->new();
     $pCat->setCategoryID(377);
     $pItem->setPrimaryCategory($pCat);

     my $pCall = eBay::API::XML::Call::AddItem->new();
	 
	 	 $pCall->setApiUrl('https://api.sandbox.ebay.com/ws/api.dll');
	 $pCall->setDevID('e68fceb1-b097-4926-8b1c-0c329db0fbf3');
      $pCall->setAppID('UWSe69eee-be2d-4fe7-8713-454877ee8ba');
      $pCall->setCertID('e68fceb1-b097-4926-8b1c-0c329db0fbf3');
	  $pCall->setAuthToken('AgAAAA**AQAAAA**aAAAAA**2LPtUw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wFk4GhDJaBow2dj6x9nY+seQ**uPoCAA**AAMAAA**y7ZMPcpVV5MEZ8MJNmS/hOQ3CScJYvZs58z5K/csyCXEBTWU2lfNfMaLcNwgVCew0GCRyWzYJemZM8jOKUCZusnI/q/dqUquP0StfJF0LWqx5iEjv2WOrIRtgcwyhaZoszCYbWGiSnQ3CrzKZ4SWMeU+ovLBWgNSD9glXn/JwDPd1ewzgWFkEm0QSrbdcJqe1Gy9t4WWdgzPU1xcjDXAkOYrC5PmWm0TjaAufq9Ek1WgHqNPBjlagYLhjC3zBwz6bgzsbIyuxY6qPuQl7REkV1TEfn7StGjPCS/4/jBYejn/7y6HZixup5MqYKSUd7ZhJNYkmH0rPUNpnwYJX5lKgHnP4w6neoeJTNUldHQo3eDeOYYotXCkKqnKNzn/jHiyWt4O8OQrWQP4Vna2cY57oobDrwfX9M5U9zf/1J28aKl4/f2pO++9DZVE8HAKwwyh6xRMN3rm4/rrZtlJwYeEkWZjyevExgD0TSwzmsxnMtWaml4DacRMwGUxJ1yVzVT6PUJ/+2a7M0IRBUm0g7QG5caoq8VCuQnoWNw2SMHyMLjro8Bou6PLAtb1qyUPyb4PgCNyqddM4LSE1IO9eucU0nlU9z+ftrvDSqS1/2IhZXybvdIa0E2PJ7zbpz2efPQG71j5lf7oICQtmm8VHKJvG0TezgsRDgrfZs8k7zWnAr/0G5oko+H8liGP2BIF5UruDuTiFD+Cf/X2+9W7/gDebeI670KkrZiBT7/ug9HbBHZX49F79HsbhD5xyFIZibn4');
	  $pCall->setSiteID(0); 
	  $pCall->getCompatibilityLevel(871);
	 
	 

     $pCall->setItem($pItem);
     $pCall->execute();

     my $sItemId = $pCall->getItemID()->getValue();
	 
	 print $pCall->getResponseRawXml();
	 
	 print $sItemId;
	 
	 
	 
	 
	 