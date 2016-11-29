# randan numbers of from 0 to 100. 200 numbers.
BEGIN { for(i=1; i <= 200; i++)
          print int(101 * rand())
      }

# ex) one liner
# awk 'BEGIN { for(i=1; i<=200; i++) print int(101 * rand())}'

