from pandocfilters import Str, toJSONFilter
from pyphen import Pyphen

dic = Pyphen(lang='pl_PL', left=4, right=4)

def hyphenate(key, value, format, meta):
    if key == 'Str':
        hyphenated = dic.inserted(value, hyphen='­')
        return Str(hyphenated)

if __name__ == "__main__":
    toJSONFilter(hyphenate)
