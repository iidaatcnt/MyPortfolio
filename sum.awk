# update at 2016.11
BEGIN {
  FS=":"
}
{
    works[$1] += $2
}
END {
    for (job in works) {
        print job ":" works[job]
    }
}
