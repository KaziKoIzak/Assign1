program main
  implicit none

  !This is the main part of the program where we call subroutine part A and B
  call partA()
  call partB()

  !Lists all the subroutines
  contains

  !Name: Part A
  !In Args: None
  !Out Args: None
  !Definition: This function takes care of running Part A of the assignment
  subroutine partA()
    !Initializing Array
    integer :: myArray(14)
    myArray = [3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121]

    !Start going through each part of section A
    write(*,*) 'Part A of Assignment'
    !Takes care of the multiples
    write(*,*) 'Multiples function for 7, 11 or 13: '
    call multiple(myArray)
    !Takes care of if the digits added are even or odd
    write(*,*) NEW_LINE('A')//'Sum function if the digits are odd or even: '
    call sum(myArray)
    !Checks if the number is prime or not
    write(*,*) NEW_LINE('A')//'Check if the numbers are prime or not: '
    call prime(myArray)
    !Check if the number is a palindrome or not
    write(*,*) NEW_LINE('A')//'Check if the element is a palindrome or not: '
    call palindrome(myArray)

  end subroutine partA

  !Name: Part B
  !In Args: None
  !Out Args: None
  !Definition: This function takes care of running Part B of the assignment
  subroutine partB()
    real, allocatable :: first(:), second(:), third(:)
    integer :: size, size2, size3

    ! Define sizes for arrays
    size = 8
    size2 = 11
    size3 = size + size2
  
    ! Allocate memory for arrays
    allocate(first(size))
    allocate(second(size2))
    allocate(third(size3))
  
    ! Initialize values for the arrays
    first = [1.123, 25423.23, 1234.1, 9045.2, 34523.3, 7456.4, 909.5, 34.5, 6.54]
    second = [.51234, .23414, .90345, .234523234, .8945, 8946.453, 94055.345, 9845.325, 945334.34, 5.0, 1.1]
  
    ! Print header for Part B of Assignment
    write(*,*) NEW_LINE('A')//'Part B of Assignment'
  
    ! Print unsorted arrays
    write(*,*) 'Before Sorting Arrays: '
    call printArray(first, size)
    call printArray(second, size2)
  
    ! Print header for After Sorted Arrays
    write(*,*) NEW_LINE('A')//'After Sorting Arrays: '
  
    ! Sort arrays
    call sortArray(first, size)
    call sortArray(second, size2)
  
    ! Print sorted arrays
    call printArray(first, size)
    call printArray(second, size2)
  
    ! Print header for Merged Array
    write(*,*) NEW_LINE('A')//'Merged Array: '
  
    ! Merge arrays and print the result
    call mergeArray(first, second, third, size, size2)
    call printArray(third, size3)

  end subroutine partB

  
    !Name: Print Array
    !In Args: Array and Size
    !Out Args: None
    !Definition: This function takes care of printing the elements of an array
  subroutine printArray(arr, size)
    real, intent(in) :: arr(:)
    integer, intent(in) :: size
    integer :: i
    !Go through the array and print it
    do i = 1, size
      write(*, *) arr(i), ' '
    end do
    write(*, *)
  end subroutine printArray

  
  !Name: Array Sorter
  !In Args: Array, Size
  ! Out Args: None
   ! Definition: This function takes care of using the bubble sort algorithm to sort the array from smallest
    !to largest.
  subroutine sortArray(arr, size)
    real, intent(inout) :: arr(:)
    integer, intent(in) :: size
    integer :: i, j
    real :: temp

    !This is just a bubble sort
    do i = 1, size - 1
      do j = 1, size - i
        if (arr(j) > arr(j + 1)) then
          ! Swap elements if they are in the wrong order
          temp = arr(j)
          arr(j) = arr(j + 1)
          arr(j + 1) = temp
        end if
      end do
    end do
  end subroutine sortArray


  !Name: Array Makeer
  !In Args: Array 1, Array 2, Array 3, size, size2
  !Out Args: None
  !Definition: This function takes care of combining the sorted arrays and merging them into one giant
  !array with the first half sorted to the first array and second half sorted with the second array
  subroutine mergeArray(arr, arr2, arr3, size, size2)
    real, intent(inout) :: arr(:), arr2(:), arr3(:)
    integer, intent(in) :: size, size2
    integer :: i, j
  ! Copy elements from array 1 to larger array
    do i = 1, size
      arr3(i) = arr(i)
    end do
  
    ! Copy elements from array 2 to larger array
    j = 1
    do i = size + 1, size + size2
      arr3(i) = arr2(j)
      j = j + 1
    end do
  end subroutine mergeArray

    !Name: Multiple
    !In Args: None
    !Out Args: None
    !Definition: This function takes care of checking if the element in the array is a multiple of 7, 11, or
    !13. This is done by performing a mathematical operation with the modulo
  subroutine multiple(arr)
    integer, intent(in) :: arr(14)
    integer :: i
    logical :: seven, eleven, thirteen

    !Checks if the number is a multiple of 7, 11, or 13
    do i = 1, 14
      seven = .FALSE.
      eleven = .FALSE.
      thirteen = .FALSE.
      if(mod(arr(i), 7) == 0) then
        seven = .TRUE.
      end if
      if(mod(arr(i), 11) == 0) then
        eleven = .TRUE.
      end if
      if(mod(arr(i), 13) == 0) then
        thirteen = .TRUE.
      end if
      
      !Using the information above, the program then goes through and checks the box that the logic above
      !Had
      if(seven .AND. eleven .AND. thirteen) then
        write(*,*) arr(i), ' is a number that is a mutliple of 7, 11, 13' 
      else if(seven .AND. eleven) then
        write(*,*) arr(i), ' is a number that is a mutliple of 7, 11' 
      else if(seven .AND. thirteen) then
        write(*,*) arr(i), ' is a number that is a mutliple of 7, 13' 
      else if(eleven .AND. thirteen) then
        write(*,*) arr(i), ' is a number that is a mutliple of 11, 13' 
      else if(seven) then
        write(*,*) arr(i), ' is a number that is a mutliple of 7' 
      else if(thirteen) then
        write(*,*) arr(i), ' is a number that is a mutliple of 13' 
      else if(eleven) then
        write(*,*) arr(i), ' is a number that is a mutliple of 11' 
      else
        write(*,*) arr(i), ' is a number that is not a mutliple of 7, 11, 13' 
      end if
    end do

  end subroutine multiple

  
  !Name: Sum
  !In Args: None
  !Out Args: None
  !Definition: This function takes care of checking if the element in the array has the sum of the digits
  !equal an odd or an even number.
  subroutine sum(arr)
    integer, intent(in) :: arr(14)
    integer :: i, number, sumer, digit
    logical :: even
    
    do i = 1, 14
      sumer = 0
      number = arr(i)
  
      ! Iterate through each digit of the number
      do while (number /= 0)
        ! Extract the last digit
        digit = mod(number, 10)
  
        ! Add the digit to the sum
        sumer = sumer + digit
  
        ! Remove the last digit from the number
        number = number / 10
      end do
  
      even = mod(sumer, 2) == 0
  
      !Tells the user if their number was odd or even
      if ( even ) then
        write(*,*) 'The sum of the digits for ', arr(i), ' is ', sumer, ' which is even'
      else
        write(*,*) 'The sum of the digits for ', arr(i), ' is ', sumer, ' which is odd'
      end if
    end do
  end subroutine sum

  
  !Name: Prime
  !In Args: None
  !Out Args: None
  !Definition: This function takes care of checking if the element in the array is a prime or not. This is
  !done checking every number for 2 to the square root of 2 of that number. This is because the middle number
  !that can multiply to the number is the other number being a difference of 0 is the square root of that number
  subroutine prime(arr)
    integer, intent(in) :: arr(14)
    integer :: i, j, number
    logical :: answer
  
    do i = 1, 14
      answer = .TRUE.
      number = arr(i)
  
      ! Check for divisibility by numbers from 2 to the square root of the number
      do j = 2, int(sqrt(real(number)))
        if (mod(number, j) == 0) then
          ! If the number is divisible, it's not prime
          answer = .FALSE.
          exit
        end if
      end do
  
      ! Print the result
      if ( answer ) then
        write(*, *) 'The Number ', number, ' is a Prime'
      else
        write(*, *) 'The Number ', number, ' is not a prime'
      end if
    end do
  end subroutine prime

  
   ! Name: Palindrom
   ! In Args: None
   ! Out Args: None
   ! Definition: This function takes care of checking if the element in the array is a palindrome by putting
   ! the reversed number into a temporary number and checking the values later.
  subroutine palindrome(arr)
    integer, intent(in) :: arr(14)
    integer :: i, number, reversed, original
    integer :: digit
    logical :: answer
  
    do i = 1, 14
      reversed = 0
      number = arr(i)
      original = number
  
      ! Iterate through each digit of the number
      do while (number /= 0)
        ! Extract the last digit
        digit = mod(number, 10)
  
        ! Append the digit to the reversed number (shift left and add the digit)
        reversed = reversed * 10 + digit
  
        ! Remove the last digit from the number
        number = number / 10
      end do
  
      ! Check if the number is a palindrome
      answer = original == reversed
  
      ! Print the result
      if ( answer ) then
        write(*, *) 'The Number ', reversed, ' is a Palindrome of itself'
      else
        write(*, *) 'The Number ', reversed, ' is not a Palindrome of itself'
      end if
    end do
  end subroutine palindrome
  
  end program main