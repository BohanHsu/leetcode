class Solution:

    searched = set([])
    area = {}
    h = 0
    w = 0
    matrix = None
    max = 0

    # @param matrix, a list of lists of 1 length string
    # @return an integer
    def maximalRectangle(self, matrix):
        h = len(matrix)
        w = len(matrix[0])
        self.h = h
        self.w = w
        self.matrix = matrix
        for i in range(0, h):
            for j in range(0, w):
                if matrix[i][j] == '1':
                    search_from(self, j, i)


    # @params x, y coordinate of element
    ### @return: size of area iff all element are 1, else return False
    def search_from(self, x, y):
        x1 = x 
        y1 = y
        x2 = x1
        y2 = y1
        while area_of(x1, y1, x2, y2):

    
    # @params x, y: coordinate
    # return area_of 
    def area_of(self, x1, y1, x2, y2):
