from ajenti.api import *
from ajenti.plugins import *


info = PluginInfo(
    title='testplug',
    icon=None,
    dependencies=[
        PluginDependency('main'),
    ],
)


def init():
    import main