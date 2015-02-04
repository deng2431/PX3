################################################################################
    #
    # File: .......................... ebayAPI.pm
    #
    # Description...
    #
    # This module is strictly used for listing, update and delete items on eBay.
################################################################################




=pod

=head1 NAME

eBayAPI - An Simple Interface to XML::EBAY for listing, update and delete items on eBay.

=head1 INHERITANCE

All of the eBay API calls are inherits from the eBay::API::XML::BaseCall class

=head1 SYNOPSIS

	$object->new();
	
	$object->add_item();
	
	$object->find_categories(.....);

	$object->delete_item();
	
	$object->update_item();




=head1 DESCRIPTION




=head1 METHODS

=head2 new()

store eBay user credentials, compatibility levels and site ID

=over

=back

=cut









# Package Declaration
# ------------------------------------------------------------------------------
        package eBayAPI;

# Required Includes
# ------------------------------------------------------------------------------
        use strict;
        use warnings;
        use Data::Dumper;    #need to be removed once development is complete

        # module to convert variable to lower case
        use Hash::Case::Lower;

        # eBay API call class
        use eBay::API::XML::Call::AddItem;
        use eBay::API::XML::Call::ReviseItem;
        use eBay::API::XML::Call::VerifyAddItem;
        use eBay::API::XML::Call::GetSuggestedCategories;
        use eBay::API::XML::Call::EndItem;
		use eBay::API::XML::Call::GetItem;

        # Datatype class - it acts as a container for api call data
        use eBay::API::XML::DataType::ItemType;
        use eBay::API::XML::DataType::CategoryType;
        use eBay::API::XML::DataType::ShippingServiceOptionsType;
        use eBay::API::XML::DataType::PictureDetailsType;
        use eBay::API::XML::DataType::Enum::EndReasonCodeType;
		use eBay::API::XML::DataType::InternationalShippingServiceOptionsType;

# Variable Declarations
# ------------------------------------------------------------------------------
# Globals
        our $VERSION = "0.1";

        # store eBay user credentials, compatibility levels and site ID
        sub new {
			
            my $class = shift;

            my $self = {@_};
			
            bless( $self, $class );

            return $self;

        }

        # Assigning eBay user credentials
=head2 _account()

eBay user credentials get passed in and been assigned appropriate variables. Credentials is then been assorted to the appropriate objects. 

	    my $pCall = eBay::API::XML::Call::(AddItem,EndItem etc....)
		
			$pCall->setApiUrl($apiUrl);
            $pCall->setDevID($devID);
            $pCall->setAppID($appID);
            $pCall->setCertID($cerID);
            $pCall->setAuthToken($authToken);
            $pCall->setSiteID($siteID);
            $pCall->getCompatibilityLevel($complvl);



