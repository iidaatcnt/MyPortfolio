# 2016.11.29
BEGIN {
  maxnum = ARGC > 1 ? ARGV[1] : 10
  ARGV[1] = "-"
  srand()
  do {
    n1 = randint(maxnum)
    n2 = randint(maxnum)
    printf("%g + %g = ?", n1, n2)
    while ( (input = getline) > 0)
      if ($0 == n1 + n2) {
        print "Right"
        break
      } else if ($0 == "") {
        print n1 + n2
        break
      } else
        print("wrong, try again: ")
  } while (input > 0)
}

function randint(n) { return int(rand()*n)+1 }
