use strict;
use LWP::UserAgent;
use HTTP::Request;
use HTTP::Headers;

# define the HTTP header
my $objHeader = HTTP::Headers->new;
$objHeader->push_header('X-EBAY-API-COMPATIBILITY-LEVEL' => '881');
$objHeader->push_header('X-EBAY-API-DEV-NAME' => 'e68fceb1-b097-4926-8b1c-0c329db0fbf3');
$objHeader->push_header('X-EBAY-API-APP-NAME' => 'UWS796178-b2ca-4daf-bf42-dd1dbdb4842');
$objHeader->push_header('X-EBAY-API-CERT-NAME' => '7858eb24-b5b0-4030-9ccd-e6f3e91269ff');
$objHeader->push_header('X-EBAY-API-CALL-NAME' => 'AddItem');
$objHeader->push_header('X-EBAY-API-SITEID' => '15');
$objHeader->push_header('Content-Type' => 'text/xml');

# define the XML request
my $request =
    "<?xml version=\"1.0\" encoding=\"utf-8\"?>
<AddItemRequest xmlns=\"urn:ebay:apis:eBLBaseComponents\">
<ErrorLanguage>en_US</ErrorLanguage>
<WarningLevel>High</WarningLevel>
<Item>
<Title>Iphone Case test</Title>
<Description>this iphone case was used, but its still in new condition.</Description>
<PrimaryCategory><CategoryID>20349</CategoryID>
</PrimaryCategory>
<StartPrice>100.00</StartPrice>
<ConditionID>3000</ConditionID>
<CategoryMappingAllowed>true</CategoryMappingAllowed>
<Country>AU</Country>
<Currency>AUD</Currency>
<DispatchTimeMax>3</DispatchTimeMax>
<ListingDuration>Days_7</ListingDuration>
<ListingType>Chinese</ListingType>
<PaymentMethods>PayPal</PaymentMethods>
<PayPalEmailAddress>michael_mrmycool\@msn.com</PayPalEmailAddress>
<PictureDetails><PictureURL>http://i1.sandbox.ebayimg.com/03/i/00/6b/63/03_1.JPG?set_id=8800005007</PictureURL>
</PictureDetails>
<PostalCode>2170</PostalCode>
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
<ShippingServiceOptions>
  <ShippingServicePriority>1</ShippingServicePriority>
<ShippingService>AU_Express</ShippingService>
<ShippingServiceCost>10</ShippingServiceCost>
</ShippingServiceOptions>
</ShippingDetails>
<Site>US</Site>

</Item>
<RequesterCredentials>
<eBayAuthToken>AgAAAA**AQAAAA**aAAAAA**am/tUw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wNmYqpAJaLogWdj6x9nY+seQ**B2wCAA**AAMAAA**E9FZwUywJKCaHos1XgqtnKQsT+P2V2VJ4ARcYaIJ5Dw+Uyu7fCp3IMWgSbaf9/QMPgDBn6uNFH0ZUCWmSMgMhb2Kc1TFBiLvhEq0ULrMG4yctEFKGN2P2SwSfYNUhDCGH3ifQD/sZ6+pHca42g453x1PtpUokrsqVnqThgTM5OrO+NF+GR1z2s88PfbICr6cd9ep5otOJdLx+wg/jYp5WMVvkEI+F3EQihimMWL/9hRpTCEDyogXSbIb6gQUvpDRtVJwXN072oMVkBuVjgK5epWxN+vQ/J0ZSxbAhH7GFBsu5aLMghAmcV8W3Kip/xl65PTBhblEnI+O+X8mou3oNIvEwkADFZa1xWJBoDBMN1/+4rFWIQh+xjXhb1ncikS3Qt0RTvD+S4gMj0Jx7/P8sxtrI2jiEPwbHgZU6qEaSt3d6xVxeVWJsvqOQsOWpfyVIf/o3mIZnDD9UpO9Exx6gqIaWr9WdtGAqZAS8wsoXX3KMWqlFsZsJ14s97AtfA0zQsXopHydLcF/4dioHgwo8eA2CDlPe+5o6QtY1ZGEgTtpa0Mz4qBrGUigMqK0rnGShqkv4BwXacqRbZbvwlxX9CbuVErQots3FRMTPCE667uLUK2qn5y7XuBqil55zLO/ULqZ/TuWQqFyoHlmp7JZpeg9mZv8Z5Xs+ufFbk71QmolTSf0m1lKp4l2hhquiB071ZfS8rdKdMB0hw1p5HC+D8cwzpDIaiwOeOBwb4fhHoSujaticV0pcitxbBd8S8+z</eBayAuthToken>
</RequesterCredentials>
<WarningLevel>High</WarningLevel>
</AddItemRequest>​";

# make the call
my $objRequest = HTTP::Request->new(
  "POST",
  "https://api.ebay.com/ws/api.dll",
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