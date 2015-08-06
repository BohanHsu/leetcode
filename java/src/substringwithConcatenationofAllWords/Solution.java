package substringwithConcatenationofAllWords;

import java.util.*;

public class Solution {
    public List<Integer> findSubstring(String s, String[] words) {
        LinkedList<Integer> results = new LinkedList<Integer>();
        HashMap<String, Integer> wordsMap = new HashMap<String, Integer>();

        int wordArrayLength = words.length;
        int wordLength = words[0].length();

        for (String str : words) {
            if (wordsMap.containsKey(str)) {
                wordsMap.put(str, wordsMap.get(str) + 1);
            } else {
                wordsMap.put(str, 1);
            }
        }

        HashMap<String, Integer> founded = new HashMap<String, Integer>();

        for (int h = 0; h < wordLength; h++) {
            int i = h;
            while (i <= s.length() - wordArrayLength * wordLength) {
                founded.clear();

                int j;
                for (j = 0; j < wordArrayLength; j++) {
                    int k = i + j * wordLength;
                    String subStr = s.substring(k, k + wordLength);

                    if (!wordsMap.containsKey(subStr)) {
                        break;
                    } else if (founded.containsKey(subStr) && founded.get(subStr) == wordsMap.get(subStr)) {
                        break;
                    } else {
                        if (founded.containsKey(subStr))
                            founded.put(subStr, founded.get(subStr) + 1);
                        else
                            founded.put(subStr, 1);
                    }
                }

                if (j == wordArrayLength) {
                    results.add(i);

                    while (i + wordLength <= s.length() - wordArrayLength * wordLength && compareSubString(s, i, i+wordLength, i + wordArrayLength * wordLength, i + wordArrayLength * wordLength + wordLength)) {
                        i += wordLength;
                        results.add(i);
                    }
                }

                i += wordLength;
            }
        }

        return results;
    }

    public boolean compareSubString(String s, int f1, int t1, int f2, int t2) {
        return s.substring(f1, t1).equals(s.substring(f2, t2));
    }
}