=cut
        sub _account {

            # Get all arguments passed in
            my ( $pCall, $self ) = @_;

			# Set local variables to strings been passed in to appropriate variables
            my $apiUrl    = $self->{apiUrl};
            my $devID     = $self->{devID};
            my $appID     = $self->{appID};
            my $cerID     = $self->{certID};
            my $authToken = $self->{authToken};
            my $siteID    = $self->{siteID};
            my $complvl   = $self->{complvl};

            # Set eBay user credentials to appropriate variable
            $pCall->setApiUrl($apiUrl);
            $pCall->setDevID($devID);
            $pCall->setAppID($appID);
            $pCall->setCertID($cerID);
            $pCall->setAuthToken($authToken);
            $pCall->setSiteID($siteID);
            $pCall->getCompatibilityLevel($complvl);

        }

		
		sub get_item_url{
	my $self = shift;

	my $query = {@_};
	
	my $itemid = $query->{id};
	
	 my $pCall = eBay::API::XML::Call::GetItem->new();
	
	_account( $pCall, $self  );
	
	$pCall->setItemID($itemid );

    $pCall->execute();

	my $item = $pCall->getItem()->getListingDetails->getViewItemURL;
	
	
 print Dumper($item);
	
}
		
        sub find_categories {

            my $self = shift;

            my $query = shift;

            my $pCall = eBay::API::XML::Call::GetSuggestedCategories->new();

            _account( $pCall, $self );

            $pCall->setQuery($query);

            $pCall->execute();

            my $count = $pCall->getCategoryCount();

            my @cat_array = $pCall->getSuggestedCategoryArray()->getSuggestedCategory();

            if (@cat_array) {
                foreach my $cat_array1 (@cat_array) {

                    my $cat_name = $cat_array1->getCategory()->getCategoryName;

                    my $cat_id = $cat_array1->getCategory()->getCategoryID;

                    push @{ $self->{categories} },
                      { cat_name => $cat_name, cat_id => $cat_id };

                }

                $self->{first_cat} = $cat_array[0]->getCategory()->getCategoryID;
            }
			
			return 171788;

        }

        sub list_categories {

            my $self = shift;

            if ( $self->{categories} ) {
                return $self->{categories};
            }
            else {
                return 0;
            }

        }

        sub first_category {

            my $self = shift;

            if ( $self->{first_cat} ) {
                return $self->{first_cat};
            }
            else {
                return 0;
            }

        }

        sub delete_item {

            my $self = shift;

            my $get_items = {@_};

            my %convert_LC;

            tie %convert_LC => 'Hash::Case::Lower' => \%$get_items;

            my $item_name = \%convert_LC;

            my $itemID     = $item_name->{itemid};
            my $end_reason = $item_name->{end_reason};

            my $pCall = eBay::API::XML::Call::EndItem->new();
            _account( $pCall, $self );

            $pCall->setItemID($itemID);
            $pCall->setEndingReason($end_reason);

            $pCall->execute();

            my $hasErrors = $pCall->hasErrors();

            if ($hasErrors) {

                my $raErrors = $pCall->getErrors();

                foreach my $pError (@$raErrors) {

                    my $sErrorCode    = $pError->getErrorCode();
                    my $sShortMessage = $pError->getShortMessage();
                    my $sLongMessage  = $pError->getLongMessage();

                    push @{ $self->{error} },
                      {
                        code          => $sErrorCode,
                        short_message => $sShortMessage,
                        long_message  => $sLongMessage
                      };
                }

                $self->{get_ack} = 0;

            }
            else {

                my $getACK = $pCall->getAck();

                $self->{get_ack} = 1;

            }

        }

        sub update_item {

            my $self = shift;

            my $get_items = {@_};


            # Converts the all hash keys(e.g. itemID to itemid) to lower cases

            my %convert_LC;

            tie %convert_LC => 'Hash::Case::Lower' => \%$get_items;

            my $item_name = \%convert_LC;

            my $optional_fields = [ 'title','description', 'startprice', 'quantity','conditioncode' ];

            my $method_map = {
				title =>'setTitle',
                description => 'setDescription',
                startprice  => 'setStartPrice',
                quantity    => 'setQuantity',
				conditioncode =>'setConditionID',
            };

            my $pItem = eBay::API::XML::DataType::ItemType->new();

            my $itemID = $item_name->{itemid};

            if ( defined $itemID ) {
                $pItem->setItemID($itemID);
            }
            else {
                return 0;
            }

            foreach my $field ( @{$optional_fields} ) {

                if ( exists $item_name->{$field} ) {
                    my $item_name = $item_name->{$field};
                    my $method    = $method_map->{$field};
                    $pItem->$method($item_name);


                }
            }

            my $getPicture  = $item_name->{pictureurl};
           

            my $image = eBay::API::XML::DataType::PictureDetailsType->new();

            if ( defined $getPicture ) {

                $image->setPictureURL( $getPicture);

            }

            my $thumbnail = $item_name->{setthumbnail};

            if ( defined $thumbnail ) {

                $image->setGalleryURL($getPicture);

            }

            if ( defined $thumbnail || defined $getPicture ) {

                $pItem->setPictureDetails($image);
            }
			
		


            my $pCall = eBay::API::XML::Call::ReviseItem->new();

            _account( $pCall, $self );

            $pCall->setItem($pItem);

            $pCall->execute();

            my $hasErrors = $pCall->hasErrors();

          

            if ($hasErrors) {

                my $raErrors = $pCall->getErrors();

                foreach my $pError (@$raErrors) {

                    my $sErrorCode    = $pError->getErrorCode();
                    my $sShortMessage = $pError->getShortMessage();
                    my $sLongMessage  = $pError->getLongMessage();


                    push @{ $self->{error} },
                      {
                        code          => $sErrorCode,
                        short_message => $sShortMessage,
                        long_message  => $sLongMessage
                      };
                }


                $self->{get_ack} = 0;

            }
            else {

                my $getACK = $pCall->getAck();

                $self->{get_ack} = 1;

            }

        }

        sub get_ack {

            my $self = shift;
            return $self->{get_ack} if exists $self->{get_ack};

        }

        sub error {

            my $self = shift;
            return $self->{error} if exists $self->{error};

        }

        sub add_item {

            my $self = shift;

            my $get_items = {@_};

            # Converts the all hash keys(e.g. itemID to itemid) to lower cases

            my %convert_LC;

            tie %convert_LC => 'Hash::Case::Lower' => \%$get_items;

            my $item_name = \%convert_LC;

            my $title                 = $item_name->{title};
            my $returnsAcceptedOption = $item_name->{returnsacceptedoption};
            my $refundOption          = $item_name->{refundoption};
            my $returnsWithinOption   = $item_name->{returnswithinoption};
            my $returnPolicyDetail    = $item_name->{returnPolicydetail};
            my $shippingCostPaidByOption =
              $item_name->{shippingcostpaidbyoption};
            my $shippingType            = $item_name->{shippingtype};
            my $shippingService         = $item_name->{shippingservice};
            my $shippingServiceCost     = $item_name->{Shippingservicecost};
            my $shippingServicePriority = $item_name->{shippingservicepriority};

            my $mandatory__fields = [
                'title',                    'startprice',
                'quantity',                 'description',
                'countrycode',              'currencycode',
                'listingduration',          'location',
                'postalcode',               'paymentmethod',
                'conditionid',              'dispatchtimemax',
                'listingtype',              'payPalemailaddress',
                'returnsacceptedoption',    'refundoption',
                'returnswithinoption',      'returnPolicydetail',
                'shippingcostpaidbyoption', 'shippingtype'
            ];

            my $method_map = {

                description        => 'setDescription',
                startprice         => 'setStartPrice',
                quantity           => 'setQuantity',
                title              => 'setTitle',
                countrycode        => 'setCountry',
                currencycode       => 'setCurrency',
                listingduration    => 'setListingDuration',
                location           => 'setLocation',
                postalcode         => 'setPostalCode',
                paymentmethod      => 'setPaymentMethods',
                conditionid        => 'setConditionID',
                dispatchtimemax    => 'setDispatchTimeMax',
                listingtype        => 'setListingType',
                payPalemailaddress => 'setPayPalEmailAddress',

            };

=pod
		returnsacceptedoption	=> "getReturnPolicy()->setReturnsAcceptedOption",
		refundoption	=> 'getReturnPolicy()->setRefundOption',
		returnswithinoption	=> 'getReturnPolicy()->setReturnsWithinOption',
		returnPolicydetail	=> 'getReturnPolicy()->setDescription',
		shippingcostpaidbyoption	=> 'getReturnPolicy()->setShippingCostPaidByOption',
		shippingtype	=> 'getShippingDetails()->setShippingType'
=cut

            my $pItem = eBay::API::XML::DataType::ItemType->new();

            foreach my $field ( @{$mandatory__fields} ) {

                die "MISSING $field" unless defined $item_name->{$field};

                my $item_name = $item_name->{$field};
                my $method    = $method_map->{$field};

                if ( defined $method ) {

                    $pItem->$method($item_name);
                }

            }

            $pItem->getReturnPolicy()
              ->setReturnsAcceptedOption($returnsAcceptedOption);
            $pItem->getReturnPolicy()->setRefundOption($refundOption);
            $pItem->getReturnPolicy()
              ->setReturnsWithinOption($returnsWithinOption);
            $pItem->getReturnPolicy()->setDescription($returnPolicyDetail);
            $pItem->getReturnPolicy()
              ->setShippingCostPaidByOption($shippingCostPaidByOption);
            $pItem->getShippingDetails()->setShippingType($shippingType);
			
			
			
			my $int_ship = eBay::API::XML::DataType::InternationalShippingServiceOptionsType->new();
			$int_ship -> setShipToLocation('Worldwide');
			$int_ship -> setShippingService('AU_ExpeditedInternational');
			$int_ship ->setShippingServiceCost('20.00');
			 # $int_ship ->setShippingServicePriority(0);
			$pItem->getShippingDetails()->setInternationalShippingServiceOption($int_ship);
			
			
			
            my $ship = eBay::API::XML::DataType::ShippingServiceOptionsType->new();
            $ship->setShippingService($shippingService);
            $ship->setShippingServiceCost($shippingServiceCost);
            $ship->setShippingServicePriority($shippingServicePriority);
            $pItem->getShippingDetails()->setShippingServiceOptions($ship);
			
			
			my $categoryID = 171788;
            # my $categoryID = find_categories( $title, $self );

            my $pCat = eBay::API::XML::DataType::CategoryType->new();
			
            $pCat->setCategoryID($categoryID);

            $pItem->setPrimaryCategory($pCat);

            my $getPicture = $item_name->{pictureurl};

            my $image = eBay::API::XML::DataType::PictureDetailsType->new();

            if ( defined $getPicture ) {

                $image->setPictureURL($getPicture);

            }

            my $thumbnail = $item_name->{setthumbnail};

            if ( defined $thumbnail ) {

                $image->setGalleryURL($getPicture);

            }

            if ( defined $thumbnail || defined $getPicture ) {

                $pItem->setPictureDetails($image);
            }

            my $pCall = eBay::API::XML::Call::AddItem->new();

            _account( $pCall, $self );

            $pCall->setItem($pItem);
            $pCall->execute();

            my $hasErrors = $pCall->hasErrors();

            if ($hasErrors) {

                my $raErrors = $pCall->getErrors();

                foreach my $pError (@$raErrors) {

                    my $sErrorCode    = $pError->getErrorCode();
                    my $sShortMessage = $pError->getShortMessage();
                    my $sLongMessage  = $pError->getLongMessage();


                    push @{ $self->{error} },
                      {
                        code          => $sErrorCode,
                        short_message => $sShortMessage,
                        long_message  => $sLongMessage
                      };
                }


                return 0;

            }
            else {

                my $sItemId = $pCall->getItemID()->getValue();

                return $self->{item_id} = $sItemId;

            }

        }

        sub get_item_id {
            my $self = shift;
            return $self->{item_id} if exists $self->{item_id};

        }

        # Return TRUE to Perl
        1;
