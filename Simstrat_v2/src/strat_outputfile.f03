!     +---------------------------------------------------------------+
!     |  Interface and implementation of output data loggers
!     +---------------------------------------------------------------+

module strat_outputfile
   use strat_kinds
   use strat_grid
   implicit none

   private

   ! Main interface for loggers
   type, abstract, public :: SimstratOutputLogger
      !###########################################
      !class(StaggeredGrid), public, pointer ::grid
      type(StaggeredGrid), public, pointer ::grid
   contains
      procedure(generic_log_init), deferred, pass(self), public :: initialize
      procedure(generic_init_files), deferred, pass(self), public :: init_files
   end type

   !Simple logger = Logger that just writes out current state of variables,
   ! without any interpolation etc
   type, extends(SimstratOutputLogger), public :: SimpleLogger
      private
   contains
      procedure, pass(self), public :: initialize => log_init
      procedure, pass(self), public :: init_files => simple_init_files
   end type

contains

  ! Abstract interface definitions
   subroutine generic_log_init(self, grid)
      implicit none

      class(SimstratOutputLogger), intent(inout) :: self
      class(StaggeredGrid), target :: grid

   end subroutine

   subroutine generic_init_files(self, grid)
      implicit none
      class(SimstratOutputLogger), intent(inout) :: self
      class(StaggeredGrid), target :: grid

   end subroutine

   ! Simple logger initialiation
   subroutine simple_init_files(self, grid)
      implicit none
      class(SimpleLogger), intent(inout) :: self
      class(StaggeredGrid), target :: grid
      write(*,*) 'simple_init_files'

   end subroutine

   subroutine log_init(self, grid)
      implicit none
      class(SimpleLogger), intent(inout) :: self
      class(StaggeredGrid), target :: grid
      write(*,*) 'log_init'

      self%grid => grid
      write(*,*) 'call init_files'
      call self%init_files(grid)
   end subroutine
end module
