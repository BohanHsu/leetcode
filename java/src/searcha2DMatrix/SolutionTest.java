package searcha2DMatrix;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by bohan on 8/6/15.
 */
public class SolutionTest {

    @Test
    public void testSearchMatrix() {
        Solution solution = new Solution();
        int matrix[][] = {
                {1,   3,  5,  7},
                {10, 11, 16, 20},
                {23, 30, 34, 50}
        };

        assertEquals(true, solution.searchMatrix(matrix, 3));
    }

    @Test
    public void testCornerCase1() {
        Solution solution = new Solution();
        int matrix[][] = {
                {1, 3}
        };
        boolean res = true;
        assertEquals(res, solution.searchMatrix(matrix, 3));
    }

    @Test
    public void testCornerCase2() {
        Solution solution = new Solution();
        int matrix[][] = {
            {1},
            {3}
        };
        boolean res = true;
        assertEquals(res, solution.searchMatrix(matrix, 3));
    }


}