package substringwithConcatenationofAllWords;

import org.junit.Test;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

import static org.junit.Assert.*;

public class SolutionTest {

    @Test
    public void testFindSubstring() {
        String s = "barfoothefoobarman";
        String[] words = new String[]{"foo" , "bar"};
        LinkedList<Integer> expectedResult = new LinkedList<Integer>();
        expectedResult.add(0);
        expectedResult.add(9);

        List<Integer> results = new Solution().findSubstring(s, words);

        Collections.sort(results);

        assertEquals(expectedResult, results);
    }

    @Test
    public void testFindSubstring1() {
        String s = "barfoothefoobarfooman";
        String[] words = new String[]{"foo" , "bar"};
        LinkedList<Integer> expectedResult = new LinkedList<Integer>();
        expectedResult.add(0);
        expectedResult.add(9);
        expectedResult.add(12);

        List<Integer> results = new Solution().findSubstring(s, words);

        Collections.sort(results);

        assertEquals(expectedResult, results);
    }

    @Test
    public void testFindSubstring2() {
        String s = "foobarfoobar";
        String[] words = new String[]{"foo" , "bar"};
        LinkedList<Integer> expectedResult = new LinkedList<Integer>();
        expectedResult.add(0);
        expectedResult.add(3);
        expectedResult.add(6);

        List<Integer> results = new Solution().findSubstring(s, words);

        Collections.sort(results);

        assertEquals(expectedResult, results);
    }

    @Test
    public void testFindSubstring3() {
        String s = "wordgoodgoodgoodbestword";
        String[] words = new String[]{"word","good","best","good"};
        LinkedList<Integer> expectedResult = new LinkedList<Integer>();
        expectedResult.add(8);

        List<Integer> results = new Solution().findSubstring(s, words);

        Collections.sort(results);

        assertEquals(expectedResult, results);
    }
}