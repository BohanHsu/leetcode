package _3SumClosest;

import java.util.Arrays;

public class Solution {
    public int threeSumClosest(int[] nums, int target) {
        int diff = Integer.MAX_VALUE;
        Arrays.sort(nums);

        int i = nums.length - 1;
        int j, k;

        while (i > 1) {
            j = 0;
            k = i - 1;

            while (j < k) {
                if (nums[i] + nums[j] + nums[k] == target) {
                    return target;
                } else {
                    if (Math.abs(nums[i] + nums[j] + nums[k] - target) < Math.abs(diff)) {
                        diff = nums[i] + nums[j] + nums[k] - target;
                    }
                }

                if (nums[i] + nums[j] + nums[k] > target) {
                    k--;
                } else if (nums[i] + nums[j] + nums[k] < target) {
                    j++;
                }
            }
            i--;
        }

        return target + diff;
    }
}
