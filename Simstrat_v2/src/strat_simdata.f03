!     +---------------------------------------------------------------+
!     |  Data structure definitions for simulation data
!     +---------------------------------------------------------------+

module strat_simdata
   use strat_kinds
   use strat_grid
   implicit none
   private

   ! Structure that encapsulates a full program state
   type, public :: SimulationData
      type(StaggeredGrid), public :: grid
      !class(StaggeredGrid), public, allocatable :: grid
   contains
      procedure, pass :: init => simulation_data_init
   end type

contains
   subroutine simulation_data_init(this, state_size)
      class(SimulationData), intent(inout) :: this
      integer, intent(in) :: state_size
      write(*,*) 'simulation_data_init'
   end subroutine

end module strat_simdata
