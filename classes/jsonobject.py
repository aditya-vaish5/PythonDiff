# from itertools import cycle

class JSONObject:
    def __init__(self, dic):
        self.items = []
        self.val = {}
        self.size = len(dic)
        for item in dic:
            # print(item)
            self.items.append(item)
            if isinstance(dic[item], dict):
                obj = JSONObject(dic[item])
                self.val[item] = obj
            elif isinstance(dic[item], list):
                obj = JSONArray(dic[item])
                self.val[item] = obj
            else:
                self.val[item] = dic[item]
            # self.size += 1
        # print("JSON Object created")

    def __str__(self):
        s = ""
        for i in range(self.size):
            s += str(self.items[i]) + ' : ' + \
                str(self.val[self.items[i]]) + '\n'
        return s

    def compare(self, other):
        shared_item = []
        only_1 = []
        only_2 = []
        # ans = True
        for k in self.items:
            if k in other.items:
                shared_item.append(k)
            else:
                only_1.append(k)
        for k in other.items:
            if k not in self.items:
                only_2.append(k)
        print("\nstuff only in 1 :")
        print(only_1)
        print("\nstuff only in 2 :")
        print(only_2)
        print("\nDifferences in shared items are")
        if len(only_1) > 0 or len(only_2) > 0:
            ans = False
        for item in shared_item:
            if not self.val[item] == other.val[item]:
                print("\nInside  : ", item)
            if isinstance(self.val[item], JSONObject) or isinstance(other.val[item],JSONObject):
                if self.val[item] is not None:
                    ans |= self.val[item].compare( other.val[item])
                else:
                    print("=> OBJ2 values\n")
                    print(other.val[item])
                    ans =False
            elif isinstance(self.val[item], JSONArray) or isinstance(other.val[item], JSONArray):
                if self.val[item] is not None:
                    ans |= self.val[item].compare(other.val[item])
                else:
                    print("=> OBJ2 values\n")
                    print(other.val[item])
                    ans =False
            elif not self.val[item] == other.val[item]:
                ans = False
                print("in objects ", item, "is different.","\n\tOBJ1 :",self.val[item],"\n\tOBJ2 :",other.val[item] )

    def __eq__(self, other):
        shared_item = []
        only_1 = []
        only_2 = []
        for k in self.items:
            if k in other.items:
                shared_item.append(k)
            else:
                only_1.append(k)
        for k in other.items:
            if k not in self.items:
                only_2.append(k)
        if len(only_1) > 0 or len(only_2) > 0:
            return False
        for item in shared_item:
            # print("Inside  : ", item)
            if not self.val[item] == other.val[item]:
                return False
                # print("in objects ", item, "is different")
        return True


class JSONArray:

    def __init__(self, arr):
        self.items = []
        self.size = 0
        for item in arr:
            if isinstance(item, dict):
                obj = JSONObject(item)
                self.items.append(obj)
            elif isinstance(item, list):
                obj = JSONArray(item)
                self.items.append(obj)
            else:
                self.items.append(item)
            self.size += 1

    def __str__(self):
        s = "\n .............\n"
        for i in self.items:
            s += str(i) + ' '
        s += '.............'
        return s

    def compare(self,other):
        if other is None:
            print("=> OBJ1 values\n")
            print(other)
            return False

        only_1 = []
        only_2 = []
        ans = True
        for k in self.items:
            found = False
            for l in other.items:
                if k == l:
                    found =True
                    break
            if found == False:
                only_1.append(k)
        for k in other.items:
            found = False
            for l in self.items:
                if k == l:
                    found =True
                    break
            if found == False:
                only_2.append(k)
        if(len(only_1)>0):
            print("In array values only in OBJ1=\n")
            for i in only_1:
                print(i)
        if(len(only_2)>0):
            print("In array values only in OBJ2=\n")
            for i in only_2:
                print(i)
        if len(only_1) >0 or len(only_2)>0:
            return False
        return True

    def __eq__(self, other):
        

        if self is None and other is not None:
            return False

        if other is None and self is not None:
            return False
        
        if other is None and self is None:
            return True
        only_1 = []
        only_2 = []
        for k in self.items:
            found =False
            for l in other.items:
                if k == l:
                    found =True
            if found ==False:
                return False
        for k in other.items:
            found =False
            for l in self.items:
                if k == l:
                    found =True
            if found ==False:
                return False
        # print(only_1)
        # print(only_2)
        return True
