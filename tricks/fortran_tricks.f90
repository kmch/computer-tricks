!!! 0) FIXED FORMATTING !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
implicit none
! - VISIBLE IN ALL INTERNAL SUBPROGRAMS
! - INVISIBLE IN EXTERNAL (I.E. COMPILABLE) SUBPROGRAMS, BECAUSE IT MUST BE KNOWN AT COMPILE TIME
! - INVISIBLE IN PARENT SCOPES
! - MUST BE USED AFTER(!) ENCLOSING MODULES WITH use STATEMENT

! - IT SEEMS NO LONGER NEEDED ON MY MACHINE (DON'T KNOW WHY THOUGH)
!!

! LINE CONTINUATION 
&
! E.G.:
open(unit=10+id,file=trim(projname)//"-predwf-shot-"//trim(int2str(ns))//".bin", &
     access="direct",recl=nx1*nx3*(nitout)*4)
! CONTINUE FROM COLUMN 6 TO CONFORM WITH F77 
!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




!!! I) PRINTING TO SCREEN !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
print*," Classifying ghost nodes" ! PRINT CAN'T BE FORMATTED?

WRITE(*,*)
WRITE(*, "(A)") " WaveFor2D: Time Domain 2D FWI code  -  "
WRITE(*,*)

! Formatted output with leading zeros in Fortran
WRITE(*,'(I0.3)') VALUE

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




!!! II) DEFINING (=> DECLARING) VARIABLES (INCL. ARRAYS) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Local variables in Fortran are NOT created when the program enters its scope (as in C++), 
! BUT when the program begins execution!!!

! Parameter variables of ordinary functions are also created from the beginning of the program (so they exist from the 
! start of the execution - that's why Fortran is so speedy...)!!!
! Passing parameters in a function call, the caller merely copies the value from its variables into 
! the already existing parameter variables.


! VERY DANGEROUS THING: FORTRAN DOESN'T CARE THAT YOU HAVEN'T DECLARED A VARIABLE, TRY:
print*, variable_i_never_declared
!!

! By keeping the private empty, all your subroutines/data types will be private to the module by default
private
public a, b, c
!! 

real(kind=4) :: float32
real(kind=8) :: float64
! the variable float64 declared as an 8-byte real (the old Fortran DOUBLE PRECISION) and the variable 
! float32 is declared as a 4-byte real (the old Fortran REAL).
! This is nice because it allows you to fix the precision for your variables independent of the compiler 
! and machine you are running on

! good practice:
! Somewhere create and export a parameter dp:
  integer, parameter :: dp = kind(0.d0)  ! double precision
! and declare floats as:
  real(dp)           :: reall, doub = 5.87403
! Always write all floating point constants with the _dp suffix:
1.0_dp, 3.5_dp, 1.34e8_dp
! To print floating point double precision numbers without losing precision, use the (es23.16) format



real        :: x(n)
character(len=80)  :: filename
! For dummy arguments or function names, len can have another form: a parenthesized asterisk, that is, 
CHARACTER*(*), 
! which denotes that the function name length is defined in referencing the program unit, and the dummy argument 
! has the length of the actual argument. 
character*(*), intent(in) :: filename
! When declaring variables inside functions and subroutines that need to be passed in or out, intent may
! be added to the declaration. 
! it is difficult to find a straightforward explanation to the real differences between the fortran argument 
! intents
intent(in)   !means that the variable value can enter, but not be changed !!!!!!!!!!!!!!
intent(out)  !means the variable is set inside the procedure and sent back to the main program with any
! initial values ignored.! NOT FOR PROCEDURE'S ARGUMENTS, I SUPPOSE
intent(inout)!means that the variable comes in with a value and leaves with a value (default).
!! => CAN BE CHANGED, BUT DOESN'T HAVE TO (UNLIKE OUT) IF WE DON'T DO IT IN PROCEDURE
!!
character*(maxchar)  :: answer
real, allocatable  :: b(:), c(:), d(:) 
! On declaration, allocatable arrays have no associated storage and cannot be referenced until storage 
! has been explicitly allocated
allocate(node_class(nx3+xtratop+xtrabot, xtraleft+nx1+xtraright))

real, intent(inout), dimension(:,:) :: model

real, dimension(:) :: arr ! declares an assumed-shape array, while the form
real :: arr(*) ! declares an assumed-size array.

! The differences arise because, approximately, the compiler 'knows' the shape of the assumed-shape array 
! but not of the assumed-size array.

! Some advice for new Fortran programmers is to use assumed-shape arrays when possible. They were not 
! available before Fortran 90, so you will see lots of assumed-size arrays in old code. Assumed-shape arrays 
! are better in new code, because the SHAPE and SIZE functions can be used to query their sizes to 
! avoid out-of-bounds error and to ALLOCATE arrays whose dimensions depend on the dimensions of input arrays.

type(grad_module), intent(out) :: grad !!!!
! The Fortran 90 derived data type is similar to C structures and also has some
! similarities with C++ classes. The syntax for declaring a derived type, is 
! type mytype
!    integer:: i
!    real*8 :: a(3)
! end type mytype
! To create a variable of type mytype, use
! 
! type (mytype) var
! An object of a derived data type is called a structure
type Books
   character(len=50) :: title
   character(len=50) :: author
   character(len=150) :: subject
   integer :: book_id
end type Books
book1%title = "C Programming"
book1%author = "Nuha Ali"
book1%subject = "C Programming Tutorial"
book1%book_id = 6495407


integer, intent(in)            :: nx1,nx3,nhist,mode
integer, dimension(6) :: allocstat
grad%mode = mode
real, dimension(10) :: temp
!!
!
type grad_module
  real, allocatable :: models(:,:,:)
  integer, allocatable :: hist_index(:)
end type
!!
! 
subroutine setdefaults
  ! set default values for the parameters in runfile.key
  implicit none

  units         = "metric"
  equation      = "acoustic"
  problem       = ""
  anisotype     = "none"
  !...
end subroutine

!CONVERT STRING TO INT 
character*(10) :: string
integer        :: integ

read(string, *) integ
!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




!!! II) FILES HANDLING !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
if (exist) then
    open (unit = io, file = trim(filename), status = "old", iostat = ierr)
