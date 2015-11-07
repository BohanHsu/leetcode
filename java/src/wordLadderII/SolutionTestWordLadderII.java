package wordLadderII;

import org.junit.Test;

import java.util.*;

import static org.junit.Assert.*;

public class SolutionTestWordLadderII {
    @Test
    public void testGetAllSuccessor() {
        Solution solution = new Solution();
        HashSet<String> wordList = new HashSet<String>();
        String[] sArray = new String[]{"hot","dot","dog","lot","log"};

        for (String str : sArray) {
            wordList.add(str);
        }

        String word = sArray[0];
        String[] expectedResult = new String[]{"dot", "lot"};

        HashSet<String> result = solution.getAllSuccessor(word, wordList);
        assertEquals(expectedResult.length, result.size());

        for (String s : expectedResult) {
            assertTrue(result.contains(s));
        }

        word = sArray[1];
        result = solution.getAllSuccessor(word, wordList);

        expectedResult = new String[]{"hot", "dog", "lot"};
        assertEquals(expectedResult.length, result.size());

        for (String s : expectedResult) {
            assertTrue(result.contains(s));
        }
    }

    @Test
    public void testFindLadders() {
        Solution solution = new Solution();
        HashSet<String> wordList = new HashSet<String>();
        String[] sArray = new String[]{"hot","dot","dog","lot","log"};

        for (String str : sArray) {
            wordList.add(str);
        }

        LinkedList<LinkedList<String>> expectedResult = new LinkedList<>();
        String[][] expectedResultArray = new String[][]{
                new String[]{"hit","hot","dot","dog","cog"},
                new String[]{"hit","hot","lot","log","cog"}
        };

        for (String[] strs : expectedResultArray) {
            LinkedList<String> res = new LinkedList<String>();
            for (String str : strs) {
                res.add(str);
            }
            expectedResult.add(res);
        }

        Collections.sort(expectedResult, new Comparator<LinkedList<String>>() {
            @Override
            public int compare(LinkedList<String> o1, LinkedList<String> o2) {
                int len = o1.size();
                for (int i = 0; i < len; i++) {
                    if (!o1.get(i).equals(o2.get(i))) {
                        return o1.get(i).compareTo(o2.get(i));
                    }
                }
                return 0;
            }
        });

        List<List<String>> result = solution.findLadders("hit", "cog", wordList);
        Collections.sort(result, new Comparator<List<String>>() {
            @Override
            public int compare(List<String> o1, List<String> o2) {
                int len = o1.size();
                for (int i = 0; i < len; i++) {
                    if (!o1.get(i).equals(o2.get(i))) {
                        return o1.get(i).compareTo(o2.get(i));
                    }
                }
                return 0;
            }
        });

        assertEquals(expectedResult.size(), result.size());

        for (int i = 0; i < expectedResult.size(); i++) {
            assertEquals(expectedResult.get(i).size(), result.get(i).size());
            for (int j = 0; j < expectedResult.get(i).size(); j++) {
                assertEquals(expectedResult.get(i).get(j), result.get(i).get(j));
            }
        }
    }

    @Test
    public void testFindLadders2() {
        Solution solution = new Solution();
        HashSet<String> wordList = new HashSet<String>();
        String[] sArray = new String[]{"hot","dog","dot"};

        for (String str : sArray) {
            wordList.add(str);
        }

        LinkedList<LinkedList<String>> expectedResult = new LinkedList<>();
        String[][] expectedResultArray = new String[][]{
                new String[]{"hot","dot","dog"}
        };

        for (String[] strs : expectedResultArray) {
            LinkedList<String> res = new LinkedList<String>();
            for (String str : strs) {
                res.add(str);
            }
            expectedResult.add(res);
        }

        Collections.sort(expectedResult, new Comparator<LinkedList<String>>() {
            @Override
            public int compare(LinkedList<String> o1, LinkedList<String> o2) {
                int len = o1.size();
                for (int i = 0; i < len; i++) {
                    if (!o1.get(i).equals(o2.get(i))) {
                        return o1.get(i).compareTo(o2.get(i));
                    }
                }
                return 0;
            }
        });

        List<List<String>> result = solution.findLadders("hot", "dog", wordList);
        Collections.sort(result, new Comparator<List<String>>() {
            @Override
            public int compare(List<String> o1, List<String> o2) {
                int len = o1.size();
                for (int i = 0; i < len; i++) {
                    if (!o1.get(i).equals(o2.get(i))) {
                        return o1.get(i).compareTo(o2.get(i));
                    }
                }
                return 0;
            }
        });

        assertEquals(expectedResult.size(), result.size());

        for (int i = 0; i < expectedResult.size(); i++) {
            assertEquals(expectedResult.get(i).size(), result.get(i).size());
            for (int j = 0; j < expectedResult.get(i).size(); j++) {
                assertEquals(expectedResult.get(i).get(j), result.get(i).get(j));
            }
        }
    }

