package setMatrixZeroes;

import org.junit.Test;

import static org.junit.Assert.*;

public class SolutionTest {
    @Test
    public void testSetZeroes() {
        Solution solution = new Solution();
        int[][] matrix = {
                {1,2,3,4,5,6,0},
                {1,2,3,4,5,6,7},
                {1,2,3,0,5,6,7},
                {1,2,3,4,5,6,7},
                {1,0,3,4,5,6,7},
                {0,2,3,4,5,6,7}
        };

        int[][] expectedResult = {
                {0,0,0,0,0,0,0},
                {0,0,3,0,5,6,0},
                {0,0,0,0,0,0,0},
                {0,0,3,0,5,6,0},
                {0,0,0,0,0,0,0},
                {0,0,0,0,0,0,0}
        };

        solution.setZeroes(matrix);

        assertEquals(expectedResult, matrix);
    }

}