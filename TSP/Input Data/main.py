# Python program to read and convert distances into a a json to a distance matrix.
# print('olá mundo')
# https://www.geeksforgeeks.org/read-json-file-using-python/
import json

# Opening the JSON file
# file = open('states_merged.json', 'r')
file = open('states_merged.json', encoding='utf-8')

data = json.load(file)

# for i in data['nodes']:
#    print(i)

# for i in data['edges']:
#    print(i)

# for i in data['nodes']:
#    for j in data['edges']:
#        print(i, j[0])

# print(data['nodes'][0])

# print(data['edges'][0][0])
# print(data['edges'][0][1])
# print(data['edges'][0][2])


orignDestinationMatrix = []

orignDestinationMatrix.append([])
orignDestinationMatrix[0].append('')
for i in data['nodes']:
    orignDestinationMatrix[0].append(i)

orign = 1
destination = 1
edge = 0
for i in data['nodes']:
    orignDestinationMatrix.append([])
    orignDestinationMatrix[orign].append(i)
#    print(i, orign, destination, data['edges'][orign][0])
    for j in data['nodes']:
        if orign == (destination):
            distance = 0
        else:
            #    print(i, orign, destination)
            # print(data['edges'][orign][0], data['edges']
            #      [destination][1], data['edges'][destination][2])
            # print(orign, destination)
            print(edge)
            distance = data['edges'][edge][2]
            edge += 1

        orignDestinationMatrix[orign].append(distance)
        destination += 1

    orign += 1
    destination = 1


# for i in range(n):
#    for j in range(n):
#        print('{:4}').format(orignDestinationMatrix[i][j]),
#    print

# for i in orignDestinationMatrix:
#    print(i)

# Closing file
file.close()

# Create an output file
outputFile = open("outputFile.txt", "w")

for i in orignDestinationMatrix:
    outputFile.write("%s\n" % i)


# with open('your_file.txt', 'w') as f:
#    for item in my_list:
#        f.write("%s\n" % item)

outputFile.close()
