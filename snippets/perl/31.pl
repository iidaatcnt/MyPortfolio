$fred[0] = "aaa";
$fred[1] = "bbb";
$fred[2] = "ccc";


#print $fred[0];
$fred[2] = "diddley";
$fred[1] .= "whatsis";

print "$fred[0]\n";
print "$fred[1]\n";
print "$fred[2]\n";
