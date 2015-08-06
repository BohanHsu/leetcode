package _4Sum;

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

    private ArrayList<Integer> addArrayToArrayList(int[] array) {

        ArrayList<Integer> result;
        result = new ArrayList<Integer>(array.length);

        for (int i : array) {
            result.add(i);
        }

        return result;
    }

    @Test
    public void testFourSum() {
        int[] nums = new int[]{1, 0, -1, 0, -2, 2};
        int target = 0;
        LinkedList<ArrayList<Integer>> expectedResult = new LinkedList<ArrayList<Integer>>();

        expectedResult.add(addArrayToArrayList(new int[]{-1, 0, 0, 1}));
        expectedResult.add(addArrayToArrayList(new int[]{-2, -1, 1, 2}));
        expectedResult.add(addArrayToArrayList(new int[]{-2, 0, 0, 2}));

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

        List<List<Integer>> result = s.fourSum(nums, target);

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
    @Test
    public void testFourSum1() {
        int[] nums = new int[]{-3, -1, 0, 2, 4, 5};
        int target = 1;
        LinkedList<ArrayList<Integer>> expectedResult = new LinkedList<ArrayList<Integer>>();

        expectedResult.add(addArrayToArrayList(new int[]{-3, -1, 0, 5}));

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

        List<List<Integer>> result = s.fourSum(nums, target);

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