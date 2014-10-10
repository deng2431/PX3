 

use strict;
use eBay::API::XML::Call::EndItem;
use eBay::API::XML::DataType::Enum::EndReasonCodeType;
 
  my $pCall = eBay::API::XML::Call::EndItem->new(
  );
      	 $pCall->setApiUrl('https://api.sandbox.ebay.com/ws/api.dll');
	 $pCall->setDevID('e68fceb1-b097-4926-8b1c-0c329db0fbf3');
      $pCall->setAppID('UWSe69eee-be2d-4fe7-8713-454877ee8ba');
      $pCall->setCertID('e68fceb1-b097-4926-8b1c-0c329db0fbf3');
	  $pCall->setAuthToken('AgAAAA**AQAAAA**aAAAAA**2LPtUw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wFk4GhDJaBow2dj6x9nY+seQ**uPoCAA**AAMAAA**y7ZMPcpVV5MEZ8MJNmS/hOQ3CScJYvZs58z5K/csyCXEBTWU2lfNfMaLcNwgVCew0GCRyWzYJemZM8jOKUCZusnI/q/dqUquP0StfJF0LWqx5iEjv2WOrIRtgcwyhaZoszCYbWGiSnQ3CrzKZ4SWMeU+ovLBWgNSD9glXn/JwDPd1ewzgWFkEm0QSrbdcJqe1Gy9t4WWdgzPU1xcjDXAkOYrC5PmWm0TjaAufq9Ek1WgHqNPBjlagYLhjC3zBwz6bgzsbIyuxY6qPuQl7REkV1TEfn7StGjPCS/4/jBYejn/7y6HZixup5MqYKSUd7ZhJNYkmH0rPUNpnwYJX5lKgHnP4w6neoeJTNUldHQo3eDeOYYotXCkKqnKNzn/jHiyWt4O8OQrWQP4Vna2cY57oobDrwfX9M5U9zf/1J28aKl4/f2pO++9DZVE8HAKwwyh6xRMN3rm4/rrZtlJwYeEkWZjyevExgD0TSwzmsxnMtWaml4DacRMwGUxJ1yVzVT6PUJ/+2a7M0IRBUm0g7QG5caoq8VCuQnoWNw2SMHyMLjro8Bou6PLAtb1qyUPyb4PgCNyqddM4LSE1IO9eucU0nlU9z+ftrvDSqS1/2IhZXybvdIa0E2PJ7zbpz2efPQG71j5lf7oICQtmm8VHKJvG0TezgsRDgrfZs8k7zWnAr/0G5oko+H8liGP2BIF5UruDuTiFD+Cf/X2+9W7/gDebeI670KkrZiBT7/ug9HbBHZX49F79HsbhD5xyFIZibn4');
	  $pCall->setSiteID(0); 
	  $pCall->getCompatibilityLevel(871);
	 
	  
	  
	$pCall->setItemID(110150629263);
	$pCall->setEndingReason(eBay::API::XML::DataType::Enum::EndReasonCodeType::NotAvailable);
	
	 
	 
	  $pCall->execute();
	  
	  
	  
	  my $endTime = $pCall->getEndTime();
	 
	 my $hi = $pCall->getResponseRawXml();
	 
 
  print $endTime."\n\n\n";

	 
	 print $hi . "\n";
