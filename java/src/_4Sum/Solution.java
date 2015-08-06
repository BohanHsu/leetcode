package _4Sum;

import java.util.*;

public class Solution {

    private class Node implements Comparable {
        protected int sum;
        protected int a;
        protected int b;

        public Node(int sum, int a, int b) {
            this.a = a;
            this.b = b;
            this.sum = sum;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            Node node = (Node) o;

            if (sum != node.sum) return false;
            if (a != node.a) return false;
            return b == node.b;

        }

        @Override
        public int hashCode() {
            int result = sum;
            result = 31 * result + a;
            result = 31 * result + b;
            return result;
        }

        @Override
        public int compareTo(Object o) {
            if (!(o instanceof Node)) {
                return 0;
            } else {
                Node n = (Node)o;
                if (this.sum == n.sum) {
                    if (this.a == n.a) {
                        return this.b - n.b;
                    } else {
                        return this.a - n.a;
                    }
                } else {
                    return this.sum - n.sum;
                }
            }
        }
    }

    private class ResultNode {
        int a, b, c, d;
        public ResultNode(int a, int b, int c, int d) {
            int[] arr = new int[4];
            arr[0] = a;
            arr[1] = b;
            arr[2] = c;
            arr[3] = d;
            Arrays.sort(arr);
            this.a = arr[0];
            this.b = arr[1];
            this.c = arr[2];
            this.d = arr[3];
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || getClass() != o.getClass()) return false;

            ResultNode that = (ResultNode) o;

            if (a != that.a) return false;
            if (b != that.b) return false;
            if (c != that.c) return false;
            return d == that.d;

        }

        @Override
        public int hashCode() {
            int result = a;
            result = 31 * result + b;
            result = 31 * result + c;
            result = 31 * result + d;
            return result;
        }
    }

    public List<List<Integer>> fourSum(int[] nums, int target) {
        List<List<Integer>> results = new LinkedList<List<Integer>>();
        HashSet<ResultNode> resultNodeSet = new HashSet<ResultNode>();
        Arrays.sort(nums);

        ArrayList<Node> nodeNums = new ArrayList<Node>(1 + (nums.length - 2) * (nums.length - 2) / 2);

        for (int i = 0; i < nums.length - 1; i++) {
            for (int j = i + 1; j < nums.length; j++) {
                nodeNums.add(new Node(nums[i] + nums[j], i, j));
            }
        }

        Collections.sort(nodeNums);

        int i = 0;
        int j = nodeNums.size() - 1;

        while (i < j) {
            if (nodeNums.get(i).sum + nodeNums.get(j).sum == target) {
                int ia = nodeNums.get(i).a;
                int ib = nodeNums.get(i).b;

                int l = j;
                while (l > i && nodeNums.get(l).sum + nodeNums.get(i).sum == target) {

                    int la = nodeNums.get(l).a;
                    int lb = nodeNums.get(l).b;
                    if (ia != la && ia != lb && la != ib && lb != ib) {
                        resultNodeSet.add(new ResultNode(nums[ia], nums[ib], nums[la], nums[lb]));
                    }
                    l--;
                }

                i++;
            } else if (nodeNums.get(i).sum + nodeNums.get(j).sum < target) {
                i++;
            } else if (nodeNums.get(i).sum + nodeNums.get(j).sum > target) {
                j--;
            }
        }

        for (ResultNode rn : resultNodeSet) {
            ArrayList<Integer> result = new ArrayList<Integer>();
            result.add(rn.a);
            result.add(rn.b);
            result.add(rn.c);
            result.add(rn.d);
            results.add(result);
        }

        return results;
    }
}
