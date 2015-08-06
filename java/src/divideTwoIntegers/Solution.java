package divideTwoIntegers;

public class Solution {

    public int divide(int dividend, int divisor) {
        long longDividend;
        long longDivisor;
        if (dividend >= 0) {
            longDividend = dividend;
        } else {
            longDividend = (Integer.MAX_VALUE & dividend);
            longDividend = longDividend | (1 << 63);
        }

        if (divisor >= 0) {
            longDivisor = divisor;
        } else {
            longDivisor = (Integer.MAX_VALUE & divisor);
            longDivisor = longDivisor | (1 << 63);
        }

        long res = divide(longDividend, longDivisor);
        if (res >= Integer.MAX_VALUE) {
            return Integer.MAX_VALUE;
        }
        return (int)res;
    }

    public long divide(long dividend, long divisor) {
        long res = 0L;

        if (divisor == 0)
            return Integer.MAX_VALUE;

        boolean negative = (dividend < 0 ^ divisor < 0);

        if (dividend < 0)
            dividend = -dividend;

        if (divisor < 0)
            divisor = -divisor;

        if (dividend < dividend)
            return 0;

        int mask = 0;

        int i = 63;
        mask = 1 << i;
        while (i > 0) {
            if ((dividend & mask) != 0) {
                break;
            }
            mask = mask >> 1;
            i--;
        }

        int j = 63;
        mask = 1 << j;
        while (j > 0) {
            if ((divisor & mask) != 0) {
                break;
            }
            mask = mask >> 1;
            j--;
        }

        if (i < j)
            return 0;

        int k = i - j;
        divisor = divisor << k;
        while (k >= 0) {
            if (divisor > dividend) {
                res = res & ~(1L << k);
            } else {
                res = res | (1L << k);
                dividend -= divisor;
            }
            divisor = divisor >> 1;
            k--;
        }

        return negative ? -res : res;
    }
}
