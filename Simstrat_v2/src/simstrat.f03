!     +---------------------------------------------------------------+
!     |  Simstrat model for simulation of                             |
!     |  vertical transport in lakes and reservoirs                   |
!     +---------------------------------------------------------------+

program simstrat_main
   use strat_kinds
   use strat_inputfile, only: SimstratSimulationFactory
   use strat_outputfile
   use strat_simdata, only: SimulationData
   use, intrinsic :: ieee_arithmetic

   implicit none

   ! Instantiate all modules
   ! note that some are pointers/targets for polymorphism reasons
   type(SimstratSimulationFactory) :: factory
   class(SimulationData), pointer :: simdata
   type(SimpleLogger) :: logger
   write(*,*) 'start simstrat'

   !initialize model from inputfiles
   write(*,*) 'init model'
   call factory%initialize_model(simdata)

   write(*,*) 'init logger'
   call logger%initialize(simdata%grid)

end program simstrat_main
