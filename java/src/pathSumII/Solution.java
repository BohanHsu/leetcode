package pathSumII;

import java.util.*;

/** Definition for a binary tree node.*/
class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    TreeNode(int x) { val = x; }
}

public class Solution {
    public List<List<Integer>> pathSum(TreeNode root, int sum) {
        List<List<Integer>> results = new LinkedList<List<Integer>>();
        if (root == null)
            return results;

        HashMap<TreeNode, Integer> sumMap = new HashMap<TreeNode, Integer>();
        HashMap<TreeNode, TreeNode> parentMap = new HashMap<TreeNode, TreeNode>();
        HashSet<TreeNode> tailSet = new HashSet<TreeNode>();

        sumMap.put(root, root.val);

        Queue<TreeNode> queue = new LinkedList<TreeNode>();
        queue.add(root);

        TreeNode tn = null;
        while (!queue.isEmpty()) {
            tn = queue.poll();

            if (sumMap.get(tn) == sum && tn.left == null && tn.right == null)
                tailSet.add(tn);
            if (tn.left != null) {
                queue.add(tn.left);
                parentMap.put(tn.left, tn);
                sumMap.put(tn.left, (sumMap.get(tn) + tn.left.val));
            }

            if (tn.right != null) {
                queue.add(tn.right);
                parentMap.put(tn.right, tn);
                sumMap.put(tn.right, (sumMap.get(tn) + tn.right.val));
            }
        }

        for (TreeNode tail : tailSet) {
            LinkedList<Integer> path = new LinkedList<Integer>();
            tn = tail;

            while (tn != null) {
                path.add(0, tn.val);
                tn = parentMap.get(tn);
            }

            results.add(path);
        }

        return results;
    }
}
