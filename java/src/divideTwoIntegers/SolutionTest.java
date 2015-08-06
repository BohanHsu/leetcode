package divideTwoIntegers;

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
    public void testDivide() {
        int dividend = 10;
        int dividor = 5;
        int res = 2;
        assertEquals(res, s.divide(dividend, dividor));

        dividend = 100;
        dividor = 3;
        res = 33;
        assertEquals(res, s.divide(dividend, dividor));
    }

    @Test
    public void testDivide1() {
        int dividend = -1;
        int dividor = 1;
        int res = -1;
        assertEquals(res, s.divide(dividend, dividor));
    }

    @Test
    public void testDivide2() {
        int dividend = -2147483648;
        int dividor = -1;
        int res = 2147483647;
        assertEquals(res, s.divide(dividend, dividor));
    }
}