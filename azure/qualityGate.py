import sys

if len(sys.argv)-1 == 0:
    print('Missing argument. Value of pass will return pass. Any other will return fail.')
    exit(1)
    
print('')
print('====================================================')
print('Gate Test')
print('====================================================')
print('arg 1:', sys.argv[1])
if len(sys.argv)-1 == 2:
    print('arg 2:' + sys.argv[2])

if len(sys.argv)-1 == 3:
    print('arg 2:' + sys.argv[3])

try:
    if sys.argv[1] == 'pass':
        print('I passed')
    else:
        exit(1)
except:
    print('I failed')
    exit(1)
