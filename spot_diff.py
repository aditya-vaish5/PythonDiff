import json
import sys, getopt

# print( 'Number of arguments : ', len(sys.argv))
# print(sys.argv[1])
# print(sys.argv[2])

try:
    getopt.getopt(sys.argv, 'hi:i:',["ifile=","ifile"])
except getopt.GetoptError:
    print ('test.py -i <inputfile> -o <outputfile>')
    sys.exit(2)

# print('okay')
print(sys.argv[1])
print(sys.argv[2])

with open(sys.argv[1],'r') as f :
    data1 =json.loads(f.read())
with open(sys.argv[2],'r') as f :
    data2 = json.loads(f.read())

print(data1)
print(data2)