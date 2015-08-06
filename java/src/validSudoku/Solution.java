package validSudoku;

import java.util.HashSet;

public class Solution {
    public HashSet<Integer> generateSet() {
        HashSet<Integer> set = new HashSet<Integer>();
        for (int i = 1; i < 10; i++) {
            set.add(i);
        }
        return set;
    }

    public boolean isValidSudoku(char[][] board) {
        for (int i = 0; i < 9; i++) {
            HashSet<Integer> set1 = generateSet();
            HashSet<Integer> set2 = generateSet();
            boolean flag1 = false;
            boolean flag2 = false;

            for (int j = 0; j < 9; j++) {
                if (board[i][j] == '.') {
                    flag1 = true;
                } else if (set1.contains(board[i][j] - 48)) {
                    set1.remove(board[i][j] - 48);
                } else {
                    return false;
                }

                if (board[j][i] == '.') {
                    flag2 = true;
                } else if (set2.contains(board[j][i] - 48)) {
                    set2.remove(board[j][i] - 48);
                } else {
                    return false;
                }
            }
        }

        for (int m = 0; m < 9; m += 3) {
            for (int n = 0; n < 9; n += 3) {
                HashSet<Integer> set = generateSet();
                boolean flag = false;
                for (int i = 0; i < 3; i++) {
                    for (int j = 0; j < 3; j++) {
                        if (board[m+i][n+j] == '.') {
                            flag = true;
                        } else if (set.contains(board[m+i][n+j] - 48)) {
                            set.remove(board[m+i][n+j] - 48);
                        } else {
                            return false;
                        }
                    }
                }
            }
        }

        return true;
    }
}