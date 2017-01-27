from PIL import Image
from optparse import OptionParser
# import sys

parser = OptionParser()
parser.add_option("-q", "--quiet", action="store_false", dest="verbose",
                  default=True, help="don't print status messages to stdout")
parser.add_option("-i", "--image", type="string", dest="imagename",
                  help="Name of Image")
parser.add_option("-d", "--diff", type="string", dest="diff",
                  default=0, help="maximum difference between Red, Green, Blue")

(options, args) = parser.parse_args()

if (options.imagename is None):
    parser.error("no image entered")

diff = int(options.diff)
img_path = options.imagename


def is_grey_scale(img_path):
    try:
        im = Image.open(img_path).convert('RGB')
    except (FileNotFoundError):
        print ("Image not found")
        quit()
    w, h = im.size
    for i in range(w):
        for j in range(h):
            r, g, b = im.getpixel((i, j))
            if ((abs(r - g) > diff) &
                    (abs(r - b) > diff) &
                    (abs(b - g) > diff)):
                return False
    return True

if (bool(options.verbose) == False):
    is_grey_scale(img_path)
else:
    print (is_grey_scale(img_path))
