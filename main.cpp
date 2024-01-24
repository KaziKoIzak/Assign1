#include <iostream>
#include <vector>
#include <random>
#include <chrono>

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

void arraySorter(vector<float> &sorting)
{
    int n = sorting.size();
    bool swapped;

    for (int i = 0; i < n - 1; ++i)
    {
        swapped = false;

        for (int j = 0; j < n - i - 1; ++j)
        {
            if (sorting[j] > sorting[j + 1])
            {
                swap(sorting[j], sorting[j + 1]);
                swapped = true;
            }
        }

        // If no swapping occurred in the inner loop, the array is already sorted
        if (!swapped)
        {
            break;
        }
    }
}

vector<float> arrayMaker(vector<float> first, vector<float> second)
{
    vector<float> temp;

    return temp;
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
    vector<float> firstOne = {3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 8769, 1011, 808, 121};
    vector<float> secondOne = {1.23, 1234.23, 34563, 5467.234, 9067.3432, -3452, -0053.345};

    vector<float> biggerOne;

    arraySorter(firstOne);
    arraySorter(secondOne);

    biggerOne = arrayMaker(firstOne, secondOne);
}

int main()
{
    partA();
    partB();

    return 0;
}
