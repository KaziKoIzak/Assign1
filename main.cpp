// Library Inclusion
#include <iostream>
#include <cmath>
#include <vector>
#include <algorithm>

using namespace std;

// Global Array
int list[14] = {3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121};

/*
    Name: Multiple
    In Args: None
    Out Args: None
    Definition: This function takes care of checking if the element in the array is a multiple of 7, 11, or
    13. This is done by performing a mathematical operation with the modulo
*/
void multiple()
{
    // Loop to go through the array
    for (int i = 0; i < 14; i++)
    {
        // If statement to check if the number is a multiple of either 7, 11, or 13
        if (list[i] % 1001 == 0)
            cout << "The number " << list[i] << " is a multiple of 7,11,13" << endl;
        else if (list[i] % 77 == 0)
            cout << "The number " << list[i] << " is a multiple of 7,11" << endl;
        else if (list[i] % 91 == 0)
            cout << "The number " << list[i] << " is a multiple of 7,13" << endl;
        else if (list[i] % 143 == 0)
            cout << "The number " << list[i] << " is a multiple of 11,13" << endl;
        else if (list[i] % 11 == 0)
            cout << "The number " << list[i] << " is a multiple of 11" << endl;
        else if (list[i] % 7 == 0)
            cout << "The number " << list[i] << " is a multiple of 7" << endl;
        else if (list[i] % 13 == 0)
            cout << "The number " << list[i] << " is a multiple of 13" << endl;
        else
            cout << "The number " << list[i] << " is not a multiple of 7, 11, 13" << endl;
    }
}

/*
    Name: Sum
    In Args: None
    Out Args: None
    Definition: This function takes care of checking if the element in the array has the sum of the digits
    equal an odd or an even number.
*/
void sum()
{
    int number = 0;
    for (int i = 0; i < 14; i++)
    {
        int sum = 0;
        number = list[i];

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

        bool even = sum % 2;

        // Tell the user
        cout << "The sum of the digits for " << list[i] << " is " << sum << " which is " << (even ? "Odd" : "Even") << endl;
    }
}

/*
    Name: Prime
    In Args: None
    Out Args: None
    Definition: This function takes care of checking if the element in the array is a prime or not. This is
    done checking every number for 2 to the square root of 2 of that number. This is because the middle number
    that can multiply to the number is the other number being a difference of 0 is the square root of that number
*/
void prime()
{
    int number = 0;
    for (int i = 0; i < 14; i++)
    {
        bool answer = true;

        number = list[i];

        // Check for divisibility by numbers from 2 to the square root of the number
        for (int j = 2; j <= sqrt(number); ++j)
        {
            if (number % j == 0)
            {
                // If the number is divisible, it's not prime
                answer = false;
            }
        }

        // Tell the user the results
        cout << "The Number " << number << " is" << (answer ? " a prime" : " not a prime") << endl;
    }
}

/*
    Name: Palindrom
    In Args: None
    Out Args: None
    Definition: This function takes care of checking if the element in the array is a palindrome by putting
    the reversed number into a temporary number and checking the values later.
*/
void palindrome()
{
    int number = 0;

    for (int i = 0; i < 14; i++)
    {
        int reversed = 0;
        int original = number = list[i];

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

        bool answer = false;
        if (original == reversed)
            answer = true;

        // Tell the user if the number is a palindrome
        cout << "The Number " << reversed << " is" << (answer ? " a Palindrome of itself" : " not a Palindrom of itself") << endl;
    }
}

/*
    Name: Print Array
    In Args: Array and Size
    Out Args: None
    Definition: This function takes care of printing the elements of an array
*/
void printArray(float *arr, size_t size)
{
    // Go through every element of the array and print them
    for (int i = 0; i < size; i++)
    {
        cout << arr[i] << " ";
    }
    cout << endl;
}

