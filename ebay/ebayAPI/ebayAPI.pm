

package ebayAPI;
use strict ;
use warnings;
 use eBay::API::XML::Call::AddItem;
# revise item calls
use  eBay::API::XML::Call::ReviseItem;
# Verify Add item call
use eBay::API::XML::Call::VerifyAddItem;


use eBay::API::XML::DataType::ItemType;
use eBay::API::XML::DataType::CategoryType;
use eBay::API::XML::DataType::ShippingServiceOptionsType;


	our $VERSION = "0.1";


	my ($devID, $appID, $cerID, $apiUrl, $authToken, $siteID, $complvl);


sub ebayAccount{

		my $class = shift;

		my $self = {@_};

		bless($self, $class);

			$apiUrl =  $self->{apiUrl};
			$devID  =  $self->{devID};
			$appID =  $self->{appID};
			$cerID =  $self->{certID};
			$authToken =  $self->{authToken};
			$siteID =  $self->{siteID};
			$complvl =  $self->{complvl};

	}


sub addItem{

		my $class = shift;

		my $self = {@_};

		bless($self, $class);

		excute_addItem($self);

	}
	
	
	
sub updateItem{

		my $class = shift;

		my $self = {@_};

		bless($self, $class);

		# return $self;

		
		excute_updateItem($self);

	}



sub excute_updateItem{

		my $self = shift;

		my $pItem = eBay::API::XML::DataType::ItemType->new();

		
			my $itemID =  $self->{itemID};

				if(defined $itemID)
				{
					$pItem ->setItemID($itemID);
				}else{
					print "Missing Item ID.";
				}


			my $Description =  $self->{Description};
					
				if(defined $Description)
				{
					$pItem ->setDescription($Description);
				}	


			my $StartPrice =  $self->{StartPrice};

				if(defined $StartPrice)
				{

						$pItem ->setStartPrice($StartPrice);
				}


			
		 my $pCall =  eBay::API::XML::Call::ReviseItem->new();
		 
		 
			$pCall->setApiUrl($apiUrl);
			$pCall->setDevID($devID);
			$pCall->setAppID($appID );
			$pCall->setCertID($cerID );
			$pCall->setAuthToken($authToken);
			$pCall->setSiteID($siteID); 
			$pCall->getCompatibilityLevel($complvl);
			 
		 
		
		 $pCall->setItem($pItem);
		
		  $pCall->execute();
		  
		  


		my $hasErrors = $pCall->hasErrors();
		
		print "\n\n\n \t *** Update eBay Item Listing *** ";
		
			if ($hasErrors) {
				
			my $raErrors = $pCall->getErrors();
				
				errorMsg($raErrors);
		
			} else {

				my $sItemId = $pCall->getItemID()->getValue();
				print "\n\n\n";
				print "\t Item ID: \t \t $sItemId \n";
				
				my $getACK = $pCall->getAck();
		
				print "\t Update status: \t $getACK \n";
				
				my $totalFee;
				
				my @aFees = $pCall->getResponseDataType()->getFees()->getFee();
					foreach my $pFee (@aFees) {
						my $sFeeName = $pFee->getName();
						my $sFeeValue = $pFee->getFee()->getValue();
						my $sFeeCurrencyID = $pFee->getFee()->getCurrencyID();
						
						$totalFee += $sFeeValue;
						
						if ($sFeeValue > 0 ) {
							print "\n";
							print "\t $sFeeName: \t $sFeeValue ($sFeeCurrencyID) \n";
						}
					}
						if($totalFee == 0){
							print "\t Updating Item Fee: \t 0 \n";
							print "\n\n\n";
						}
				
				
			}

	}

	
	
	
