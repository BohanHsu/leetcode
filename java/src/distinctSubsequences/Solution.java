package distinctSubsequences;

import java.util.LinkedList;
import java.util.Queue;

public class Solution {
    public int numDistinct(String s, String t) {
        int sLen = s.length();
        int tLen = t.length();
        int[][] matrix = new int[sLen + 1][tLen + 1];

        matrix[0][0] = 0;
        for (int i = 0; i < sLen; i++) {
            matrix[i+1][0] = 0;
        }

        for (int j = 0; j < tLen; j++) {
            matrix[0][j+1] = j + 1;
        }

        for (int i = 0; i < sLen; i++) {
            for (int j = 0; j < tLen; j++) {
                if (s.charAt(i) == t.charAt(j)) {
                    matrix[i+1][j+1] = Math.min(matrix[i][j], matrix[i][j+1]);
                } else {
                    matrix[i+1][j+1] = matrix[i][j+1];
                }
            }
        }

        Queue<Integer> queueI = new LinkedList<Integer>();
        Queue<Integer> queueJ = new LinkedList<Integer>();

        int[][] counts = new int[sLen + 1][tLen + 1];
        counts[sLen][tLen] = 1;

        int i = sLen;
        int j = tLen;

        queueI.add(i);
        queueJ.add(j);

        while (!queueI.isEmpty() && !queueJ.isEmpty()) {
            i = queueI.poll();
            j = queueJ.poll();

            if (i - 1 >= 0) {
                if (matrix[i - 1][j] == 0) {
                    if (counts[i-1][j] == 0) {
                        queueI.add(i - 1);
                        queueJ.add(j);
                    }
                    counts[i-1][j] += counts[i][j];
                }

                if (j - 1 >= 0 && matrix[i-1][j-1] == 0 && s.charAt(i-1) == t.charAt(j-1)) {
                    if (counts[i-1][j-1] == 0) {
                        queueI.add(i-1);
                        queueJ.add(j-1);
                    }
                    counts[i-1][j-1] += counts[i][j];
                }
            }
        }

        return counts[0][0];
    }
}
