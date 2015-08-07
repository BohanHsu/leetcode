package setMatrixZeroes;

public class Solution {
    public void setZeroes(int[][] matrix) {
        if (matrix.length == 0 || matrix[0].length == 0)
            return;

        int firstLineHaveZero;
        int height = matrix.length;
        int width = matrix[0].length;

        for (firstLineHaveZero = 0; firstLineHaveZero < height; firstLineHaveZero++) {
            boolean flag = false;
            for (int j = 0; j < width; j++) {
                if (matrix[firstLineHaveZero][j] == 0) {
                    flag = true;
                    break;
                }
            }
            if (flag) {
                break;
            }
        }

        if (firstLineHaveZero == height) {
            return;
        }

        for (int j = 0; j < width; j++) {
            boolean flag = false;
            for (int i = 0; i < height; i++) {
                if (matrix[i][j] == 0) {
                    flag = true;
                    break;
                }
            }
            if (flag) {
                matrix[firstLineHaveZero][j] = 0;
            }
        }

        for (int i = 0; i < height; i++) {
            if (i == firstLineHaveZero)
                continue;

            boolean flag = false;
            for (int j = 0; j < width; j++) {
                if (matrix[i][j] == 0) {
                    flag = true;
                    break;
                }
            }
            if (flag) {
                for (int j = 0; j < width; j++) {
                    matrix[i][j] = 0;
                }
            }
        }

        for (int j = 0; j < width; j++) {
            if (matrix[firstLineHaveZero][j] == 0) {
                for (int i = 0; i < height; i++) {
                    matrix[i][j] = 0;
                }
            }
        }

        for (int j = 0; j < width; j++) {
            matrix[firstLineHaveZero][j] = 0;
        }
    }
}
