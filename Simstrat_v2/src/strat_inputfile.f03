!     +---------------------------------------------------------------+
!     | Inputfile  module
!     |  - Reads configuration and initial conditions
!     |  - Sets up simulation data structure!
!     +---------------------------------------------------------------+

module strat_inputfile
   use strat_kinds
   use strat_simdata
   use strat_grid
   implicit none

   private

   !##################################################
   !# Inputfile
   !##################################################
   type, public :: SimstratSimulationFactory
      private
      class(SimulationData), pointer :: simdata
   contains
      procedure, pass(self), public :: initialize_model
      procedure, pass(self), public :: read_grid_config
   end type SimstratSimulationFactory

contains

   subroutine initialize_model(self, simdata)
      implicit none
      class(SimstratSimulationFactory) :: self
      class(SimulationData), pointer, intent(out) :: simdata
      write(*,*) 'initialize_model'

      allocate (SimulationData :: self%simdata)
      simdata => self%simdata

      !Set up grid
      write(*,*) 'call read_grid_config'
      call self%read_grid_config

   end subroutine initialize_model

   ! Read config of grid and init grid
   subroutine read_grid_config(self)
      implicit none
      class(SimstratSimulationFactory) :: self
      write(*,*) 'read_grid_config'
      associate (simdata=>self%simdata)
         ! initialize Grid of simdata
         !allocate (StaggeredGrid :: simdata%grid)
         write(*,*) 'call grid%init'
         call simdata%grid%init()
      end associate
   end subroutine

end module strat_inputfile
