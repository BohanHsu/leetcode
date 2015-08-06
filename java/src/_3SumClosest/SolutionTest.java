package _3SumClosest;

import _3sum.*;
import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class SolutionTest {
    public static Solution s;
    @Before
    public void setUp() {
        s = new Solution();
    }

    @Test
    public void testThreeSumClosest() {
        assertEquals(2, s.threeSumClosest(new int[]{-1, 2, 1, -4}, 1));
    }


}