import sys

if len(sys.argv)-1 == 0:
    print('Missing argument. Value of pass will return pass. Any other will return fail.')
    exit(1)

print('')
print('====================================================')
print('Gate Test')
print('====================================================')
print('Argument Value:', sys.argv[1])
try:
    if sys.argv[1] == 'pass':
        print('I passed')
    else:
        exit(1)
except:
    print('I failed')
    exit(1)