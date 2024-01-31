/**
 * hello
 */
public class hello {

    private static int[] array = {3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121};
    private static float[] first = {1.23f,2341.2134f,12432f};
    private static float[] second = {9034905.123f, 2341.3452f,.0001293f, .83927841f, .297348f};
    private static float[] third;
    
    public static void main(String[] args) {
        partA();
        partB();
    }

    private static void multiple()
    {
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
    
            if(answer)
                System.out.println("The Number " + number + " is a prime");
            else
                System.out.println("The Number " + number + " is not a prime");
        }
    }
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
    
            boolean answer = false;
            if (original == reversed)
                answer = true;
    
            if(answer)
                System.out.println("The Number " + reversed + " is a Palindrome of itself");
            else
                System.out.println("The Number " + reversed + " is not a Palindrome of itself");
        }
    }
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

    private static void partA()
    {
        multiple();
        sum();
        prime();
        palindrome();
    }

    private static void printArray(float[] arr)
    {
        for (float i : arr) {
            System.out.print(i + " ");
        }
    }

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

    private static void arrayMaker(float[] arr, float[] arr2)
    {
        int i = 0;
        // Put array 1 into larger array
        for (i = 0; i < arr.length; i++)
        {
            third[i] = arr[i];
        }
        // put array 2 into larger array
        for (int j = 0; j < arr2.length; j++)
        {
            third[i] = arr2[j];
            i++;
        }
    }

    private static void partB()
    {
        System.out.println("Part B of Assignment");
        System.out.println("Before Sorted Arrays: ");
        printArray(first);
        printArray(second);

        arraySorter(first);
        arraySorter(second);
        
        System.out.println("After Sorted Arrays: ");
        printArray(first);
        printArray(second); 

        System.out.println("Merged Array: ");
        arrayMaker(first, second);
        printArray(third);
    }
}