 use strict;
 use eBay::API::XML::Call::GetCategories;
 use eBay::API::XML::DataType::Enum::DetailLevelCodeType;

 
 
  my $pCall = eBay::API::XML::Call::GetCategories->new(
  );
     $pCall->setApiUrl('https://api.ebay.com/ws/api.dll');
	 $pCall->setDevID('e68fceb1-b097-4926-8b1c-0c329db0fbf3');
      $pCall->setAppID('UWS796178-b2ca-4daf-bf42-dd1dbdb484');
      $pCall->setCertID('7858eb24-b5b0-4030-9ccd-e6f3e91269ff');
	  $pCall->setAuthToken('AgAAAA**AQAAAA**aAAAAA**vnj7Uw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wNmYqpAJaLogWdj6x9nY+seQ**B2wCAA**AAMAAA**E9FZwUywJKCaHos1XgqtnKQsT+P2V2VJ4ARcYaIJ5Dw+Uyu7fCp3IMWgSbaf9/QMPgDBn6uNFH0ZUCWmSMgMhb2Kc1TFBiLvhEq0ULrMG4yctEFKGN2P2SwSfYNUhDCGH3ifQD/sZ6+pHca42g453x1PtpUokrsqVnqThgTM5OrO+NF+GR1z2s88PfbICr6cd9ep5otOJdLx+wg/jYp5WMVvkEI+F3EQihimMWL/9hRpTCEDyogXSbIb6gQUvpDRtVJwXN072oMVkBuVjgK5epWxN+vQ/J0ZSxbAhH7GFBsu5aLMghAmcV8W3Kip/xl65PTBhblEnI+O+X8mou3oNIvEwkADFZa1xWJBoDBMN1/+4rFWIQh+xjXhb1ncikS3Qt0RTvD+S4gMj0Jx7/P8sxtrI2jiEPwbHgZU6qEaSt3d6xVxeVWJsvqOQsOWpfyVIf/o3mIZnDD9UpO9Exx6gqIaWr9WdtGAqZAS8wsoXX3KMWqlFsZsJ14s97AtfA0zQsXopHydLcF/4dioHgwo8eA2CDlPe+5o6QtY1ZGEgTtpa0Mz4qBrGUigMqK0rnGShqkv4BwXacqRbZbvwlxX9CbuVErQots3FRMTPCE667uLUK2qn5y7XuBqil55zLO/ULqZ/TuWQqFyoHlmp7JZpeg9mZv8Z5Xs+ufFbk71QmolTSf0m1lKp4l2hhquiB071ZfS8rdKdMB0hw1p5HC+D8cwzpDIaiwOeOBwb4fhHoSujaticV0pcitxbBd8S8+z');
	  $pCall->setSiteID(0); 
	  $pCall->getCompatibilityLevel(871);

      #$pCall->setErrLang('en_US');
	 
	 $pCall->setCategorySiteID(0);
	 $pCall->setLevelLimit(2);
	 $pCall->setDetailLevel( [eBay::API::XML::DataType::Enum::DetailLevelCodeType::ReturnAll] );
	 $pCall->setViewAllNodes('true');
	 
	 
	  $pCall->execute();
	 

	 
  # my $sOfficialTime = $pCall->getResponseRawXml();
  
  my $sOfficialTime = $pCall->getResponseRawXml();
  
	 # print $sOfficialTime . "\n";
	 
	 
	 my $checkAck = $pCall->getAck();
	 
	 if($checkAck eq "Success"){
	 
	 print "CatTree_top_level.xml has been updated with new Categories";
	 
open (MYFILE, '>CatTree_top_level.xml'); print MYFILE $sOfficialTime; close (MYFILE); 
	 
	 }
	 elsif($checkAck eq "Failure") 
	 {
	 print "Unsuccess";
	 }
	 
 #print  $pCall->getApiCallName();