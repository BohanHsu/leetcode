package containsDuplicateIII;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class SolutionTest {
    public static Solution solution = null;

    @Before
    public void setUp () {
        solution = new Solution();
    }

    @Test
    public void testContainsNearbyAlmostDuplicate() {
        int[] nums = null;

        nums = new int[]{1,2,3,4,5,6,7};
        assertEquals(true, solution.containsNearbyAlmostDuplicate(nums, 2, 5));

        nums = new int[]{1,2,30,40,50};
        assertEquals(true, solution.containsNearbyAlmostDuplicate(nums, 2, 5));
    }

    @Test
    public void testContainsNearbyAlmostDuplicate1() {
         int[] nums = null;

         nums = new int[]{0};
         assertEquals(false, solution.containsNearbyAlmostDuplicate(nums, 0, 0));
     }

    @Test
    public void testContainsNearbyAlmostDuplicate2() {
         int[] nums = null;

         nums = new int[]{-1, 2147483647};
         assertEquals(false, solution.containsNearbyAlmostDuplicate(nums, 1, 2147483647));
     }


}
