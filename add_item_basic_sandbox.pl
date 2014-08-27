use strict;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Headers;

# define the HTTP header
my $objHeader = HTTP::Headers->new;
$objHeader->push_header('X-EBAY-API-COMPATIBILITY-LEVEL' => '881');
$objHeader->push_header('X-EBAY-API-DEV-NAME' => 'e68fceb1-b097-4926-8b1c-0c329db0fbf3');
$objHeader->push_header('X-EBAY-API-APP-NAME' => 'UWSe69eee-be2d-4fe7-8713-454877ee8ba');
$objHeader->push_header('X-EBAY-API-CERT-NAME' => '844301e5-a4bf-427d-866a-66d844749b8e');
$objHeader->push_header('X-EBAY-API-CALL-NAME' => 'AddItem');
$objHeader->push_header('X-EBAY-API-SITEID' => '0');
$objHeader->push_header('Content-Type' => 'text/xml');

# define the XML request
my $request =
    "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<AddItemRequest xmlns=\"urn:ebay:apis:eBLBaseComponents\">
<ErrorLanguage>en_US</ErrorLanguage>
<WarningLevel>High</WarningLevel>
<Item>
<Title>Harry Potter and the Philosopher's Stone testings112</Title>
<Description>This is the first book in the Harry Potter series. In excellent condition!</Description>
<PrimaryCategory><CategoryID>377</CategoryID>
</PrimaryCategory>
<StartPrice>1.00</StartPrice>
<ConditionID>3000</ConditionID>
<CategoryMappingAllowed>true</CategoryMappingAllowed>
<Country>US</Country>
<Currency>USD</Currency>
<DispatchTimeMax>3</DispatchTimeMax>
<ListingDuration>Days_7</ListingDuration>
<ListingType>Chinese</ListingType>
<PaymentMethods>PayPal</PaymentMethods>
<PayPalEmailAddress>test_deng2431\@gmail.com</PayPalEmailAddress>
<PictureDetails><PictureURL>http://i1.sandbox.ebayimg.com/03/i/00/6b/63/03_1.JPG?set_id=8800005007</PictureURL>
</PictureDetails>
<PostalCode>95125</PostalCode>
<Quantity>1</Quantity>
<ReturnPolicy><ReturnsAcceptedOption>ReturnsAccepted</ReturnsAcceptedOption>
<RefundOption>MoneyBack</RefundOption>
<ReturnsWithinOption>Days_30</ReturnsWithinOption>
<Description>
            This is the first book in the Harry Potter series. In excellent condition!
          </Description>
<ShippingCostPaidByOption>Buyer</ShippingCostPaidByOption>
</ReturnPolicy>
<ShippingDetails><ShippingType>Flat</ShippingType>
<ShippingServiceOptions><ShippingServicePriority>1</ShippingServicePriority>
<ShippingService>USPSMedia</ShippingService>
<ShippingServiceCost>
              2.50
            </ShippingServiceCost>
</ShippingServiceOptions>
</ShippingDetails>
<Site>US</Site>

</Item>
<RequesterCredentials>
<eBayAuthToken>AgAAAA**AQAAAA**aAAAAA**2LPtUw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wFk4GhDJaBow2dj6x9nY+seQ**uPoCAA**AAMAAA**y7ZMPcpVV5MEZ8MJNmS/hOQ3CScJYvZs58z5K/csyCXEBTWU2lfNfMaLcNwgVCew0GCRyWzYJemZM8jOKUCZusnI/q/dqUquP0StfJF0LWqx5iEjv2WOrIRtgcwyhaZoszCYbWGiSnQ3CrzKZ4SWMeU+ovLBWgNSD9glXn/JwDPd1ewzgWFkEm0QSrbdcJqe1Gy9t4WWdgzPU1xcjDXAkOYrC5PmWm0TjaAufq9Ek1WgHqNPBjlagYLhjC3zBwz6bgzsbIyuxY6qPuQl7REkV1TEfn7StGjPCS/4/jBYejn/7y6HZixup5MqYKSUd7ZhJNYkmH0rPUNpnwYJX5lKgHnP4w6neoeJTNUldHQo3eDeOYYotXCkKqnKNzn/jHiyWt4O8OQrWQP4Vna2cY57oobDrwfX9M5U9zf/1J28aKl4/f2pO++9DZVE8HAKwwyh6xRMN3rm4/rrZtlJwYeEkWZjyevExgD0TSwzmsxnMtWaml4DacRMwGUxJ1yVzVT6PUJ/+2a7M0IRBUm0g7QG5caoq8VCuQnoWNw2SMHyMLjro8Bou6PLAtb1qyUPyb4PgCNyqddM4LSE1IO9eucU0nlU9z+ftrvDSqS1/2IhZXybvdIa0E2PJ7zbpz2efPQG71j5lf7oICQtmm8VHKJvG0TezgsRDgrfZs8k7zWnAr/0G5oko+H8liGP2BIF5UruDuTiFD+Cf/X2+9W7/gDebeI670KkrZiBT7/ug9HbBHZX49F79HsbhD5xyFIZibn4</eBayAuthToken>
</RequesterCredentials>
<WarningLevel>High</WarningLevel>
</AddItemRequest>?";

# make the call
my $objRequest = HTTP::Request->new(
  "POST",
  "https://api.sandbox.ebay.com/ws/api.dll",
  $objHeader,
  $request
);

# deal with the response
my $objUserAgent = LWP::UserAgent->new;
my $objResponse = $objUserAgent->request($objRequest);
if (!$objResponse->is_error) {
  print $objResponse->content;
}
else {
  print $objResponse->error_as_HTML;
}

# This is Rons COmment
