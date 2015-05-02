class Solution:
    def __init__(self):
        areas = {}

    # @param height, a list of integer
    # @return an integer
    def largestRectangleArea(self, height):
        length = len(height)
        for i in range(0, length):
            for j in range(i, length):
                if (i, j-1) in area:
                    


    def area_of(self, i, j):

