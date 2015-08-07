package sortColors;

import org.junit.Test;

import static org.junit.Assert.*;

public class SolutionTest {
    @Test
    public void testSortColors() {
        Solution solution = new Solution();
        int[] nums = {1,0,2,0,1,1,2,2,0,0};
        int[] expectedResult = {0,0,0,0,1,1,1,2,2,2};
        solution.sortColors(nums);

        for (int i = 0; i < nums.length; i++)
            assertEquals(expectedResult[i], nums[i]);
    }


    @Test
    public void testSortColors1() {
        Solution solution = new Solution();
        int[] nums = {0, 2, 1};
        int[] expectedResult = {0, 1, 2};
        solution.sortColors(nums);

        for (int i = 0; i < nums.length; i++)
            assertEquals(expectedResult[i], nums[i]);
    }

}