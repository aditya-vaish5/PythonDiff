import json
import sys
import getopt

# print( 'Number of arguments : ', len(sys.argv))
# print(sys.argv[1])
# print(sys.argv[2])

try:
    getopt.getopt(sys.argv, 'hi:i:', ["ifile=", "ifile"])
except getopt.GetoptError:
    print('test.py -i <inputfile> -o <outputfile>')
    sys.exit(2)

# print('okay')
print(sys.argv[1])
print(sys.argv[2])

with open(sys.argv[1], 'r', encoding='utf-16') as f:
    # print(f.read())
    data1 = f.read()
with open(sys.argv[2], 'r', encoding='utf-16') as f:
    data2 = f.read()
print("printing data1")

dic1 = json.loads(data1)
print(dic1)
print('--------------------')
print(type(dic1['etag']))
# print("printing data2")
# dic2 = json.loads(data2)
# print(dic2)
print(json.dumps(dic1, indent=2, sort_keys=True))