!!    
!
read(io,"(A)",iostat=ierr) answer
!!
! The RECL=rl clause is required if ACCESS='DIRECT' and ignored otherwise
open(unit=10+id,file=trim(projname)//"-predwf-shot-"//trim(int2str(ns))//".bin", &
     access="direct",recl=nx1*nx3*(nitout)*4)
write(unit=10+id,rec=1) (((forwardwf(i,k,it), k=1,nx3), it=1,nitout), i=1,nx1)
close(10+id)
!!
! write adjoint source
open(unit=35,file="adjointsrc.it-"//trim(int2str(nit))//".bin",access="direct",recl=nrecs*ncomp*nsamples*4)
write(unit=35,rec=1) (( adjointsrc(i,j), i=1,nsamples), j=1,ntraces)
close(unit=35)
!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


!!! III) ERRORS HANDLING !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! If the argument retrieval fails, STATUS is a positive number; 
! if VALUE contains a truncated command line argument, STATUS is -1; and otherwise the STATUS is zero. 
      call GET_COMMAND_ARGUMENT(n, arg, length, ierror) ! Fortran 2003 and later
      
      if (ierror < 0) then
        write(stderr, *) "ERROR. THE ARGUMENT IS TOO LONG."
        stop
      elseif (ierror > 0) then
        write(*, *) "Argument not found. Type it now:"
        read(*,*) arg
      end if
!!

stop
! The stop statement, on the other hand, is a standard Fortran statement. 
! This statement initiates normal termination of execution of a Fortran program (and can be compared with the error stop 
! statement which initiates error termination).

GO TO !statementNumber will jump to the specified statement number.

STOP !conditionCode will stop with the specified condition code or exit code. STOP may be coded without an argument. 
!Note that on many systems, STOP 0 is still a failure. Also note that pre-Fortran 2008, the condition code must be a
constant expression and not a variable.

EXIT !will leave a loop.

CONTINUE !can be used to end an archaic DO loop when it would otherwise end on an IF.

CYCLE !will transfer the control of the program to the next END DO statement.

RETURN !leaves a subroutine or function.


! REDIRECT MESSAGE TO stderr
integer, parameter :: stderr = 0 ! IN GFORTRAN ERROR UNIT = 0 BY DEFAULT, BUT IT MAY NOT BE A CASE IN OTHER 
!! COMPILERS, WHERE stderr VARIABLE SHOULD BE CHANGED TO RELEVANT VALUE
write(stderr, *) 'Error message'
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



!!! IV) LOOPS AND IFS (LOGIC) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! The implicit do loop will only create a vector, so to init. 2d array:
arr = reshape((/ ((i * 2, i = 1, dx), j = 1, dy) /), (/ dx, dy /))
!!

!
do i = 1, 10
  ! BODY      
end do	
!!
cycle
!
if (l .gt. zsurf) then
  ! BODY
else
  ! BODY
elseif (l < 2) then
  ! BODY
endif ! OR end if
!!
! EXIT FROM SUBROUTINE?
if (allocstat .ne. 0) then
  print*, " +++ ERROR: failed to allocate space for: ", trim(filename)
  stop ! EXIT?
end if
!!
.eq.
.ne.
.lt.
.gt.
.and.
.or.
.true.
.false.
nint(real(nsteps)*5./100.)
maxval(
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



!!! V) PROCEDURES (SUBROUTINES AND FUNCTIONS) !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


