/**
 * hello
 */
public class hello {

    public static int[] array = {3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121};
    
    public static void main(String[] args) {
        multiple();
        prime();
        palindrome();
        sum();
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
}