/*
    Name: Array Sorter
    In Args: Array, Size
    Out Args: None
    Definition: This function takes care of using the bubble sort algorithm to sort the array from smallest
    to largest.
*/
void arraySorter(float *arr, size_t size)
{
    // Bubble sort algorithm
    for (int i = 0; i < size - 1; ++i)
    {
        for (int j = 0; j < size - i - 1; ++j)
        {
            // Swap if the element found is greater than the next element
            if (arr[j] > arr[j + 1])
            {
                swap(arr[j], arr[j + 1]);
            }
        }
    }
}

/*
    Name: Array Makeer
    In Args: Array 1, Array 2, Array 3, size, size2
    Out Args: None
    Definition: This function takes care of combining the sorted arrays and merging them into one giant
    array with the first half sorted to the first array and second half sorted with the second array
*/
void arrayMaker(float *arr, float *arr2, float *arr3, size_t size, size_t size2)
{
    int i = 0;
    // Put array 1 into larger array
    for (i = 0; i < size; i++)
    {
        arr3[i] = arr[i];
    }
    // put array 2 into larger array
    for (int j = 0; j < size2; j++)
    {
        arr3[i] = arr2[j];
        i++;
    }
}

/*
    Name: Part A
    In Args: None
    Out Args: None
    Definition: This function takes care of running Part A of the assignment
*/
void partA()
{
    // Print where we are at and then also print which function we are at
    cout << "Part A of Assignment" << endl;
    cout << "Multiple check of 7, 11, and 13" << endl;
    multiple();
    cout << "\nSum Check if Odd or Even Digits" << endl;
    sum();
    cout << "\nCheck if the number is a prime" << endl;
    prime();
    cout << "\nCheck if the number is a palindrome" << endl;
    palindrome();
}

/*
    Name: Remove Duplicates
    In Args: Array, size
    Out Args: None
    Definition: This function gets rid of duplicates in the array.
*/
void removeDuplicates(float arr[], size_t size)
{
    // Convert the array to a vector for convenience
    vector<float> uniqueVector(arr, arr + size);

    // Use the erase-remove idiom to remove duplicates
    uniqueVector.erase(unique(uniqueVector.begin(), uniqueVector.end()), uniqueVector.end());

    // Copy the unique elements back to the original array
    size = static_cast<int>(uniqueVector.size());
    copy(uniqueVector.begin(), uniqueVector.end(), arr);
}

/*
    Name: Part B
    In Args: None
    Out Args: None
    Definition: This function takes care of running Part B of the assignment
*/
void partB()
{
    cout << "\n\nPart B of the Assignment" << endl;

    // Declare float arrays
    float system[] = {1, 2, 3, 4, 5, 6, 7, 12.4362, 24654.1234, 1234475.234, .00234923, .2341, 13, 14, 15};
    float Programming[] = {1, 13462234, 8756, 3456345, 3452, .2345237543, .74567, 2345634.3456, 48753.3456, 4356, 345345, 695};

    // Get the size of the array
    size_t size = sizeof(system) / sizeof(system[0]);
    size_t size2 = sizeof(Programming) / sizeof(Programming[0]);

    // Print the arrays before they were sorted
    cout << "Arrays Before Sorted" << endl;

    printArray(system, size);
    printArray(Programming, size2);

    // Sort the array
    arraySorter(system, size);
    arraySorter(Programming, size2);

    cout << "\nArrays After Sorted" << endl;

    // Print the arrays after the sort
    printArray(system, size);
    printArray(Programming, size2);

    // Get the size of the new array from combining the size of the previous two arrays
    size_t size3 = size + size2;
    float newArray[size3];

    // Make the merged arary
    arrayMaker(system, Programming, newArray, size, size2);
    removeDuplicates(newArray, size3);

    cout << "\nMerged Array" << endl;

    // Print the merged array
    printArray(newArray, size3);
}

/*
    Name: Main
    In Args: None
    Out Args: None
    Definition: This is where the program beings
*/
int main()
{
    // Run part a then b
    partA();

    cout << "-------------------------------------------------------------------" << endl;

    partB();

    return 0;
}
