package validSudoku;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class SolutionTest {
    public Solution s;

    @Before
    public void setUp() {
        s = new Solution();
    }

    @Test
    public void testValidSudoku() {
//        int[][] intMatrix = new int[9][9];
//        intMatrix[0] = new int[]{5,3,4,6,7,8,9,1,2};
//        intMatrix[1] = new int[]{6,7,2,1,9,5,3,4,8};
//        intMatrix[1] = new int[]{1,9,8,3,4,2,5,6,7};
//        intMatrix[1] = new int[]{8,5,9,7,6,1,4,2,3};
//        intMatrix[1] = new int[]{4,2,6,8,5,3,7,9,1};
//        intMatrix[1] = new int[]{7,1,3,9,2,4,8,5,6};
//        intMatrix[1] = new int[]{9,6,1,5,3,7,2,8,4};
//        intMatrix[1] = new int[]{2,8,7,4,1,9,6,3,5};
//        intMatrix[1] = new int[]{3,4,5,2,8,6,1,7,9};

        int[][] intMatrix = {
                {5,3,0,0,7,0,0,0,0},
                {6,0,0,1,9,5,0,0,0},
                {0,9,8,0,0,0,0,6,0},
                {8,0,0,0,6,0,0,0,3},
                {4,0,0,8,0,3,0,0,1},
                {7,0,0,0,2,0,0,0,6},
                {0,6,0,0,0,0,2,8,0},
                {0,0,0,4,1,9,0,0,5},
                {0,0,0,0,8,0,0,7,9}
        };

        char[][] board = new char[9][9];

        for (int i = 0; i < 9; i++) {
            for (int j = 0; j < 9; j++) {
                board[i][j] = intMatrix[i][j] != 0 ? (char)(intMatrix[i][j] + 48) : '.';
            }
        }

        for (char[] ca : board)

        assertEquals(true, s.isValidSudoku(board));
    }

}