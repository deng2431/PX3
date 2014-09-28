 
 use eBay::API::XML::Call::UploadSiteHostedPictures;
use strict;

 use MIME::Base64;
  use MIME::Lite;
 use eBay::API::XML::Call::UploadSiteHostedPictures::UploadSiteHostedPicturesRequestType;
 
 
  my $pCall = eBay::API::XML::Call::UploadSiteHostedPictures->new(
  );
     $pCall->setApiUrl('https://api.ebay.com/ws/api.dll');
	 $pCall->setDevID('UWS796178-b2ca-4daf-bf42-dd1dbdb4842');
      $pCall->setAppID('e68fceb1-b097-4926-8b1c-0c329db0fbf3');
      $pCall->setCertID('7858eb24-b5b0-4030-9ccd-e6f3e91269ff');
	  $pCall->setAuthToken('AgAAAA**AQAAAA**aAAAAA**vnj7Uw**nY+sHZ2PrBmdj6wVnY+sEZ2PrA2dj6wNmYqpAJaLogWdj6x9nY+seQ**B2wCAA**AAMAAA**E9FZwUywJKCaHos1XgqtnKQsT+P2V2VJ4ARcYaIJ5Dw+Uyu7fCp3IMWgSbaf9/QMPgDBn6uNFH0ZUCWmSMgMhb2Kc1TFBiLvhEq0ULrMG4yctEFKGN2P2SwSfYNUhDCGH3ifQD/sZ6+pHca42g453x1PtpUokrsqVnqThgTM5OrO+NF+GR1z2s88PfbICr6cd9ep5otOJdLx+wg/jYp5WMVvkEI+F3EQihimMWL/9hRpTCEDyogXSbIb6gQUvpDRtVJwXN072oMVkBuVjgK5epWxN+vQ/J0ZSxbAhH7GFBsu5aLMghAmcV8W3Kip/xl65PTBhblEnI+O+X8mou3oNIvEwkADFZa1xWJBoDBMN1/+4rFWIQh+xjXhb1ncikS3Qt0RTvD+S4gMj0Jx7/P8sxtrI2jiEPwbHgZU6qEaSt3d6xVxeVWJsvqOQsOWpfyVIf/o3mIZnDD9UpO9Exx6gqIaWr9WdtGAqZAS8wsoXX3KMWqlFsZsJ14s97AtfA0zQsXopHydLcF/4dioHgwo8eA2CDlPe+5o6QtY1ZGEgTtpa0Mz4qBrGUigMqK0rnGShqkv4BwXacqRbZbvwlxX9CbuVErQots3FRMTPCE667uLUK2qn5y7XuBqil55zLO/ULqZ/TuWQqFyoHlmp7JZpeg9mZv8Z5Xs+ufFbk71QmolTSf0m1lKp4l2hhquiB071ZfS8rdKdMB0hw1p5HC+D8cwzpDIaiwOeOBwb4fhHoSujaticV0pcitxbBd8S8+z');
	  $pCall->setSiteID(0); 
	  $pCall->getCompatibilityLevel(871);
	  
	  
	  
	  my $my_file_gif = "haha.jpg";
	  

	  open (IMAGE, $my_file_gif)or die "$!";

	  
	  my $raw_string = do{ local $/ = undef; <IMAGE>; };
	  
   my $encoded = encode_base64($raw_string);
	
	
	close (IMAGE);
	
	  
=pod	  
	  my $ent = build MIME::Entity
  Type        => "image/jpg",
  Encoding    => "binary",
  Path        => "$my_file_gif ",
  Filename    => "saveme.jpg",
  Disposition => "form-data";

	  
	  
=cut
	 
	  my $msg = MIME::Lite->new ()or die "Error creating multipart container: $!\n";
	  $msg->attach (
  Type        => "application/octet-stream",
  Encoding    => "binary",
  Path        => "$my_file_gif ",
  Filename    => "saveme.jpg",
  Disposition => "form-data"
) or die "Error adding \n";


	  
	  my $text = encode_base64($my_file_gif );
	  
	  # my $email = $msg->as_string();
	  
	  
	  
	  
	  my $self = eBay::API::XML::Call::UploadSiteHostedPictures::UploadSiteHostedPicturesRequestType->new();
	  
	$pCall->getRequestDataType()->setPictureData( $encoded);
	  
	# $pCall->setPictureData($self);
	$pCall->getRequestDataType()->setPictureName('testing');
	$pCall->setPictureSystemVersion(2);
	  $pCall->setPictureUploadPolicy("Add");
	  
	  
	  
	  
	  
      #$pCall->setErrLang('en_US');
	 
	 
	 
	  $pCall->execute();
	 
	 my $hi = $pCall->getResponseRawXml();
	 
  my $sOfficialTime = $pCall->getSiteHostedPictureDetails();
  
	 print $sOfficialTime . "\n\n\n\n\n";
	 
	 print $hi . "\n";
# =cut
	 
	 open (MYFILE, '>ti.txt'); print MYFILE $encoded; close (MYFILE); 
	 
	 
	# print $encoded;


 #print  $pCall->getApiCallName();