! YOU HAVE TO DECLARE ALL PROCEDURE'S ARGUMENTS !!!!!!!!!!!


! Each program unit (PROGRAM/SUBROUTINE/FUNCTION) may contain INTERNAL PROCEDURES. 
! They must be defined at the end of the program unit after adding the CONTAINS statement.

! The only place where there is some form of scope is when you use internal functions :
!         An internal function may access all variables defined in the enclosing function
!         (unless you defind another local variables with the same name) 
!         However, the enclosing function cannot access any variables define in the internal function 

! External procedures are defined in a separate program unit (can be in another file);

!     When you want to use them in another program unit, you need to refer then with the EXTERNAL keyword
!     They are compiled separately and linked 

! DO NOT USE THEM: modules are much easier and more robust
! They are only needed when procedures are written with different programming language or when 
! using external libraries(such as BLAS) 


!
contains

!
real function dot2d(a,b)
  real, dimension(:,:), intent(in) :: a,b

  dot2d = dot_product(pack(a,.true.),pack(b,.true.))
end function
!!
!
function lc(text) result(lowercase) !!!!!!!!!!!!

  Convert TEXT to all lower case

  character*(*)         :: text
  character*(len(text)) :: lowercase
  integer               :: i
  integer               :: j
  integer               :: iend
  integer               :: c

  lowercase = text
  do i = 1, len_trim(text)
    if (iachar(text(i:i)) .ge. 65 .and. &
      iachar(text(i:i)) .le. 90) then
      lowercase(i:i) = achar(iachar(text(i:i))+32)
    end if
  end do

end function lc
!!
!
recursive character*30 function int2str(i)
! - converts an integer to a string, with no leading spaces (so you can use
! - trim(int2str(anint)) to get the shortest representation)
! - declared recursive just in case compiler would manage to inline it so
! - some stuff might have ended up getting mixed up when int2str is used
! - more than once within a single string construction
implicit none
integer i
character*30 thestr
thestr = '                              '  ! ensure all spaces at start
write(thestr,'(I5.4)') i
int2str = adjustl(thestr)
return
end function int2str
!!
!
SUBROUTINE LOWPASS (DATA, N, CUT)
! BODY
RETURN
END SUBROUTINE LOWPASS
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




!!! VI) INCLUDING MODULES AND LIBRARIES !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! One of the most troublesome issues with Fortran 90 is the lack of namespacing
! WRITING PREFIXES SEEMS TO BE A TEDIOUS TASK
! WHAT IF 2 MODULES CONTAIN PROCEDURES WITH ALIKE NAMES?
! as High Performance Mark said, use ONLY as much as you have time to do it (tedious).
! The fact that fortran90 does not support subroutine pointers is shocking, to say the least.


use new_module
! The USE ModuleName clause MUST PRECEED the IMPLICIT NONE clause !!!

! WE HAVE TO USE MODULE FILENAME, OTHERWISE WE WON'T GET .mod FILE WHEN COMPILING!!!!!!!!
! module module_filename

! end module module_filename

use types, only: dp, pi

! Always setup a module in the following way:
module ode1d
use types, only: dp, pi
use utils, only: stop_error
! Notice the “explicit imports” (using Python terminology) in the use statements. You can also use 
! “implicit imports” like: use utiles, 
! But just like in Python, this should be avoided (“explicit is better than implicit”) in most cases.
implicit none
private
public integrate, normalize, parsefunction, get_val, rk4step, eulerstep, &
        rk4step2, get_midpoints, rk4_integrate, rk4_integrate_inward, &
        rk4_integrate_inward2, rk4_integrate3, rk4_integrate4, &
        rk4_integrate_inward4

contains

subroutine get_val(...)
...
end subroutine
...
end module

! The implicit none statement works for the whole module (so you don’t need to worry about it). By keeping the private empty, all your subroutines/data types will be private to the module by default. Then you export things by putting it into the public clause.
!!

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


!!! VII) ARRAY OPERATIONS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

