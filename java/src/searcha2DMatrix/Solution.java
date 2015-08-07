package searcha2DMatrix;

public class Solution {

    public boolean searchMatrix(int[][] matrix, int target) {
        if (matrix.length == 0 || matrix[0].length == 0)
            return false;

        int width = matrix[0].length;
        int height = matrix.length;

        int len = width * height;

        int from = 0;
        int to = len;
        int m;

        while (from < to) {
            if (from + 1 == to) {
                return (matrix[from / width][from % width] == target || to < len && matrix[to / width][to % width] == target);
            }

            m = (from + to) / 2;
            if (matrix[m / width][m % width] == target) {
                return true;
            } else if (matrix[m / width][m % width] < target) {
                from = m;
            } else if (matrix[m / width][m % width] > target) {
                to = m;
            }

        }

        return false;
    }
}
