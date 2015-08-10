package convertSortedArraytoBinarySearchTree;

import _3sum.*;
import org.junit.Test;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

import static org.junit.Assert.*;

/**
 * Created by bohan on 8/10/15.
 */
public class SolutionTest {

    public boolean balanced(TreeNode root) {
        if (root == null) {
            return true;
        }

        Queue<TreeNode> queue = new LinkedList<TreeNode>();
        queue.add(root);

        while (!queue.isEmpty()) {
            TreeNode tn = queue.poll();
            int leftDepth = depth(tn.left);
            int rightDepth = depth(tn.right);
            if (leftDepth - rightDepth > 1 || leftDepth - rightDepth < -1) {
                return false;
            }
        }
        return true;
    }

    public int depth(TreeNode root) {
        if (root == null) {
            return 0;
        }
        if (root.left == null && root.right == null) {
            return 1;
        }

        int leftDepth = depth(root.left);
        int rightDepth = depth(root.right);

        return leftDepth > rightDepth ? leftDepth : rightDepth;
    }

    public ArrayList<Integer> inOrderTraverse(TreeNode root) {
        ArrayList<Integer> results = new ArrayList<Integer>();

        Stack<TreeNode> stack = new Stack<TreeNode>();

        TreeNode tn = root;

        while (!stack.isEmpty() || tn != null) {
            if (tn == null) {
                tn = stack.pop();
                results.add(tn.val);

                tn = tn.right;
            } else {
                while (tn != null) {
                    stack.push(tn);
                    tn = tn.left;
                }
            }
        }

        return results;
    }

    @Test
    public void testSortedArrayToBST1() {
        int[] nums = {1,2,3,4,5,6,7,8};
        Solution solution = new Solution();
        TreeNode root = solution.sortedArrayToBST(nums);
        ArrayList<Integer> expectedReuslt = new ArrayList<Integer>();
        for (int i : nums) {
            expectedReuslt.add(i);
        }

        assertEquals(true, balanced(root));
        assertEquals(expectedReuslt, inOrderTraverse(root));
    }

    @Test
    public void testSortedArrayToBST2() {
        int[] nums = {1,2,3,4,5,6,7,8,9};
        Solution solution = new Solution();
        TreeNode root = solution.sortedArrayToBST(nums);
        ArrayList<Integer> expectedReuslt = new ArrayList<Integer>();
        for (int i : nums) {
            expectedReuslt.add(i);
        }

        assertEquals(true, balanced(root));
        assertEquals(expectedReuslt, inOrderTraverse(root));
    }

    @Test
    public void testSortedArrayToBSTCornerCase1() {
        int[] nums = {};
        Solution solution = new Solution();
        TreeNode root = solution.sortedArrayToBST(nums);
        ArrayList<Integer> expectedReuslt = new ArrayList<Integer>();
        for (int i : nums) {
            expectedReuslt.add(i);
        }

        assertEquals(true, balanced(root));
        assertEquals(expectedReuslt, inOrderTraverse(root));
    }

    @Test
    public void testSortedArrayToBSTCornerCase2() {
        int[] nums = {2};
        Solution solution = new Solution();
        TreeNode root = solution.sortedArrayToBST(nums);
        ArrayList<Integer> expectedReuslt = new ArrayList<Integer>();
        for (int i : nums) {
            expectedReuslt.add(i);
        }

        assertEquals(true, balanced(root));
        assertEquals(expectedReuslt, inOrderTraverse(root));
    }
}