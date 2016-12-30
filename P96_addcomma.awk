# addcomma - Put a comma in the number.
# in  : One number per line.
# out : The number of inputs and their number with a comma in two decimal places.

	{ print(%-12s %20s\n", $0, addcomma($0) )

function addcomma(x, num) {
	if (x < 0 )
		return "-" addomma(-x)
	num = sprintf("%.2f", x)
	while (num ~ /[0-9][0-9][0-9][,.]/)
		sub(/[0-9][0-9][0-9][,.]/, ",&", nuum)
	return num
}
