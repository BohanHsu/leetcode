package wordLadderII;

import java.util.*;

class Parent {
    int length;
    HashSet<String> parents;

    public Parent(int length) {
        this.length = length;
        this.parents = new HashSet<String>();
    }
}

public class Solution {
    public List<List<String>> findLadders(String beginWord, String endWord, Set<String> wordList) {
        List<List<String>> results = new LinkedList<List<String>>();
        int shortestPathLength = -1;

        Queue<String> queue1 = new LinkedList<String>();
        Queue<Integer> queue4 = new LinkedList<Integer>();
        HashMap<String, Parent> parent = new HashMap<>();

        HashSet<String> setWithEndWord = new HashSet<String>(wordList);
        setWithEndWord.add(endWord);

        HashMap<String, HashSet<String>> successors = new HashMap<String, HashSet<String>>();
        for (String str : wordList) {
            successors.put(str, getAllSuccessor(str, setWithEndWord));
        }
        successors.put(beginWord, getAllSuccessor(beginWord, setWithEndWord));

        queue1.add(beginWord);
        queue4.add(1);
        parent.put(beginWord, null);

        while (!queue1.isEmpty()) {
            String curWord = queue1.poll();
            Integer curLength = queue4.poll();
            for (String successor : successors.get(curWord)) {
                if (successor.equals(endWord)) {
                    if (shortestPathLength == -1) {
                        shortestPathLength = curLength;
                    }
                    if (curLength == shortestPathLength) {
                        if (!parent.containsKey(successor)) {
                            parent.put(successor, new Parent(curLength + 1));
                        }
                        parent.get(successor).parents.add(curWord);
                    }
                } else  {
                    if (!parent.containsKey(successor)) {
                        parent.put(successor, new Parent(curLength + 1));
                    }
                    if (parent.get(successor) != null && parent.get(successor).length == curLength + 1) {
                        queue1.add(successor);
                        queue4.add(curLength + 1);
                        parent.get(successor).parents.add(curWord);
                    }
                }
            }
        }


        String str = endWord;
        LinkedList<String> path = new LinkedList<String>();
        path.add(endWord);

        if (!parent.containsKey(endWord) || parent.get(endWord).parents.size() == 0) {
            return results;
        }

        results = generatePath(path, parent);

        return results;
    }

    public List<List<String>> generatePath(LinkedList<String> currentPath, HashMap<String, Parent> parents) {
        String head = currentPath.get(0);
        List<List<String>> results = new LinkedList<List<String>>();
        if (parents.get(head) == null) {
            results.add(currentPath);
            return results;
        }

        for (String newHead : parents.get(head).parents) {
            LinkedList<String> newPath = new LinkedList<String>(currentPath);
            newPath.add(0, newHead);
            results.addAll(generatePath(newPath, parents));
        }
        return results;
    }

    public HashSet<String> getAllSuccessor(String str, Set<String> wordList) {
        HashSet<String> result = new HashSet<String>();

        for (int idx = 0; idx < str.length(); idx++) {
            char[] chars = str.toCharArray();
            for (int c = 97; c < 123; c++) {
                chars[idx] = (char) c;
                String successor = String.valueOf(chars);
                if (!successor.equals(str) && wordList.contains(successor)) {
                    result.add(successor);
                }
            }
        }
        return result;
    }
}
