#include <iostream>

using namespace std;

int list[14] = {3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121};

void multiple()
{
    for (int i = 0; i < 14; i++)
    {
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

        cout << "The sum of the digits for " << list[i] << " is " << sum << " which is " << (even ? "Odd" : "Even") << endl;
    }
}

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

        cout << "The Number " << number << " is" << (answer ? " a prime" : " not a prime") << endl;
    }
}

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

        cout << "The Number " << reversed << " is" << (answer ? " a Palindrome of itself" : " not a Palindrom of itself") << endl;
    }
}

void printArray(float *arr, size_t size)
{
}

void arraySorter(float *arr, size_t size)
{
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

void arrayMaker(float *arr, float *arr2, float *arr3, size_t size, size_t size2)
{
    int i = 0;
    for (i = 0; i < size; i++)
    {
        arr3[i] = arr[i];
    }
    for (int j = 0; j < size2; j++)
    {
        arr3[i] = arr2[i];
        i++;
    }
}

void partA()
{
    multiple();
    sum();
    prime();
    palindrome();
}

void partB()
{
    float system[] = {1, 2, 3, 4, 5, 6, 7, 12.4362, 24654.1234, 1234475.234, .00234923, .2341, 13, 14, 15};
    float Programming[] = {.123, 13462234, 8756, 3456345, 3452, .2345237543, .74567, 2345634.3456, 48753.3456, 4356, 345345, 343562345};

    size_t size = sizeof(system) / sizeof(system[0]);
    size_t size2 = sizeof(Programming) / sizeof(Programming[0]);

    printArray(system, size);
    printArray(Programming, size2);

    arraySorter(system, size);
    arraySorter(Programming, size2);

    size_t size3 = size + size2;
    float newArray[size3];

    arrayMaker(system, Programming, newArray, size, size2);
}

int main()
{
    partA();
    partB();

    return 0;
}
