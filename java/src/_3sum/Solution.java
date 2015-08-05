package _3sum;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

/*
    Given an array S of n integers, are there elements a, b, c in S such that a + b + c = 0? Find all unique triplets in the
    array which gives the sum of zero.

    Note:
    Elements in a triplet (a,b,c) must be in non-descending order. (ie, a ≤ b ≤ c)
    The solution set must not contain duplicate triplets.
    For example, given array S = {-1 0 1 2 -1 -4},

    A solution set is:
    (-1, 0, 1)
    (-1, -1, 2)
*/

public class Solution {
    public List<List<Integer>> threeSum(int[] nums) {
        Arrays.sort(nums);
        LinkedList<List<Integer>> results = new LinkedList<List<Integer>>();

        int i = nums.length - 1;

        while (i > 1) {
            List<List<Integer>> twoSumResult = twoSum(nums, i-1, -nums[i]);
            for (List<Integer> list : twoSumResult) {
                list.add(nums[i]);
            }
            results.addAll(twoSumResult);

            while (i > 2 && nums[i] == nums[i-1])
                i--;

            i--;
        }

        return results;
    }

    protected List<List<Integer>> twoSum(int[] nums, int to, int target) {
        LinkedList<List<Integer>> results = new LinkedList<List<Integer>>();

        int i = 0;
        int j = to;

        while (i < j) {
            //System.out.println("i=" + i + ",j=" + j);
            if (nums[i] + nums[j] < target) {
                i++;
            } else if (nums[i] + nums[j] > target) {
                j--;
            } else {
                ArrayList<Integer> foundResult = new ArrayList<Integer>(3);
                foundResult.add(nums[i]);
                foundResult.add(nums[j]);
                results.add(foundResult);

                while (i < to && nums[i] == nums[i+1]) {
                    i++;
                    if (i == j)
                        break;
                }
                i++;

                while (j > 0 && nums[j] == nums[j-1]) {
                    j--;
                    if (i == j)
                        break;
                }
                j--;
            }
        }
        return results;
    }

}
