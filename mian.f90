program main
  implicit none
  integer :: myArray(14)
  myArray = [3, 105, 3773, 13, 121, 78, 30751, 16461, 1233222, 348373443, 8769, 1011, 808, 121]

  contains
  subroutine multiple(arr, size)
    integer, intent(in) :: arr(:), size
    integer :: i
    logical :: seven, eleven, thirteen
    do i = 1, size
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

  subroutine sum(arr, size)
    integer, intent(in) :: arr, size
  end subroutine sum

  subroutine prime(arr, size)
    integer, intent(in) :: arr, size
  end subroutine prime

  subroutine palindrome(arr, size)
    integer, intent(in) :: arr, size
  end subroutine palindrome
  
  end program main