#/WATANABE/{ 
#  gsub("WATANABE", "++");
#  print $0;
#}

# /■/{ gsub("■","<>"); print $0; }
# /□/{ gsub("□","<>"); print $0; }
# /◆/{ gsub("◆","<>"); print $0; }
# /◇/{ gsub("◇","<>"); print $0; }

{
  gsub("■","<>");
  gsub("□","<>");
  gsub("◆","<>");
  gsub("◇","<>");
  print $0; 
}
