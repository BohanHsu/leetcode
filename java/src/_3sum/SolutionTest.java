package _3sum;

import org.junit.Before;
import org.junit.Test;

import java.util.*;

import static org.junit.Assert.*;

public class SolutionTest {
    public static Solution s;
    @Before
    public void setUp() {
        s = new Solution();
    }

    @Test
    public void testTwoSum() {
        int[] nums = new int[]{-2,-1,0,1,2,3,4,5,6};
        int target = 0;
        List<List<Integer>> result = s.twoSum(nums, 8, 0);

        HashMap<Integer, Integer> map = new HashMap<Integer, Integer>();

        for (List<Integer> list : result) {
            map.put(list.get(0), list.get(1));
        }

        assertEquals(new Integer(1), map.get(-1));
        map.remove(-1);

        assertEquals(new Integer(2), map.get(-2));
        map.remove(-2);

        assertEquals(0, map.size());
    }

    @Test
    public void testThreeSum() {
        int[] nums = new int[]{-1, 0, 1, 2, -1, -4};
        List<List<Integer>> result = s.threeSum(nums);
        assertEquals(2, result.size());
        LinkedList<ArrayList<Integer>> expectedResult = new LinkedList<ArrayList<Integer>>();
        ArrayList<Integer> res = new ArrayList<Integer>();

        res.add(-1);
        res.add(0);
        res.add(1);
        expectedResult.add(res);

        res = new ArrayList<Integer>();
        res.add(-1);
        res.add(-1);
        res.add(2);
        expectedResult.add(res);

        Collections.sort(expectedResult, new Comparator<ArrayList<Integer>>() {
            @Override
            public int compare(ArrayList<Integer> o1, ArrayList<Integer> o2) {
                int len = o1.size() < o2.size() ? o1.size() : o2.size();
                int i = 0;
                while (i < len) {
                    if (o1.get(i) != o2.get(i))
                        return o1.get(i) - o2.get(i);

                    i++;
                }
                return 0;
            }
        });

        Collections.sort(result, new Comparator<List<Integer>>() {
            @Override
            public int compare(List<Integer> o1, List<Integer> o2) {
                int len = o1.size() < o2.size() ? o1.size() : o2.size();
                int i = 0;
                while (i < len) {
                    if (o1.get(i) != o2.get(i))
                        return o1.get(i) - o2.get(i);

                    i++;
                }
                return 0;
            }
        });

        assertEquals(expectedResult, result);
    }
}