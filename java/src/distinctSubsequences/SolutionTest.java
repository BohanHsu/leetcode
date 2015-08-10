package distinctSubsequences;

import org.junit.Test;

import static org.junit.Assert.*;

public class SolutionTest {

    @Test
    public void testNumDistinct() {
        Solution solution = new Solution();
        String s = "ABCDE";
        String t = "ACE";
        int expectedResult = 1;
        assertEquals(expectedResult, solution.numDistinct(s, t));

        s = "rabbbit";
        t = "rabit";
        expectedResult = 3;
        assertEquals(expectedResult, solution.numDistinct(s, t));

        s = "rrabbbit";
        t = "rabit";
        expectedResult = 6;
        assertEquals(expectedResult, solution.numDistinct(s, t));


        s = "rrabbbit";
        t = "";
        expectedResult = 1;
        assertEquals(expectedResult, solution.numDistinct(s, t));

        s = "ABCDE";
        t = "AEC";
        expectedResult = 0;
        assertEquals(expectedResult, solution.numDistinct(s, t));
    }
}