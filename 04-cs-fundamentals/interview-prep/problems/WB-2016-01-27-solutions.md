# Whiteboarding Role Play

## The problem
Given an array of non-negative numbers, write a function to determine if any two numbers sum to 10.

## Videos
Video PW is octothorp
+ Charles: 
+ Jeremy: https://vimeo.com/153441061
+ Crystal: https://vimeo.com/153441144

## Sample solutions
Solutions written by Crystal -- probably not error free ;)

``` java 
import java.util.Arrays;
import java.util.HashMap;

public class WhiteboardProblems
{
    public static void main(String[] args)
    {
        int[] numbers = {1,228,9,4,80,10};      
        assert bruteForce(numbers) == true : "BF: Uh roh. Didn't find 1,9 = 10";
        assert sortedBruteForce(numbers) == true : "SBF: Uh roh. Didn't find 1,9 = 10";
        assert mapSolution(numbers) == true : "Map: Uh roh. Didn't find 1,9 = 10";
        assert arraySolution(numbers) == true : "Array: Uh roh. Didn't find 1,9 = 10";
        System.out.println("PASS - 1+9 = 10");

        int[] numbers2 = {0,100,342,22,34};
        assert bruteForce(numbers2) == false : "BF: Uh roh. Thinks things sum to 10, but they don't";
        assert sortedBruteForce(numbers2) == false : "SBF: Uh roh. Thinks things sum to 10, but they don't";
        assert mapSolution(numbers2) == false : "Map: Uh roh. Thinks things sum to 10, but they don't";
        assert arraySolution(numbers2) == false : "Array: Uh roh. Thinks things sum to 10, but they don't";
        System.out.println("PASS - Nothing sums to 10");

    }

    public static boolean bruteForce(int[] a)
    {
        for(int i = 0; i < a.length; i++)       // This loop is O(n)
            for(int j = i+1; j < a.length; j++) // This loop is O(n)
                if(a[i] + a[j] == 10)           // bc loops are nested, solution is O(n^2)
                    return true;
        return false;

        /* tiny optimization: only looks at futher numbers (j=i+1) instead of j starting at 0;
         * this also accounts for not getting a false positive bc of something like 
         * a[i] + a[j] == 10, when both i and j are the same index
         */ 
    
    }

    public static boolean sortedBruteForce(int[] a)
    {
        Arrays.sort(a);                             // Best case sorting is O(n log n)
        int index = 0;
        while(a[index] <= 10)                       // This loop is O(n) bc worst case all nums >= 10
        {
            for(int j = index+1; j < a.length; j++) // This loop is O(n)
                if(a[index] + a[j] == 10)
                    return true;                    // This solution is O(n^2) bc we do independent 
            index++;                                // big-o analysis in sequence and then choose worst
        }
        return false;

        /* this solution could claim to optimize the solution because we 'ignore' numbers that
         * are greater than 10; however, because we sort the numbers first, this solution is
         * actually worse, unless we were guaranteed the numbers were already in order,
         * and even then, the gain is negligible
         */
    }

    public static boolean mapSolution(int[] a)
    {
        HashMap<Integer,Integer> under10 = new HashMap<Integer,Integer>();
        //pre-fill map with mappings to 0 to prevent null exceptions later
        for(int i = 0; i < 11; i++)
            under10.put(i,0);

        // wanted to show a for-each loop in Java, but the following loop could have been written as:
        // for(int i = 0; i < a.length; i++) and then sub 'value' for 'a[i]' everywhere it appears.     
        for(int value : a)                                      // This loop is O(n)
            if(under10.containsKey(value))                  // This solution is O(n)
                under10.put( value, under10.get(value)+1 );

        // check for all the special combos for a true (SUMS 10)
        if(under10.get(5) >= 2) return true;                        
        if(under10.get(10) >= 1 && under10.get(0) >= 1) return true;
        if(under10.get(9) >= 1 && under10.get(1) >= 1) return true;
        if(under10.get(8) >= 1 && under10.get(2) >= 1) return true;
        if(under10.get(7) >= 1 && under10.get(3) >= 1) return true;
        if(under10.get(6) >= 1 && under10.get(4) >= 1) return true;

        return false; // We didn't find any of the special combos for a true

        /* In this solution we only traverse the data set once making tallying the
         * number of times each unique number appears in the array through aux storage of a (Hash)Map
         *      key = a specific value in the array
         *      value = number of times that specific value occured
         * Accessing key:value pairings in a HashMap is O(1) so the entire solution rounds out at O(n)
         *
         * Note that 'put' on a Map replaces the old value with the new value (no duplicate keys)
         * 
         * We could potentially optimize by not adding values<10 to the Map, but that doesn't change
         * our latency (time efficiency). It only changes our memory usage, but it's probably 
         * negligible anyway but maybe worth mentioning or asking what the expected range of values
         * within "non-negative" that we should expect
         */

    }

    public static boolean arraySolution(int[] a)
    {
        int[] countArray = new int[11];

        for(int value : a)                  // This loop is O(n)
            if(value <= 10)
                countArray[value]++;

        // check for all the special combos for a true (SUMS 10)
        if(countArray[5] >= 2) return true;
        if(countArray[10] >= 1 && countArray[0] >= 1) return true;
        if(countArray[9] >= 1 && countArray[1] >= 1) return true;
        if(countArray[8] >= 1 && countArray[2] >= 1) return true;
        if(countArray[7] >= 1 && countArray[3] >= 1) return true;
        if(countArray[6] >= 1 && countArray[4] >= 1) return true;

        return false; // We didn't find any of the special combos for a true
        
        /* This solution is basically the same as the above solution, but uses a native array
         * instead of a Map as auxillary storage
         */
        
    }   
}
```
