from ajenti.api import *


@interface
class IShape (object):
    """
    This is an interface, specifying the methods required.
    """
    def number_of_corners(self):
        pass


@plugin
class Square (BasePlugin, IShape):
    """
    A sample implementation, note the inheritance from both BasePlugin (optional but gives extra options such as context management) and the interface.
    """

    def init(self):
        """
        init() methods are automatically called for plugins, maintaining inheritance hierarchy
        """
        print 'Square #%s initialized' % id(self)

    def number_of_corners(self):
        return 4


@plugin
class Circle (BasePlugin, IShape):
    def number_of_corners(self):
        return 0



print 'IShape is implemented by', IShape.get_class()
foo = IShape.get()  # get/create any instance of any IShape implementation
# or, more verbose, IShape.get_class().new()
print 'foo corners:', foo.number_of_corners()

# The instances are by default singleton:
print foo == IShape.get()  # True

# But you can create separate ones:
foo2 = IShape.get_class().new()
print foo == foo2  # False, different instances


for another_foo in IShape.get_all():  # iterate over all possible IShape implementations
    print '\n%s says:' % another_foo, another_foo.number_of_corners()


print IShape.get_instances()  # lists all three active IShape instances