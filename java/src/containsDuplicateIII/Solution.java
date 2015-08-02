package containsDuplicateIII;

import java.util.TreeSet;

/*
Given an array of integers, find out whether there are two distinct indices i and j in the array such that the
difference between nums[i] and nums[j] is at most t and the difference between i and j is at most k.
 */

public class Solution {
    public boolean containsNearbyAlmostDuplicate(int[] nums, int k, int t) {

        if (k < 1  || t < 0)
            return false;

        TreeSet<Integer> treeSet = new TreeSet<Integer>();


        for (int i = 0; i < nums.length; i++) {
            if (treeSet.floor(nums[i]) != null && nums[i] <= t + treeSet.floor(nums[i]))
                return true;

            if (treeSet.ceiling(nums[i]) != null && treeSet.ceiling(nums[i]) <= t + nums[i])
                return true;

            treeSet.add(nums[i]);
            if (i >= k)
                treeSet.remove(nums[i - k]);

        }

        return false;
    }
}
