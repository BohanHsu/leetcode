package minimumWindowSubstring;

import java.util.HashMap;

public class Solution {
    public String minWindow(String s, String t) {
        if (s.length() < t.length())
            return "";

        if (t.length() == 0)
            return "";

        HashMap<Character, Integer> charsMapT = new HashMap<Character, Integer>();

        for (char c : t.toCharArray()) {
            if (charsMapT.containsKey(c)) {
                charsMapT.put(c, charsMapT.get(c) + 1);
            } else {
                charsMapT.put(c, 1);
            }
        }

        int selectI = 0;
        int selectJ = 0;
        int i = 0;
        int j = 0;
        int minDiff = Integer.MAX_VALUE;

        HashMap<Character, Integer> windowMap = new HashMap<Character, Integer>();
        HashMap<Character, Integer> toFindMap = new HashMap<Character, Integer>(charsMapT);

        while (i <= s.length() - t.length() && j < s.length()) {
            //System.out.println("i=" + i + ", j=" + j);
            //HashMap<Character, Integer> windowMap = new HashMap<Character, Integer>();
            //HashMap<Character, Integer> toFindMap = new HashMap<Character, Integer>(charsMapT);

            while (j < s.length() && toFindMap.size() != 0) {
                char curChar = s.charAt(j);
                if (charsMapT.containsKey(curChar)) {
                    if (windowMap.containsKey(curChar)) {
                        windowMap.put(curChar, windowMap.get(curChar) + 1);
                    } else {
                        windowMap.put(curChar, 1);
                    }

                    if (toFindMap.containsKey(curChar)) {
                        if (toFindMap.get(curChar) == 1) {
                            toFindMap.remove(curChar);
                        } else {
                            toFindMap.put(curChar, toFindMap.get(curChar) - 1);
                        }
                    }
                }
                j++;
            }

            while (i < j) {
                char curChar = s.charAt(i);

                if (charsMapT.containsKey(curChar)) {
                    if (windowMap.containsKey(curChar) && windowMap.get(curChar) > charsMapT.get(curChar)) {
                        windowMap.put(curChar, windowMap.get(curChar) - 1);
                    } else {
                        if (toFindMap.size() == 0) {
                            if (j - i < minDiff) {
                                minDiff = j - i;
                                selectI = i;
                                selectJ = j;
                            }

//                            i += 1;
//                            j = i;

                            windowMap.put(curChar, windowMap.get(curChar) - 1);
                            toFindMap.put(curChar, 1);
                            i++;
                            break;
                        }
                    }
                }
                i++;
            }
        }

        //System.out.println("selectI=" + selectI + ", selectJ=" + selectJ);

        return s.substring(selectI, selectJ);
    }
}
