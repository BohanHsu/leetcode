package minimumWindowSubstring;

import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by bohan on 8/6/15.
 */
public class SolutionTest {

    @Test
    public void testMinWindow() {
        Solution solution = new Solution();
        String s = "ADOBECODEBANC";
        String t = "ABC";
        String expectedResult = "BANC";

        assertEquals(expectedResult, solution.minWindow(s, t));
    }

    @Test
    public void testMinWindow1() {
        Solution solution = new Solution();
        String s = "ABCUBDC";
        String t = "A";
        String expectedResult = "A";

        assertEquals(expectedResult, solution.minWindow(s, t));
    }

    @Test
    public void testMinWindow2() {
        Solution solution = new Solution();
        String s = "ABCUBDC";
        String t = "ABCE";
        String expectedResult = "";

        assertEquals(expectedResult, solution.minWindow(s, t));
    }

    @Test
    public void testMinWindow3() {
        Solution solution = new Solution();
        String s = "ABCUBDC";
        String t = "";
        String expectedResult = "";

        assertEquals(expectedResult, solution.minWindow(s, t));
    }

    @Test
    public void testMinWindow4() {
        Solution solution = new Solution();
        String s = "A";
        String t = "A";
        String expectedResult = "A";

        assertEquals(expectedResult, solution.minWindow(s, t));
    }

    @Test
    public void testMinWindow5() {
        Solution solution = new Solution();
        String s = "bdab";
        String t = "ab";
        String expectedResult = "ab";

        assertEquals(expectedResult, solution.minWindow(s, t));
    }
}