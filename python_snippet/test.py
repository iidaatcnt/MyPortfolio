def print_info(func):
    def wapper(*args, **kwargs):
        print('func:', func.__name__)
        print('args:',args)
        print('kwargs:', kwargs)
        result = func(*args, **kwargs)
        print('result', r esult)
        return result
    return wapper

@print_info
def add_num(a, b):
    return a + b

@print_info
def sum_num(a, b):
    return a - b

r = add_num(10,20)
print(r)

r = sum_num(20,10)
print(r)
