class Person(object):
    def __init__(self,name):
        self.name = name

    def greeting(self):
        print(" I am  {}. hello".format(self.name))
        self.run(3)

    def run(self, num):
        print('run ' * num)

    def __del__(self):
        print('good bye')

person = Person("iida")
person.greeting()

del person

print('####')

