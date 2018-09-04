import numpy as np
import pandas as pd
s = pd.Series([1,2,3])

print(s)
# 0    1
# 1    2
# 2    3

print('s[0] = ',s[0])
# s[0] =  1

print('s.sum() = ', s.sum())
# s.sum() =  6

df = pd.DataFrame({'A':[1,2], 'B':[3,4]})
print(df)
#    A  B
# 0  1  3
# 1  2  4
