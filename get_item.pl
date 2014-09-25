 

use strict;

use  eBay::API::XML::Call::GetItem;
use eBay::API::XML::DataType::CategoryType;

 
 
 
 my $pCall =  eBay::API::XML::Call::GetItem->new();
 
      	$pCall->setApiUrl('https://api.ebay.com/ws/api.dll');
	 $pCall->setDevID('e68fceb1-b097-4926-8b1c-0c329db0fbf3');
      $pCall->setAppID('UWS796178-b2ca-4daf-bf42-dd1dbdb4842');
      $pCall->setCertID('7858eb24-b5b0-4030-9ccd-e6f3e91269ff');
	  $pCall->setAuthToken('AgAAAA**AQAAAA**aAAAAA**vnj7Uw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wNmYqpAJaLogWdj6x9nY+seQ**B2wCAA**AAMAAA**E9FZwUywJKCaHos1XgqtnKQsT+P2V2VJ4ARcYaIJ5Dw+Uyu7fCp3IMWgSbaf9/QMPgDBn6uNFH0ZUCWmSMgMhb2Kc1TFBiLvhEq0ULrMG4yctEFKGN2P2SwSfYNUhDCGH3ifQD/sZ6+pHca42g453x1PtpUokrsqVnqThgTM5OrO+NF+GR1z2s88PfbICr6cd9ep5otOJdLx+wg/jYp5WMVvkEI+F3EQihimMWL/9hRpTCEDyogXSbIb6gQUvpDRtVJwXN072oMVkBuVjgK5epWxN+vQ/J0ZSxbAhH7GFBsu5aLMghAmcV8W3Kip/xl65PTBhblEnI+O+X8mou3oNIvEwkADFZa1xWJBoDBMN1/+4rFWIQh+xjXhb1ncikS3Qt0RTvD+S4gMj0Jx7/P8sxtrI2jiEPwbHgZU6qEaSt3d6xVxeVWJsvqOQsOWpfyVIf/o3mIZnDD9UpO9Exx6gqIaWr9WdtGAqZAS8wsoXX3KMWqlFsZsJ14s97AtfA0zQsXopHydLcF/4dioHgwo8eA2CDlPe+5o6QtY1ZGEgTtpa0Mz4qBrGUigMqK0rnGShqkv4BwXacqRbZbvwlxX9CbuVErQots3FRMTPCE667uLUK2qn5y7XuBqil55zLO/ULqZ/TuWQqFyoHlmp7JZpeg9mZv8Z5Xs+ufFbk71QmolTSf0m1lKp4l2hhquiB071ZfS8rdKdMB0hw1p5HC+D8cwzpDIaiwOeOBwb4fhHoSujaticV0pcitxbBd8S8+z');
	  $pCall->setSiteID(15); 
	  $pCall->getCompatibilityLevel(871);
	  
	   
	

	my $itemID = 301326107285;


		
	
	 
	 $pCall->setItemID($itemID);
	 
	 
	 
	  $pCall->execute();
	  
	  
	  my $hasErrors = $pCall->hasErrors();
if ($hasErrors) {
    
    my $raErrors = $pCall->getErrors();
    foreach my $pError ( @$raErrors ) {

        my $sErrorCode = $pError->getErrorCode();
        my $sShortMessage = $pError->getShortMessage();
        my $sLongMessage = $pError->getLongMessage();
        print "\n";
        print "ErrorCode=$sErrorCode, ShortMessage=$sShortMessage\n";
 
        my @aErrorParameters = $pError->getErrorParameters();
        foreach my $pErrorParameter ( @aErrorParameters) {
            my $sParamID = $pErrorParameter->getParamID();
            my $sValue  = $pErrorParameter->getValue();
            print "\tParamID=$sParamID, Value=$sValue\n";
        }
        print "\n";
    }
} else {



    
	my $getACK = $pCall->getAck();
	
	print "update status: $getACK";
	
	my $pItem =  $pCall->getItem();
	
	my $sTitle = $pItem->getTitle();
    my $sSubTitle = $pItem->getSubTitle();
    my $sPrimaryCategoryId = $pItem->getPrimaryCategory()->getCategoryID();
    my $sPrimaryCategoryName = $pItem->getPrimaryCategory()->getCategoryName();
    my $sListingType = $pItem->getListingType();
	  my $sQuantity = $pItem->getQuantity();
    my $sStartPrice = $pItem->getStartPrice()->getValue();
    my $sCurrencyID = $pItem->getStartPrice()->getCurrencyID();  # code - like 'USD'
    my $sListingDuration = $pItem->getListingDuration();
	# payment methods
    my @aPaymentMethods = $pItem->getPaymentMethods();
    # foreach my $sPaymentMethod ( @aPaymentMethods) {
        #print "$sPaymentMethod\n";}
    # my $pSeller = $pItem->getSeller();   
                                         

        # additional listing info ( listing details )
    my $sTimeLeft = $pItem->getTimeLeft();
	
    my $pListingDetails = $pItem->getListingDetails();
    my $sStartTime = $pListingDetails->getStartTime();
    my $sEndTime = $pListingDetails->getEndTime();
    my $sConvertedBuyItNowPrice = $pListingDetails->getConvertedBuyItNowPrice()->getValue();
    my $sConvertedBuyItNowCurrencyID = $pListingDetails->getConvertedBuyItNowPrice()->getCurrencyID();

    my $sConvertedStartPrice = $pListingDetails->getConvertedStartPrice()->getValue();
    my $sConvertedStartPriceCurrencyID = $pListingDetails->getConvertedStartPrice()->getCurrencyID();

        # selling status
    my $pSellingStatus = $pItem->getSellingStatus();
    my $sListingStatus = $pSellingStatus->getListingStatus();

        # shipping options
    my @aShipToLocations = $pItem->getShipToLocations();
	
    my $pShippingDetails = $pItem->getShippingDetails();
    my @aShippingServiceOptions = $pShippingDetails->getShippingServiceOptions();
    foreach my $pShippingServiceOption (@aShippingServiceOptions) {
        my $sShippingService = $pShippingServiceOption->getShippingService();
    }

    my @aInternationalShippingServiceOptions = 
                    $pShippingDetails->getInternationalShippingServiceOption();
		    foreach my $pIntlShippingServiceOption (@aInternationalShippingServiceOptions) {
      my $sShippingService = $pIntlShippingServiceOption->getShippingService(); 
	  
	  }
	
	
	print "\n\n \t\t  Title:\t $sTitle \n
		Subtitle:\t $sSubTitle \n
		Primary Categorie ID:\t $sPrimaryCategoryId \n
		Categorie Name:\t $sPrimaryCategoryName \n
		Listing Type:\t $sListingType \n
		Quantity:\t $sQuantity \n
		Start Price:\t $sStartPrice \n
		Currency:\t $sCurrencyID \n
		Listing Duration:\t $sListingDuration \n\n";
		
		foreach my $sPaymentMethod (@aPaymentMethods) 
			{
				print "\t \t PaymentMethod: \t $sPaymentMethod \n";
			}
		
		
	print "\n\n \t\t  Time Left:\t $sTimeLeft \n
		Start Time:\t $sStartTime \n
		End Time:\t $sEndTime \n
		Listing Status:\t $sListingStatus  \n";
		
		
		

	  
	  
	  
	
	
	
	
	
}
	  
	  
	  
	  
	  
	  