    @Test
    public void testFindLadders3() {
        Solution solution = new Solution();
        HashSet<String> wordList = new HashSet<String>();
        String[] sArray = new String[]{"ted","tex","red","tax","tad","den","rex","pee"};

        for (String str : sArray) {
            wordList.add(str);
        }

        LinkedList<LinkedList<String>> expectedResult = new LinkedList<>();
        String[][] expectedResultArray = new String[][]{
                new String[]{"red","ted","tad","tax"},
                new String[]{"red","ted","tex","tax"},
                new String[]{"red","rex","tex","tax"}
        };

        for (String[] strs : expectedResultArray) {
            LinkedList<String> res = new LinkedList<String>();
            for (String str : strs) {
                res.add(str);
            }
            expectedResult.add(res);
        }

        Collections.sort(expectedResult, new Comparator<LinkedList<String>>() {
            @Override
            public int compare(LinkedList<String> o1, LinkedList<String> o2) {
                int len = o1.size();
                for (int i = 0; i < len; i++) {
                    if (!o1.get(i).equals(o2.get(i))) {
                        return o1.get(i).compareTo(o2.get(i));
                    }
                }
                return 0;
            }
        });

        List<List<String>> result = solution.findLadders("red", "tax", wordList);
        Collections.sort(result, new Comparator<List<String>>() {
            @Override
            public int compare(List<String> o1, List<String> o2) {
                int len = o1.size();
                for (int i = 0; i < len; i++) {
                    if (!o1.get(i).equals(o2.get(i))) {
                        return o1.get(i).compareTo(o2.get(i));
                    }
                }
                return 0;
            }
        });

        assertEquals(expectedResult.size(), result.size());

        for (int i = 0; i < expectedResult.size(); i++) {
            assertEquals(expectedResult.get(i).size(), result.get(i).size());
            for (int j = 0; j < expectedResult.get(i).size(); j++) {
                assertEquals(expectedResult.get(i).get(j), result.get(i).get(j));
            }
        }
    }

    @Test
    public void testFindLadders4() {
        Solution solution = new Solution();
        HashSet<String> wordList = new HashSet<String>();
        String[] sArray = new String[]{"hot","dog"};

        for (String str : sArray) {
            wordList.add(str);
        }

        LinkedList<LinkedList<String>> expectedResult = new LinkedList<>();
        String[][] expectedResultArray = new String[][]{
        };

        for (String[] strs : expectedResultArray) {
            LinkedList<String> res = new LinkedList<String>();
            for (String str : strs) {
                res.add(str);
            }
            expectedResult.add(res);
        }

        Collections.sort(expectedResult, new Comparator<LinkedList<String>>() {
            @Override
            public int compare(LinkedList<String> o1, LinkedList<String> o2) {
                int len = o1.size();
                for (int i = 0; i < len; i++) {
                    if (!o1.get(i).equals(o2.get(i))) {
                        return o1.get(i).compareTo(o2.get(i));
                    }
                }
                return 0;
            }
        });

        List<List<String>> result = solution.findLadders("hot", "dog", wordList);
        Collections.sort(result, new Comparator<List<String>>() {
            @Override
            public int compare(List<String> o1, List<String> o2) {
                int len = o1.size();
                for (int i = 0; i < len; i++) {
                    if (!o1.get(i).equals(o2.get(i))) {
                        return o1.get(i).compareTo(o2.get(i));
                    }
                }
                return 0;
            }
        });

        assertEquals(expectedResult.size(), result.size());

        for (int i = 0; i < expectedResult.size(); i++) {
            assertEquals(expectedResult.get(i).size(), result.get(i).size());
            for (int j = 0; j < expectedResult.get(i).size(); j++) {
                assertEquals(expectedResult.get(i).get(j), result.get(i).get(j));
            }
        }
    }
}