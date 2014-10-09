

package ebayAPI;
use strict;
use warnings;
use lib "main_api";
use Hash::Case::Lower;

 use eBay::API::XML::Call::AddItem;
# revise item calls
use  eBay::API::XML::Call::ReviseItem;
# Verify Add item call
use eBay::API::XML::Call::VerifyAddItem;


use eBay::API::XML::DataType::ItemType;
use eBay::API::XML::DataType::CategoryType;
use eBay::API::XML::DataType::ShippingServiceOptionsType;

use eBay::API::XML::DataType::PictureDetailsType;


	our $VERSION = "0.1";


	my ($devID, $appID, $cerID, $apiUrl, $authToken, $siteID, $complvl);

# get ebay account details 
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

# set the account details using the data retreived from ebayAccount();
sub setEbayAccount{


		my ($pCall) = @_;

			$pCall->setApiUrl($apiUrl);
			$pCall->setDevID($devID);
			$pCall->setAppID($appID );
			$pCall->setCertID($cerID );
			$pCall->setAuthToken($authToken);
			$pCall->setSiteID($siteID); 
			$pCall->getCompatibilityLevel($complvl);

			
}
	
	
	
sub addItem{

		my $class = shift;

		my $self = {@_};

		# bless($self, $class);
		
	# Converts the all hash keys(e.g. itemID to itemid) to lower cases	
	
		my %convert_LC;
		
		tie %convert_LC => 'Hash::Case::Lower' => \%$self;
		
		my $itemName_lower = \%convert_LC;
		
		excute_addItem($itemName_lower);

	}
	
	
	
sub updateItem{

		my $class = shift;

		my $self = {@_};

		# bless($self, $class);

		# return $self;

	# Converts the all hash keys(e.g. itemID to itemid) to lower cases	
	
		my %convert_LC;
		
		tie %convert_LC => 'Hash::Case::Lower' => \%$self;
		
		my $itemName_lower = \%convert_LC;
		
		excute_updateItem($itemName_lower);

	}



sub excute_updateItem{

		my $self = shift;

		my $pItem = eBay::API::XML::DataType::ItemType->new();

		
			my $itemID =  $self->{itemid};

				if(defined $itemID)
				{
					$pItem ->setItemID($itemID);
				}else{
					print "Missing Item ID.";
				}


			my $Description =  $self->{description};
					
				if(defined $Description)
				{
					$pItem ->setDescription($Description);
				}	


			my $StartPrice =  $self->{startprice};

				if(defined $StartPrice)
				{

						$pItem ->setStartPrice($StartPrice);
				}
				
			my $getPicture = $self->{pictureurl};
			my $getPicture1 = $self->{pictureurl1};
			
			if(defined $getPicture){
			
				my $image = eBay::API::XML::DataType::PictureDetailsType->new();
				$image->setPictureURL($getPicture);
				$image->setPictureURL($getPicture1);
				$image->setGalleryURL($getPicture);
				
		
	
				$pItem->setPictureDetails($image);

			}
			
		 my $pCall =  eBay::API::XML::Call::ReviseItem->new();
		 
		 
		 setEbayAccount($pCall);
		

		 
		
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
				
				my @warning = $pCall->getWarnings;
				
					my $warningCount = 1;
				
						foreach my $warnList (@warning) {
							my $sLongMessage = $warnList->getLongMessage();
							
							print "\t Warning $warningCount: \t $sLongMessage \n\n\n";
				
								$warningCount +=1;
						}
				
			}

	}

	
	
	
sub excute_addItem{
	
	my $self = shift;

		my $title  =  $self->{title};
		my $startPrice  =  $self->{startprice};
		my $quantity  =  $self->{quantity};
		my $description  =  $self->{description};
		my $countryCode =  $self->{countrycode};
		my $currencyCode  =  $self->{currencycode};
		my $listingDuration  =  $self->{listingduration};
		my $location  =  $self->{location};
		my $postcode  =  $self->{postalcode};
		my $paymentMethod  =  $self->{paymentmethod};
		my $conditionID  =  $self->{conditionid};
		my $dispatchTimeMax  =  $self->{dispatchtimemax};
		my $listingType  =  $self->{listingtype};
		my $payPalEmailAddress  =  $self->{payPalemailaddress};
		my $returnsAcceptedOption  =  $self->{returnsacceptedoption};
		my $refundOption  =  $self->{refundoption};
		my $returnsWithinOption  =  $self->{returnswithinoption};
		my $returnPolicyDetail  =  $self->{returnPolicydetail};
		my $shippingCostPaidByOption  =  $self->{shippingcostpaidbyoption};
		my $shippingType  =  $self->{shippingtype};
		my $shippingService  =  $self->{shippingservice};
		my $shippingServiceCost  =  $self->{Shippingservicecost};
		my $shippingServicePriority  =  $self->{shippingservicepriority};
		my $categoryID  =  $self->{categoryid};
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
		
		my $image = eBay::API::XML::DataType::PictureDetailsType->new();
		$image->setPictureURL("http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg");
		
	
		$pItem->setPictureDetails($image);

		my $pCall = eBay::API::XML::Call::AddItem->new();
		

		setEbayAccount($pCall);
			
	
	 
			$pCall->setItem($pItem);
	 
	
			$pCall->execute();
	  
	  
	  
			my $hasErrors = $pCall->hasErrors();
	  
	  
	  		print "\n\n\n \t \t *** eBay Item Listing *** ";
		
			if ($hasErrors) {
				
				
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
				
				my @warning = $pCall->getWarnings;
				
				my $warningCount = 1;
				
				foreach my $warnList (@warning) {
				
				my $sLongMessage = $warnList->getLongMessage();
				
				print "\t Warning $warningCount: \t $sLongMessage \n\n\n";
				
				$warningCount +=1;
				
				}
				
				
			}
	
	}
	
	
	

	sub errorMsg{
	
		my ($errorList) = @_;
			
			print "\n\n \t \t --Error Occured--";
			
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