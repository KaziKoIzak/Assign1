program main
  implicit none

  call partA()
  call partB()

  contains
  subroutine partA()
    integer :: myArray(14)
    myArray = [3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121]

    write(*,*) 'Part A of Assignment'
    write(*,*) 'Multiples function for 7, 11 or 13: '
    call multiple(myArray)
    write(*,*) NEW_LINE('A')//'Sum function if the digits are odd or even: '
    call sum(myArray)
    write(*,*) NEW_LINE('A')//'Check if the numbers are prime or not: '
    call prime(myArray)
    write(*,*) NEW_LINE('A')//'Check if the element is a palindrome or not: '
    call palindrome(myArray)

  end subroutine partA

  subroutine partB()
    real, allocatable :: first(:), second(:), third(:)
    integer :: size, size2, size3

    size = 8
    size2 = 11
    size3 = size + size2

    allocate(first(size))
    allocate(second(size2))
    allocate(third(size3))

    first = [1.123,25423.23,1234.1,9045.2,34523.3,7456.4,909.5,34.5,6.54]
    second = [.51234,.23414,.90345,.234523234,.8945,8946.453,94055.345,9845.325, 945334.34, 5.0, 1.1]

    call printArray(first, size)
    call printArray(second, size2)
    call sortArray(first, size)
    call sortArray(second, size2)
    call printArray(first, size)
    call printArray(second, size2)
    call mergeArray(first, second, third, size, size2)

  end subroutine partB

  subroutine printArray(arr, size)
    real, intent(in) :: arr(:)
    integer, intent(in) :: size
    integer :: i
    do i = 1, size
      write(*, *) arr(i), ' '
    end do
    write(*, *)
  end subroutine printArray

  subroutine sortArray(arr, size)
    real, intent(inout) :: arr(:)
    integer, intent(in) :: size
    integer :: i, j
    real :: temp
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

  subroutine multiple(arr)
    integer, intent(in) :: arr(14)
    integer :: i
    logical :: seven, eleven, thirteen
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
  
      if ( even ) then
        write(*,*) 'The sum of the digits for ', arr(i), ' is ', sumer, ' which is even'
      else
        write(*,*) 'The sum of the digits for ', arr(i), ' is ', sumer, ' which is odd'
      end if
    end do
  end subroutine sum

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