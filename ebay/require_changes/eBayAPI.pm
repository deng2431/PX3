package eBayAPI;
use strict;
use warnings;

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


# NOTE: AVOID GLOBAL VARIABLES
# my ($devID, $appID, $cerID, $apiUrl, $authToken, $siteID, $complvl);

# get ebay account details 

# NOTE: rename ebayAccount() to new()
sub new { 
	my $class = shift;
	my $self = {@_};
	bless($self, $class);
	return $self; # return the blessed object
}

# set the account details using the data retreived from ebayAccount();
# NOTE: renamed _account(). As a convension, could you please rename internal (non public) methods to use the "_" as a prefix?
# NOTE: Also, could you please use lower case method name with underscore to seperarte words if possible? 
sub _account {
	my ($pCall) = @_;
	$pCall->setApiUrl($apiUrl);
	$pCall->setDevID($devID);
	$pCall->setAppID($appID );
	$pCall->setCertID($cerID );
	$pCall->setAuthToken($authToken);
	$pCall->setSiteID($siteID); 
	$pCall->getCompatibilityLevel($complvl);		
}

# NOTE: rename addItem() to add_item()
sub add_item {
	my $self = shift; # this should be an object instance not class
	my $options = {@_};
	# Converts the all hash keys(e.g. itemID to itemid) to lower cases	
	# NOTE sure this lower case is neccessary in here, since the eBay API only takes upper case characters
	my %convert_LC;	
	tie %convert_LC => 'Hash::Case::Lower' => \%$options;
	my $lowered_options = \%convert_LC;
		
	# NOTE: excute_add_item() should returns the itemID;
	return excute_add_item($lowered_options);
}

# NOTE: renamed to excute_add_item()
sub excute_add_item {
	my $options = shift;

	my $missing = 0;
	my $mandatory_fields = ['title', 'startprice', 'quantity', 'description', 'countrycode', 'currencycode', 'listingduration', 'location', 'postalcode', 'paymentmethod', 'conditionid', 'dispatchtimemax', 'listingtype', 'payPalemailaddress', 'returnsacceptedoption', 'refundoption', 'returnswithinoption', 'returnPolicydetail', 'shippingcostpaidbyoption', 'shippingtype', 'shippingservice', 'Shippingservicecost', 'shippingservicepriority', 'categoryid'];

	foreach my $field (@{$mandatory_fields}) {
		$missing++ unless defined $options->{$field};
	}

	die 'mandatory fields missing' if $missing;

	my $title  =  $options->{title};
	my $startPrice  =  $options->{startprice};
	my $quantity  =  $options->{quantity};
	my $description  =  $options->{description};
	my $countryCode =  $options->{countrycode};
	my $currencyCode  =  $options->{currencycode};
	my $listingDuration  =  $options->{listingduration};
	my $location  =  $options->{location};
	my $postcode  =  $options->{postalcode};
	my $paymentMethod  =  $options->{paymentmethod};
	my $conditionID  =  $options->{conditionid};
	my $dispatchTimeMax  =  $options->{dispatchtimemax};
	my $listingType  =  $options->{listingtype};
	my $payPalEmailAddress  =  $options->{payPalemailaddress};
	my $returnsAcceptedOption  =  $options->{returnsacceptedoption};
	my $refundOption  =  $options->{refundoption};
	my $returnsWithinOption  =  $options->{returnswithinoption};
	my $returnPolicyDetail  =  $options->{returnPolicydetail};
	my $shippingCostPaidByOption  =  $options->{shippingcostpaidbyoption};
	my $shippingType  =  $options->{shippingtype};
	my $shippingService  =  $options->{shippingservice};
	my $shippingServiceCost  =  $options->{Shippingservicecost};
	my $shippingServicePriority  =  $options->{shippingservicepriority};
	my $categoryID  =  $options->{categoryid};




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
	

	_account($pCall);
		

 
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


		# NOTE SHOULD RETURN THE NEWLY CREATED ITEM ID
}


# NOTE: rename updateItem() to update_item()
sub update_item {
	my $self = shift; # this should be an object instance not class
	# Converts the all hash keys(e.g. itemID to itemid) to lower cases	
	my %convert_LC;
	tie %convert_LC => 'Hash::Case::Lower' => \%$self;
	excute_update_item(\%convert_LC);

}

# NOTE: renamed to:
sub excute_update_item {
	my $option = shift; # this is just options

	my $pItem = eBay::API::XML::DataType::ItemType->new();
	my $itemID =  $self->{itemid};

	if (defined $itemID) {
		$pItem ->setItemID($itemID);
	}
	else {
		die "Missing Item ID."; # <- print doesn't stop the program, just call die
	}


	my $Description =  $self->{description};		
	if(defined $Description) {
		$pItem->setDescription($Description);
	}	

	my $StartPrice =  $self->{startprice};
	if(defined $StartPrice) {
		$pItem->setStartPrice($StartPrice);
	}
	
	my $getPicture = $self->{pictureurl};
	if (defined $getPicture) {
		my $image = eBay::API::XML::DataType::PictureDetailsType->new();
		$image->setPictureURL($getPicture);
		$image->setGalleryURL($getPicture);
		$pItem->setPictureDetails($image);
	}
	
	my $pCall = eBay::API::XML::Call::ReviseItem->new();
 	_account($pCall);
	$pCall->setItem($pItem);
	$pCall->execute();
	  
	my $hasErrors = $pCall->hasErrors();
	print "\n\n\n \t *** Update eBay Item Listing *** ";
	
	if ($hasErrors) {
		my $raErrors = $pCall->getErrors();
		errorMsg($raErrors);
	}
	else {

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

# NOTE renamed
sub error {

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