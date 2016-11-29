# randan numbers of from 0 to 100. 20 numbers.
BEGIN { for(i=1; i <= 20; i++)
          printf("%s\n", randlet());
      }

function randlet() {
    return substr("abcdefghijklmnopqrstuvwxyz", randint(26), 1)
}
function randint(n) {
    return int(n * rand()) + 1
}
