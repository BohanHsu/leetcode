package wildcardMatching;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

/**
 * Created by bohan on 8/6/15.
 */
public class SolutionTest {
    public Solution solution;

    @Before
    public void setUp() {
        solution = new Solution();
    }

    @Test
    public void testIsMatch() {
        String s = null;
        String p = null;
        boolean res = false;

        s = "aa";
        p = "a";
        res = false;
        assertEquals(res, solution.isMatch(s, p));

        s = "aa";
        p = "aa";
        res = true;
        assertEquals(res, solution.isMatch(s, p));

        s = "aaa";
        p = "aa";
        res = false;
        assertEquals(res, solution.isMatch(s, p));

        s = "aa";
        p = "*";
        res = true;
        assertEquals(res, solution.isMatch(s, p));

        s = "aa";
        p = "a*";
        res = true;
        assertEquals(res, solution.isMatch(s, p));

        s = "ab";
        p = "?*";
        res = true;
        assertEquals(res, solution.isMatch(s, p));

        s = "aab";
        p = "c*a*b";
        res = false;
        assertEquals(res, solution.isMatch(s, p));


        assertEquals(true, solution.isMatch("", "*"));

        assertEquals(false, solution.isMatch("", "?"));

        assertEquals(false, solution.isMatch("b", "*?*?"));

        assertEquals(true, solution.isMatch("abefcdgiescdfimde", "ab*cd?i*de"));

        assertEquals(false, solution.isMatch("ab", "*ac"));

        assertEquals(true, solution.isMatch("ab", "*?"));
    }

    @Test
    public void testIsMatch1() {
        assertEquals(false, solution.isMatch("ab", "*a"));
    }

    @Test
    public void testIsMatch2() {
        assertEquals(true, solution.isMatch("cabab", "*ab"));
    }

    @Test
    public void testIsMatch3() {
        assertEquals(false, solution.isMatch("b", "*a*"));
    }


}