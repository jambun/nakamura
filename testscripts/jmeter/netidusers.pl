#!/usr/bin/perl

# creates usernames at random with a NetID 'feel' to them: two alpha characters followed by an integer from 1000 to 9999
# when I want to save this off as a csv file, I do: netiduser.pl 6100 | sort | uniq | head -n 6000 > someusers.csv
if($ARGV[0] !~ /^\d+/) 
{ 
    $howmany=10;
}
else 
{ 
    $howmany=$ARGV[0]; 
}
@array = (a..z);
@usernames = ();
srand;
$clean=100;
$counter_time=0;
$counter=0;
$first=time;
foreach (1..$howmany)
{
    $name = "";
    foreach (1..2) 
    {    
	    $rand = int(rand scalar(@array));    
	    $name = $name . $array[$rand];    
    }
    $digits = int(rand(8999)) + 1000;
    $name = $name . $digits;
    push(@usernames, $name);
    print $name . ",test\n";
    # if ($counter_time==$clean) {
    #     $last=time;
    #     $diff=$last-$first;
    #     print "$counter,$diff\n";
    #     $first=$last;
    #     $counter_time=0;
    # }
    # $counter_time++;
    # $counter++;
    # $val=&create_profile($name); 
    # system ("curl $val -F:name=$name -Fpwd=test -FpwdConfirm=test http://admin:admin\@localhost:8080/system/userManager/user.create.html 2> /dev/null  >/dev/null;");
}


sub create_profile{
my ($tester)=@_;  
  $ret=  "-F \":sakai:profile-import={\'basic\': {\'access\': \'everybody\', \'elements\': {\'email\': {\'value\': \'$tester\@sakai.invalid\'}, \'firstName\': {\'value\': '$tester'}, 'lastName': {'value': \'$tester\'}}}}\"";
return $ret;
}



