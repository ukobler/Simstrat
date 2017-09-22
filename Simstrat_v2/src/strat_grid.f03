!     +---------------------------------------------------------------+
!     | Grid module
!     |  - Contains class to store, use and modify the grid
!     +---------------------------------------------------------------+


module strat_grid
   use strat_kinds
   implicit none
   private

   ! StaggeredGrid implementation
   type, public :: StaggeredGrid
      
      integer :: nz_grid      ! Number of allocated grid cells

   contains
      !Many methods...
      ! Init methods used for setup
      procedure, pass :: init => grid_init                              ! Main initialization method

      ! Manipulation methods
      procedure, pass :: grow => grid_grow          ! Add a new box

   end type

contains

  ! Set up grid at program start
   subroutine grid_init(self)
      implicit none
      class(StaggeredGrid), intent(inout) :: self
      write(*,*) 'grid_init'

      ! Assign config
      self%nz_grid = 1
   end subroutine grid_init

   !Grow grid (mainly used by advection)
   subroutine grid_grow(self, dh)
      implicit none
      class(StaggeredGrid), intent(inout) :: self
      real(RK) :: dh
      write(*,*) 'grid_grow'

      associate (nz=>self%nz_grid)
        nz = nz+1
      end associate
   end subroutine

end module strat_grid
