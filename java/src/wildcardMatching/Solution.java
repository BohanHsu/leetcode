package wildcardMatching;

public class Solution {

    public boolean isCharMatch(char cs, char cp) {
        return cp == '?' || cs == cp;
    }

    public boolean isMatch(String s, String p) {

        //System.out.println("s=" + s + ", p=" + p);

        int lenS = s.length();
        int lenP = p.length();
        int lastS = -1;
        int lastP = -1;
        int i = 0;
        int j = 0;

        while (i < lenS) {
            //System.out.println("i=" + i + ", j=" + j);
            if (j == lenP) {
                if (lastP == lenP) {
                    return true;
                } else {
                    if (lastS == -1 || lastP == -1) {
                        return false;
                    } else {
                        int k = 1;
                        while (lastS + k < lenS && !isCharMatch(s.charAt(lastS + k), p.charAt(lastP))) {
                            k+=1;
                        }
                        lastS += k;
                        i = lastS + 1;
                        j = lastP + 1;
                    }

                }
            } else {
                if (p.charAt(j) != '*' && isCharMatch(s.charAt(i), p.charAt(j))) {
                    i++;
                    j++;
                } else if (p.charAt(j) == '*') {
                    lastS = i;
                    lastP = j + 1;
                    j = lastP;
                } else if (lastS != -1 && lastP != -1) {
                    int k = 1;
                    while (lastS + k < lenS && !isCharMatch(s.charAt(lastS + k), p.charAt(lastP))) {
                        k += 1;
                    }
                    lastS += k;
                    i = lastS + 1;
                    j = lastP + 1;
                } else {
                    return false;
                }
            }
        }

        if (i == lenS && j == lenP)
            return true;

        if (i == lenS && j < lenP) {

            while (j < lenP) {
                if (p.charAt(j) != '*') {
                    return false;
                }
                j++;
            }

            return true;
        }
        return false;
    }
}
