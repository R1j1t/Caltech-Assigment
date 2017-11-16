import itertools


a=['x1','x2','x3','x4','x5']
b=[]
c={}
paths=[]
connectedComponents=[]

for j in itertools.permutations(a,2):
    if len(set(j).intersection(('x1', 'x2'))) == len(j):
        c[j]=1
    elif  len(set(j).intersection(('x1', 'x3'))) == len(j):
        c[j]=1
    elif len(set(j).intersection(('x2', 'x3'))) == len(j):
        c[j]=1
    else:        
        c[j]=0


        
for i in range(2,len(a)+1):
    for j in itertools.combinations(a,i):
        b.append(j)

        
        
for i in b:
    if len(i)==2:
       if c[i]==1:
           paths.append(i)
           connectedComponents.append(i)
           
    else:
        product = 1
        count0=0

        for k in itertools.combinations(i,2):
            product = c[k]*product
            '''
            print('k',end="")
            print(str(i)+"   ",end="")
            print(k)
            '''
            if c[k] == 0:
                count0 +=1
                
        
        '''
        for j in range(len(i)-1):
            
            print('c[i[j:j+2]]',end="")
            print(str(i)+"   ",end="")
            print(i[j:j+2])
            
            product = c[i[j:j+2]]*product
            if c[i[j:j+2]] == 0:
                count0 +=1
        '''
        if product == 1:
            paths.append(i)
        if count0 <=1 :
            connectedComponents.append(i)

print('Connected Components are:')
print(connectedComponents)
            
            
            
        
           
            
            
