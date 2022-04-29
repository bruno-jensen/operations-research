#import utils

'''
Python 3.6 code, implementing a simple constructive heuristic to the 
Labeling Problem.
'''

# List of labels to be chosen
labelsList = list()
# List with the overlap among the labels
overlapMatrix = list()
# List with the labels in the feasible solution
solution = list()

# Input data
labelsList.append({"Id" : 1, "Nome": "Objeto 1", "Coordenada X" : 0, "Coordenada Y" : 0, "Largura" : 10, "Altura":2})
labelsList.append({"Id" : 2, "Nome": "Objeto 2", "Coordenada X" : 0, "Coordenada Y" : 3, "Largura" : 5, "Altura":3})
labelsList.append({"Id" : 3, "Nome": "Objeto 3", "Coordenada X" : 10, "Coordenada Y" : 6, "Largura" : 7, "Altura":3})
labelsList.append({"Id" : 4, "Nome": "Objeto 4", "Coordenada X" : 25, "Coordenada Y" : 2, "Largura" : 10, "Altura":2})
labelsList.append({"Id" : 5, "Nome": "Objeto 5", "Coordenada X" : 9, "Coordenada Y" : 0, "Largura" : 10, "Altura":2})

# Returns true if there is overlap between the object in the x axis
def overlapInX(Object1, Object2):
    overlap = False

    startObject1 = Object1['Coordenada X']
    endObject1 = startObject1 + Object1['Largura']
    startObject2 = Object2['Coordenada X']
    endObject2 = startObject2 + Object2['Largura']

    if startObject1 < endObject2 and startObject2 < endObject1:
        overlap = True

    return overlap


# Returns true if there is overlap between the object in the x axis
def overlapInY(Object1, Object2):
    overlap = False

    startObject1 = Object1['Coordenada Y']
    endObject1 = startObject1 + Object1['Altura']
    startObject2 = Object2['Coordenada Y']
    endObject2 = startObject2 + Object2['Altura']

    if startObject1 < endObject2 and startObject2 < endObject1:
        overlap = True

    return overlap


# Returns true if the objects have overlap, False otherwise
def overlap(Object1, Object2):
    overlap = False

    overlapX = overlapInX(Object1, Object2)
    overlapY = overlapInY(Object1, Object2)

    if overlapX == True and overlapY == True:
        overlap = True
    
    return overlap


# Returns all objects with overlap
def computesOverlaps(labelsList):

    overlapMatrixData = dict()

    for i in range(len(labelsList)):
        object1 = labelsList[i]
        overlapMatrixData.clear()
        overlapMatrixData['Id'] = object1['Id']
        listOfOverlaps = list()
        for j in range(len(labelsList)):
            object2 = labelsList[j]
            if object1['Id'] != object2['Id'] and overlap(object1, object2) == True:
                listOfOverlaps.append(object2['Id'])

        overlapMatrixData['Overlaps'] = listOfOverlaps
        overlapMatrix.append(overlapMatrixData.copy())

    return overlapMatrix


# Returns a feasible solution
def computesSolution(overlapMatrix, labelsList):

    solution = list()
    listSize = len(overlapMatrix)
    object = 0

    while object < listSize:
        overlap = overlapMatrix[object]['Overlaps'].copy()
        if len(overlap) > 0:
            for i in range(len(overlap)):
                objectId = overlap[i] - 1
                del labelsList[objectId]
                del overlapMatrix[objectId]
                listSize =- 1
        object =+ 1
    return labelsList


# Prints a report with the solution to the Labeling Problem
def solutionReport(solutionList):
    
    print('-='*22)
    print('{:^42}'.format('Lista de objetos a serem exibidos na tela'))
    print('-='*22)

    print('|{:<5}{:>12}{:>12}{:>12}|'.format('Id', 'Coord. (x,y)', 'Largura', 'Altura'))

    for solution in solutionList:
        print('|{:<5}  ({:>2},{:>2}){:>12}{:>15}|'.format(solution['Id'], solution['Coordenada X'], solution['Coordenada Y'], solution['Largura'], solution['Altura']))


# Main Code

# Computes the overlap between the labels
overlapMatrix = computesOverlaps(labelsList)
# Generates a feasible solution
solution = computesSolution(overlapMatrix, labelsList)
# Prints a report with the solution in the screen
solutionReport(solution)