! SOMETHING LIKE PYTHON RANGE (EVEN BETTER FOR IT DOESN'T CUT LAST VALUE!)
np-arange = (/ (i, i = x_start, x_end, x_step) /) 
!!

allocate
! deallocate arrays
deallocate(wavetevn,wavetodd,forwardwf,datapred,adjointsrc,residuals, &
lgrad,gstep,ggrad,backsnap)
!!
problem(1:1) ! SLICING SIMILAR TO PYTHONIC
gradient(:,1:int(gwindow1)-1
size(fscoor_s, 2)
trim()
len_trim
index(
beta = merge(beta,0.0,beta .ge. 0)

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

!!! VIII) OTHER STRUCTURES
enum, bind(c)
  enumerator init
  enumerator reflecting
  enumerator expanding
  enumerator contracting
  enumerator reducing
end enum
!!!!


!!! IX) TIME HANDLING !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!
real               :: time_start, time_end 
call cpu_time(time_start) ! BUILT-IN SUBROUTINE
! MAIN BODY
call cpu_time(time_end)
print*, "Ellapsed time: ", time_end - time_start
!!

!
CHARACTER(LEN=8)       :: dateinfo                    ! date information
CHARACTER(LEN=10)      :: timeinfo                    ! time information
print*, "Start date: ",dateinfo(7:8),"/",dateinfo(5:6),"/",dateinfo(1:4)
print*, "Start time: ", timeinfo(1:2),":",timeinfo(3:4),":",timeinfo(5:10)

call date_and_time(dateinfo, timeinfo)

print*, "Finish date: ",dateinfo(7:8),"/",dateinfo(5:6),"/",dateinfo(1:4)
print*, "Finish time: ", timeinfo(1:2),":",timeinfo(3:4),":",timeinfo(5:10)
!!
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



! The following keywords were defined in FORTRAN 77: 
do, else, if, implicit, inquire, continue, else if, end, call, close, format, function, goto,
print, program, read, return, save, stop, subroutine, then, write, open, parameter

assign, backspace, block data, common,  data, dimension, 
endfile, endif, entry, equivalence, external,   intrinsic,  pause, rewind, 
rewrite, 
!!

! The following keywords were added in Fortran 90: 
use,  module, contains
allocatable, allocate, case, cycle, deallocate, elsewhere, exit, 
include, interface, intent,, namelist, nullify, only, operator, optional, 
pointer, private, procedure, public, recursive, result, select, sequence, target, 
while, where
!!!!

!
select case (mode)
  case (steepest)
    grad%nhist = 0
  case (prp,prp_plus,hagerzhang,fr,cd,ls,dy,hs)
    grad%nhist = 1
end select
!!


























! PUT VALUE OF VARIABLE var INTO STRING char_var WITH 'INTERNAL FILE' METHOD
write (char_var, '(I5.5)') var
! Formatted output with leading zeros in Fortran
WRITE(*,'(I0.3)') VALUE
!!



! STRING OF NOT PRE-DEFINED LENGTH
character(len=*) :: message
!!

! contains STATEMENT - IDENTIFY ANY INTERNAL PROCEDURES 
contains
!!

! round number a to nearest integer
nint(a)
!!


! FORTRAN 77 LOOP
! The number 10 is a statement label. Typically, there will be many loops and other statements in 
! a single program that require a statement label. The programmer is responsible for assigning a 
! unique number to each label in each program (or subprogram). Recall that column positions 2-5 are 
! reserved for statement labels. The numerical value of statement labels have no significance, so any 
! integer numbers can be used.
do 145 ii=mlw, mup
  ...
145   continue
!!

 The general form of the do loop is as follows:

      do label  var =  expr1, expr2, expr3
         statements
label continue
var is the loop variable (often called the loop index) which must be integer. expr1 specifies the initial value of var, expr2 is the terminating bound, and expr3 is the increment (step).

Note: The do-loop variable must never be changed by other statements within the loop! This will cause great confusion.

Many Fortran 77 compilers allow do-loops to be closed by the enddo statement. The advantage of this is that the statement label can then be omitted since it is assumed that an enddo closes the nearest previous do statement. The enddo construct is widely used, but it is not a part of ANSI Fortran 77. 



!
ALWAYS TRY TO FIX THE FIRST ERROR - IN MOST CASES CONSECUTIVE ERRORS WILL BE SOLVED AUTOMATICALLY!
!!

!
Usually error about no implicit type is due to too long line when declaring variable and (the line is cut and the variable is not properly declaired)

!!


!
! FORTRAN IS CASE-INSENSITIVE!
    program sensi
        integer ABC
        AbC = 1
        print *, abc
    end program sensi
!!
  
 
!
Sometimes, a statement does not fit into the 66 available columns of a single line. One can then break the statement into two or more lines, and use the continuation mark in position 6. Example:

c23456789 (This demonstrates column position!)

c The next statement goes over two physical lines
      area = 3.14159265358979
     +       * r * r

Any character can be used instead of the plus sign as a continuation character. It is considered good programming style to use either the plus sign, an ampersand, or digits (using 2 for the second line, 3 for the third, and so on). 


lub w plikach .f90:
double precision besr(ndatar),AIr(ndatar,ndatar),AIr_prop(ndatar,ndatar),&
 Cd(ndatar,ndatar),UU(ndatar,ndatar),W(ndatar),x(ndatar),vv(ndatar,ndatar),bes(ndatar),b(ndatar)


!!
