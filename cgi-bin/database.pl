#!/strawberry/perl/bin/perl

	use strict;
    use warnings;
    use DBD::mysql;
	
 my $driver = "mysql";
    my $database = "lol";
    my $user = "test"; 
    my $password = "test";

	
	
	my $hi = "test listing 9090";
	
    my $dbh = DBI->connect(
        "DBI:$driver:$database",
        $user, $password,
    ) or die $DBI::errstr;
	
	   my $sth = $dbh->prepare("
        INSERT INTO ebay 
                    (item_id, item_title, item_price,item_quan,item_desc,item_ship_price,item_pic_url)
             VALUES (301364396024,?, 90,4,'this is a descriptionb testing',4.50,'http://multi-medium.net/wp-content/uploads/2008/06/d90.jpg')
    ") or die $dbh->errstr;
	
	
	$sth->execute($hi) or die $dbh->errstr;