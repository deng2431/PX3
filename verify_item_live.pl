 

use strict;

use eBay::API::XML::DataType::ItemType;
use eBay::API::XML::DataType::CategoryType;
use eBay::API::XML::Call::VerifyAddItem;

use eBay::API::XML::DataType::Enum::CountryCodeType;
use eBay::API::XML::DataType::Enum::CurrencyCodeType;
use eBay::API::XML::DataType::Enum::ListingDurationCodeType;
use eBay::API::XML::DataType::Enum::BuyerPaymentMethodCodeType;
use eBay::API::XML::DataType::Enum::ConditionSelectionCodeType;
 
 
 
 my $pCall = eBay::API::XML::Call::VerifyAddItem->new();
 
      	$pCall->setApiUrl('https://api.ebay.com/ws/api.dll');
	 $pCall->setDevID('e68fceb1-b097-4926-8b1c-0c329db0fbf3');
      $pCall->setAppID('UWS796178-b2ca-4daf-bf42-dd1dbdb4842');
      $pCall->setCertID('7858eb24-b5b0-4030-9ccd-e6f3e91269ff');
	  $pCall->setAuthToken('AgAAAA**AQAAAA**aAAAAA**vnj7Uw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wNmYqpAJaLogWdj6x9nY+seQ**B2wCAA**AAMAAA**E9FZwUywJKCaHos1XgqtnKQsT+P2V2VJ4ARcYaIJ5Dw+Uyu7fCp3IMWgSbaf9/QMPgDBn6uNFH0ZUCWmSMgMhb2Kc1TFBiLvhEq0ULrMG4yctEFKGN2P2SwSfYNUhDCGH3ifQD/sZ6+pHca42g453x1PtpUokrsqVnqThgTM5OrO+NF+GR1z2s88PfbICr6cd9ep5otOJdLx+wg/jYp5WMVvkEI+F3EQihimMWL/9hRpTCEDyogXSbIb6gQUvpDRtVJwXN072oMVkBuVjgK5epWxN+vQ/J0ZSxbAhH7GFBsu5aLMghAmcV8W3Kip/xl65PTBhblEnI+O+X8mou3oNIvEwkADFZa1xWJBoDBMN1/+4rFWIQh+xjXhb1ncikS3Qt0RTvD+S4gMj0Jx7/P8sxtrI2jiEPwbHgZU6qEaSt3d6xVxeVWJsvqOQsOWpfyVIf/o3mIZnDD9UpO9Exx6gqIaWr9WdtGAqZAS8wsoXX3KMWqlFsZsJ14s97AtfA0zQsXopHydLcF/4dioHgwo8eA2CDlPe+5o6QtY1ZGEgTtpa0Mz4qBrGUigMqK0rnGShqkv4BwXacqRbZbvwlxX9CbuVErQots3FRMTPCE667uLUK2qn5y7XuBqil55zLO/ULqZ/TuWQqFyoHlmp7JZpeg9mZv8Z5Xs+ufFbk71QmolTSf0m1lKp4l2hhquiB071ZfS8rdKdMB0hw1p5HC+D8cwzpDIaiwOeOBwb4fhHoSujaticV0pcitxbBd8S8+z');
	  $pCall->setSiteID(15); 
	  $pCall->getCompatibilityLevel(871);
	  
	   
	
my $sCountryCode  = eBay::API::XML::DataType::Enum::CountryCodeType::AU;
my $sCurrencyCode = eBay::API::XML::DataType::Enum::CurrencyCodeType::AUD;
	
	
	
	
	
	my $pItem = eBay::API::XML::DataType::ItemType->new();
	$pItem->setCountry($sCountryCode);
	$pItem->setCurrency($sCurrencyCode);
	$pItem->setDescription('NewSchema item description');
	$pItem->setListingDuration(eBay::API::XML::DataType::Enum::ListingDurationCodeType::Days_7);
	$pItem->setLocation('San Jose, CA');
	$pItem->setPaymentMethods(eBay::API::XML::DataType::Enum::BuyerPaymentMethodCodeType::PersonalCheck);
	$pItem->setQuantity(1);
	$pItem->setListingDuration('Days_7');
    $pItem->setLocation('Liverpool');
	$pItem->setPaymentMethods('PayPal');
	$pItem->setPayPalEmailAddress('michael_mrmycool@msn.com');
	$pItem->setDispatchTimeMax(3);
	$pItem->setStartPrice(1.0);
	$pItem->setTitle('Harry Potter and the Philosopher test22222');
	$pItem->getReturnPolicy()->setReturnsAcceptedOption('ReturnsAccepted');
	  $pItem->getReturnPolicy()->setRefundOption('MoneyBack');
	  $pItem->getReturnPolicy()->setReturnsWithinOption('Days_30');
	  $pItem->getReturnPolicy()->setDescription('This is the first book in the Harry Potter series. In excellent condition!');
	  $pItem->getReturnPolicy()->setShippingCostPaidByOption('Buyer');
	  $pItem->getShippingDetails()->setShippingType('Flat');
	   
	   
	   my $ship = eBay::API::XML::DataType::ShippingServiceOptionsType->new();
	  $ship->setShippingService('AU_Express');
	  $ship->setShippingServiceCost(2.50);
	   $ship->setShippingServicePriority(1);
	   $pItem->getShippingDetails()->setShippingServiceOptions($ship);
	  
	  $pItem->setConditionID(1000);
	  
	  

	my $pCat = eBay::API::XML::DataType::CategoryType->new();
	$pCat->setCategoryID(377);  
	$pItem->setPrimaryCategory($pCat);
		
	
	 
	 $pCall->setItem($pItem);
	 
	 
	 
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

    my $sItemId = $pCall->getItemID()->getValue();
    print "sItemId=$sItemId\n";

    my @aFees = $pCall->getResponseDataType()->getFees()->getFee();
    foreach my $pFee (@aFees) {
        my $sFeeName = $pFee->getName();
        my $sFeeValue = $pFee->getFee()->getValue();
        my $sFeeCurrencyID = $pFee->getFee()->getCurrencyID();
        if ($sFeeValue > 0 ) {
            print "$sFeeName = $sFeeValue ($sFeeCurrencyID)\n";
        }
    }
}
	  
	  
	  
	  
	  
	  
=pod	  
	  my $endTime = $pCall->getEndTime();
	 
	 my $hi = $pCall->getResponseRawXml();
	 
 
  print $endTime."\n\n\n";

	 
	 print $hi . "\n";
=end