package convertSortedArraytoBinarySearchTree;


/** Definition for a binary tree node. */
class TreeNode {
     int val;
     TreeNode left;
     TreeNode right;
     TreeNode(int x) { val = x; }
}

public class Solution {
    public TreeNode sortedArrayToBST(int[] nums) {
        if (nums.length == 0) {
            return null;
        }
        return sortedArrayPartialToBST(nums, 0, nums.length);
    }

    public TreeNode sortedArrayPartialToBST(int[] nums, int from, int to) {
        if (to - from < 1) {
            return null;
        }
        if (to - from == 1) {
            return new TreeNode(nums[from]);
        }

        int middle = (from + to) / 2;
        TreeNode root = new TreeNode(nums[middle]);
        root.left = sortedArrayPartialToBST(nums, from, middle);
        root.right = sortedArrayPartialToBST(nums, middle + 1, to);
        return root;
    }

}
