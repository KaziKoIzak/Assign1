/**
 * hello
 */
public class hello {
    /*
     * This is the variable Declerations
     */
    private static int[] array = {3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121};
    private static float[] first = {1.23f,2341.2134f,12432f, .5675f, .5745f, .584568f};
    private static float[] second = {9034905.123f, 2341.3452f,.0001293f, .83927841f, .297348f};
    private static float[] third;
    
    /*
     * Name: Main
     * Arguments: Command Line Arguments
     * Definition: It starts and runs the program and is responsible for activating Part A and Part B of the
     * Assignment
     */
    public static void main(String[] args) {
        System.out.println("Part A of Assignment");
        partA();
        System.out.println("\n\nPart B of Assignment");
        partB();
    }

    /*
     * Name: Multiple
     * Arguments: None
     * Definition: This function is in charge of checking on what the multiple of the function is and to see
     * if it is a multiple of 7, 11, or 13
     */
    private static void multiple()
    {
        //This for loops goes through the whole loop and checks the validity of each statement to make sure
        //and check if array is a mutliple
        for (int i = 0; i < array.length; i++)
        {
            if (array[i] % 1001 == 0)
                System.out.println("The number " + array[i] +  " is a multiple of 7, 11, 13");
            else if (array[i] % 77 == 0)
                System.out.println("The number " + array[i] +  " is a multiple of 7, 11");
            else if (array[i] % 91 == 0)
                System.out.println("The number " + array[i] +  " is a multiple of 7, 13");
            else if (array[i] % 143 == 0)
                System.out.println("The number " + array[i] +  " is a multiple of 11, 13");
            else if (array[i] % 11 == 0)
                System.out.println("The number " + array[i] +  " is a multiple of 11");
            else if (array[i] % 7 == 0)
                System.out.println("The number " + array[i] +  " is a multiple of 7");
            else if (array[i] % 13 == 0)
                System.out.println("The number " + array[i] +  " is a multiple of 13");
            else
                System.out.println("The number " + array[i] +  " is not a multiple of 7, 11, 13");
        }
    }

    /*
     * Name: Prime
     * Arguments: None
     * Definition: This function checks if the number is a prime or not with the logic of checking every number
     * from 2 to square root of 2 where the cycle ends
     */
    private static void prime()
    {
        int number = 0;
        for (int i = 0; i < array.length; i++)
        {
            boolean answer = true;
    
            number = array[i];
    
            // Check for divisibility by numbers from 2 to the square root of the number
            for (int j = 2; j <= Math.sqrt(number); ++j)
            {
                if (number % j == 0)
                {
                    // If the number is divisible, it's not prime
                    answer = false;
                }
            }
    
            //Tell the user if it is a prime or not
            if(answer)
                System.out.println("The Number " + number + " is a prime");
            else
                System.out.println("The Number " + number + " is not a prime");
        }
    }

    /*
     * Name: Palindrome
     * Arguments: None
     * Definition: This function is in charge of making sure the answer is a palindrome or not by slowly
     * putting the number into a temporary variable that allows it to check the value at the end for it and
     * if they are the same they are a palindrome
     */
    private static void palindrome()
    {
        int number = 0;

        for (int i = 0; i < array.length; i++)
        {
            int reversed = 0;
            int original = number = array[i];
    
            // Iterate through each digit of the number
            while (number != 0)
            {
                // Extract the last digit
                int digit = number % 10;
    
                // Append the digit to the reversed number (shift left and add the digit)
                reversed = reversed * 10 + digit;
    
                // Remove the last digit from the number
                number /= 10;
            }
    
            //Check if the answer is a palindrome
            boolean answer = false;
            if (original == reversed)
                answer = true;
    
            //Tell user the answer
            if(answer)
                System.out.println("The Number " + reversed + " is a Palindrome of itself");
            else
                System.out.println("The Number " + reversed + " is not a Palindrome of itself");
        }
    }

    /*
     * Name: Sum
     * Arguments: None
     * Definition: This function is in chrge of adding the sum of each of the digits of the number in order
     * to check if the sum of the digits is odd or even. 
     */
    private static void sum()
    {
        int number = 0;
        for (int i = 0; i < array.length; i++)
        {
            int sum = 0;
            number = array[i];
    
            // Iterate through each digit of the number
            while (number != 0)
            {
                // Extract the last digit
                int digit = number % 10;
    
                // Add the digit to the sum
                sum += digit;
    
                // Remove the last digit from the number
                number /= 10;
            }
    
            int even = sum % 2;
    
            //Tell the user the answer of the number
            switch (even) {
                case 0:
                    System.out.println("The sum of the digits for " + array[i] +  " is " + sum + " which is even");
                    break;
                case 1:
                    System.out.println("The sum of the digits for " + array[i] +  " is " + sum + " which is odd");
                    break;
            }
        }
    }

    /*
     * Name: PartA
     * Arguments: None
     * Definition: This function runs Part A of the assignment to call Multiple, Sum, Prime and Palindrome
     * This is done here
     */
    private static void partA()
    {
        //The user gets told which function is going to be activated
        System.out.println("Multiples of 7, 11 or 13: ");
        multiple();
        System.out.println("\nSum of digits is odd or even: ");
        sum();
        System.out.println("\nNumber is Prime or not: ");
        prime();
        System.out.println("\nNumber is a palindrom or not:");
        palindrome();
    }

    /*
     * Name: Print Array
     * Arguments: Float Aray
     * Definition: This function prints out arrays
     */
    private static void printArray(float[] arr)
    {
        //Go through each element of the array in print it out
        for (float i : arr) {
            System.out.print(i + " ");
        }
        System.out.println("\n");
    }

    /*
     * Name: Array Sorter
     * Arguments: Array
     * Definition: This function using a bubble sort to sort the array
     */
    private static void arraySorter(float[] arr)
    {
        int n = arr.length;

        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                // Compare adjacent elements and swap if they are in the wrong order
                if (arr[j] > arr[j + 1]) {
                    // Swap arr[j] and arr[j+1]
                    float temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
    }

    /*
     * Name: Array Maker
     * Arguments: None
     * Definition: This array maker is in charge of combining both the first arrays into a larger second
     * array that has each array merged sepereately beforehand
     */
    private static void arrayMaker()
    {
        int j = 0;
        // Put array 1 into larger array
        for (float i : first) {
            third[j] = i;
            j++;
        }
        // put array 2 into larger array
        for (float i : second) {
            third[j] = i;
        }
    }

    private static void partB()
    {
        //This tells the user what is currently happeing by printing the unsorted arrates
        System.out.println("Before Sorted Arrays: ");
        printArray(first);
        printArray(second);

        //Sorts the arrays
        arraySorter(first);
        arraySorter(second);
        
        //Shows the user sorted arrays
        System.out.println("\nAfter Sorted Arrays: ");
        printArray(first);
        printArray(second); 

        //Combines the array
        System.out.println("\nMerged Array: ");
        arrayMaker();
        printArray(third);
    }
}