sub excute_addItem{
	
	my $self = shift;

		my $title  =  $self->{title};
		my $startPrice  =  $self->{startPrice};
		my $quantity  =  $self->{quantity};
		my $description  =  $self->{description};
		my $countryCode =  $self->{countryCode};
		my $currencyCode  =  $self->{currencyCode};
		my $listingDuration  =  $self->{listingDuration};
		my $location  =  $self->{location};
		my $postcode  =  $self->{postalCode};
		my $paymentMethod  =  $self->{paymentMethod};
		my $conditionID  =  $self->{conditionID};
		my $dispatchTimeMax  =  $self->{dispatchTimeMax};
		my $listingType  =  $self->{listingType};
		my $payPalEmailAddress  =  $self->{payPalEmailAddress};
		my $returnsAcceptedOption  =  $self->{returnsAcceptedOption};
		my $refundOption  =  $self->{refundOption};
		my $returnsWithinOption  =  $self->{returnsWithinOption};
		my $returnPolicyDetail  =  $self->{returnPolicyDetail};
		my $shippingCostPaidByOption  =  $self->{shippingCostPaidByOption};
		my $shippingType  =  $self->{shippingType};
		my $shippingService  =  $self->{shippingService};
		my $shippingServiceCost  =  $self->{ShippingServiceCost};
		my $shippingServicePriority  =  $self->{shippingServicePriority};
		my $categoryID  =  $self->{categoryID};
		# my $  =  $self->{};

		

	
		my $pItem = eBay::API::XML::DataType::ItemType->new();
		$pItem->setCountry($countryCode);
		$pItem->setCurrency($currencyCode);
		$pItem->setDescription($description);
		$pItem->setListingDuration($listingDuration);
		$pItem->setLocation($location);
		$pItem->setPaymentMethods($paymentMethod);
		$pItem->setQuantity($quantity);
		$pItem->getStartPrice()->setValue($startPrice);
		$pItem->setTitle($title);
		$pItem->setConditionID($conditionID );
		$pItem->setDispatchTimeMax($dispatchTimeMax);
		$pItem->setListingType($listingType);
		$pItem->setPayPalEmailAddress($payPalEmailAddress);
		$pItem->setPostalCode($postcode);
		$pItem->getReturnPolicy()->setReturnsAcceptedOption($returnsAcceptedOption);
		$pItem->getReturnPolicy()->setRefundOption($refundOption);
		$pItem->getReturnPolicy()->setReturnsWithinOption($returnsWithinOption);
		$pItem->getReturnPolicy()->setDescription($returnPolicyDetail);
		$pItem->getReturnPolicy()->setShippingCostPaidByOption($shippingCostPaidByOption);
		$pItem->getShippingDetails()->setShippingType($shippingType);
	  
		my $ship = eBay::API::XML::DataType::ShippingServiceOptionsType->new();
			$ship->setShippingService($shippingService);
			$ship->setShippingServiceCost($shippingServiceCost);
			$ship->setShippingServicePriority($shippingServicePriority);
	   $pItem->getShippingDetails()->setShippingServiceOptions($ship);

		my $pCat = eBay::API::XML::DataType::CategoryType->new();
			$pCat->setCategoryID($categoryID);
		$pItem->setPrimaryCategory($pCat);
	

		my $pCall = eBay::API::XML::Call::AddItem->new();
		
			$pCall->setApiUrl($apiUrl);
			$pCall->setDevID($devID);
			$pCall->setAppID($appID );
			$pCall->setCertID($cerID );
			$pCall->setAuthToken($authToken);
			$pCall->setSiteID($siteID); 
			$pCall->getCompatibilityLevel($complvl);
			
	
	 
			$pCall->setItem($pItem);
	 
	
			$pCall->execute();
	  
	  
	  
			my $hasErrors = $pCall->hasErrors();
	  
	  
	  		print "\n\n\n \t \t *** eBay Item Listing *** ";
		
			if ($hasErrors) {
				print "\n\n \t \t --Error Occured--";
				
			my $raErrors = $pCall->getErrors();
				
				errorMsg($raErrors);
		
			} else {

				my $sItemId = $pCall->getItemID()->getValue();
				print "\n\n\n";
				print "\t Item ID: \t \t $sItemId \n";
				
				my $getACK = $pCall->getAck();
		
				print "\t Listing status: \t $getACK \n";
				
				my $totalFee;
				
				my @aFees = $pCall->getResponseDataType()->getFees()->getFee();
					foreach my $pFee (@aFees) {
						my $sFeeName = $pFee->getName();
						my $sFeeValue = $pFee->getFee()->getValue();
						my $sFeeCurrencyID = $pFee->getFee()->getCurrencyID();
						
						$totalFee += $sFeeValue;
						
						if ($sFeeValue > 0 ) {
							print "\n";
							print "\t $sFeeName: \t $sFeeValue ($sFeeCurrencyID) \n";
						}
					}
						if($totalFee == 0){
							print "\t Listing Item Fee: \t 0 \n";
							print "\n\n\n";
						}
				
				
			}
	
	}
	
	
	

	sub errorMsg{
	
		my ($errorList) = @_;
			
				foreach my $pError ( @$errorList ) {

					my $sErrorCode = $pError->getErrorCode();
					my $sShortMessage = $pError->getShortMessage();
					my $sLongMessage = $pError->getLongMessage();
					print "\n\n";
					print "\t ErrorCode: \t $sErrorCode \n \t Error Message:  $sShortMessage\n";
			 
					my @aErrorParameters = $pError->getErrorParameters();
					foreach my $pErrorParameter ( @aErrorParameters) {
						my $sParamID = $pErrorParameter->getParamID();
						my $sValue  = $pErrorParameter->getValue();
						print "\t ParamID: \t $sParamID \n \t Value: \t $sValue\n";
					}
					print "\n \n";
					
					
				}
	
	
		
	
	}
	
	1;