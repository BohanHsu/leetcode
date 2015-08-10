package pathSumII;

import org.junit.Test;

import java.util.*;

import static org.junit.Assert.*;

public class SolutionTest {

    @Test
    public void testPathSum1() {
        TreeNode t0 = new TreeNode(5);
        TreeNode t1 = new TreeNode(4);
        TreeNode t2 = new TreeNode(8);
        TreeNode t3 = new TreeNode(11);
        TreeNode t4 = new TreeNode(13);
        TreeNode t5 = new TreeNode(4);
        TreeNode t6 = new TreeNode(7);
        TreeNode t7 = new TreeNode(2);
        TreeNode t8 = new TreeNode(5);
        TreeNode t9 = new TreeNode(1);

        t0.left = t1;
        t0.right = t2;

        t1.left = t3;

        t2.left = t4;
        t2.right = t5;

        t3.left = t6;
        t3.right = t7;

        t5.left = t8;
        t5.right = t9;

        LinkedList<LinkedList<Integer>> expectedResult = new LinkedList<LinkedList<Integer>>();

        LinkedList<Integer> path = new LinkedList<Integer>();
        path.add(5);
        path.add(4);
        path.add(11);
        path.add(2);
        expectedResult.add(path);

        path = new LinkedList<Integer>();
        path.add(5);
        path.add(8);
        path.add(4);
        path.add(5);
        expectedResult.add(path);

        Collections.sort(expectedResult, new Comparator<LinkedList<Integer>>() {
            @Override
            public int compare(LinkedList<Integer> o1, LinkedList<Integer> o2) {
                if (o1.size() != o2.size()) {
                    return o1.size() - o2.size();
                } else {
                    Iterator<Integer> iter1 = o1.iterator();
                    Iterator<Integer> iter2 = o2.iterator();

                    while (iter1.hasNext() && iter2.hasNext()) {
                        Integer i1 = iter1.next();
                        Integer i2 = iter2.next();
                        if (i1 != i2) {
                            return i1 - i2;
                        }
                    }
                }
                return 0;
            }
        });

        Solution solution = new Solution();
        List<List<Integer>> results = solution.pathSum(t0, 22);

        Collections.sort(results, new Comparator<List<Integer>>() {
            @Override
            public int compare(List<Integer> o1, List<Integer> o2) {
                if (o1.size() != o2.size()) {
                    return o1.size() - o2.size();
                } else {
                    Iterator<Integer> iter1 = o1.iterator();
                    Iterator<Integer> iter2 = o2.iterator();

                    while (iter1.hasNext() && iter2.hasNext()) {
                        Integer i1 = iter1.next();
                        Integer i2 = iter2.next();
                        if (i1 != i2) {
                            return i1 - i2;
                        }
                    }
                }
                return 0;
            }
        });

        assertEquals(expectedResult, results);
    }

    @Test
    public void testPathSum2() {
        LinkedList<LinkedList<Integer>> expectedResult = new LinkedList<LinkedList<Integer>>();

        Collections.sort(expectedResult, new Comparator<LinkedList<Integer>>() {
            @Override
            public int compare(LinkedList<Integer> o1, LinkedList<Integer> o2) {
                if (o1.size() != o2.size()) {
                    return o1.size() - o2.size();
                } else {
                    Iterator<Integer> iter1 = o1.iterator();
                    Iterator<Integer> iter2 = o2.iterator();

                    while (iter1.hasNext() && iter2.hasNext()) {
                        Integer i1 = iter1.next();
                        Integer i2 = iter2.next();
                        if (i1 != i2) {
                            return i1 - i2;
                        }
                    }
                }
                return 0;
            }
        });

        Solution solution = new Solution();
        List<List<Integer>> results = solution.pathSum(null, 1);

        Collections.sort(results, new Comparator<List<Integer>>() {
            @Override
            public int compare(List<Integer> o1, List<Integer> o2) {
                if (o1.size() != o2.size()) {
                    return o1.size() - o2.size();
                } else {
                    Iterator<Integer> iter1 = o1.iterator();
                    Iterator<Integer> iter2 = o2.iterator();

                    while (iter1.hasNext() && iter2.hasNext()) {
                        Integer i1 = iter1.next();
                        Integer i2 = iter2.next();
                        if (i1 != i2) {
                            return i1 - i2;
                        }
                    }
                }
                return 0;
            }
        });

        assertEquals(expectedResult, results);
    }
}