package sortColors;

public class Solution {
    public void swap(int[] nums, int i, int j) {
        int tmp = nums[i];
        nums[i] = nums[j];
        nums[j] = tmp;
    }

    public void sortColors(int[] nums) {
        int i = -1;
        int j = -1;
        int k = 0;

        for (k = 0; k < nums.length; k++) {
            if (nums[k] == 0) {
                swap(nums, k, ++j);
                swap(nums, j, ++i);
            } else if (nums[k] == 1) {
                swap(nums, k, ++j);
            } else if (nums[k] == 2) {
            }
        }
    }
}
