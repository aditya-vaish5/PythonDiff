import json
import sys
from classes.jsonobject import JSONObject

# print( 'Number of arguments : ', len(sys.argv))
# print(sys.argv[1])
# print(sys.argv[2])
if len(sys.argv)!=3 :
    print('test.py -i <inputfile> -o <outputfile>')
    sys.exit(2)

# print('okay')
# print(sys.argv[1])
# print(sys.argv[2])

with open(sys.argv[1], 'r', encoding='utf-16') as f:
    # print(f.read())
    data1 = f.read()
with open(sys.argv[2], 'r', encoding='utf-16') as f:
    data2 = f.read()

dic1 = json.loads(data1)
dic2 = json.loads(data2)
ans = json.dumps(dic1, indent=2, sort_keys=True)

with open('solution.json', 'w') as f:
    json.dump(dic1['routes'],f, indent=2)

obj1 = JSONObject(dic1)
# print(obj1)
obj2 = JSONObject(dic2)
# print("Printing OBJ 1")
# print(obj1)
# print('***********************************')
# print("Printing OBJ 2")
# print(obj2)
# print('************************************')
obj1.compare(obj2)