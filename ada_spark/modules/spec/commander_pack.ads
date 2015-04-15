with Types; use Types;
with Interfaces.C.Extensions; use Interfaces.C.Extensions;
with System;

package Commander_Pack
with SPARK_Mode
is

   --  Types

   --  Type of the commands given by the pilot.
   --  Can be an angle rate, or an angle.
   type RPY_Type is (RATE, ANGLE);
   for RPY_Type use (RATE => 0, ANGLE => 1);
   for RPY_Type'Size use Interfaces.C.int'Size;

   type Commander_Crtp_Values is record
      Roll   : T_Degrees;
      Pitch  : T_Degrees;
      Yaw    : T_Degrees;
      Thrust : T_Uint16;
   end record;
   pragma Pack (Commander_Crtp_Values);

   --  Procedures and functions

   --  Test function used to test the CRTP Protocol implementation
   --  using Ravenscar
   procedure Print_Command;

   --  Get the commands from the pilot.
   procedure Commander_Get_RPY
     (Euler_Roll_Desired  : in out T_Degrees;
      Euler_Pitch_Desired : in out T_Degrees;
      Euler_Yaw_Desired   : in out T_Degrees)
     with
       Global => null;

   --  Get the commands types by default or from the client.
   procedure Commander_Get_RPY_Type
     (Roll_Type  : in out RPY_Type;
      Pitch_Type : in out RPY_Type;
      Yaw_Type   : in out RPY_Type)
     with
       Global => null;
   pragma Import (C, Commander_Get_RPY_Type, "commanderGetRPYType");

   --  Check if the pilot is inactive or if the radio signal is lost.
   procedure Commander_Watchdog
     with
       Global => null;
   pragma Import (C, Commander_Watchdog, "commanderWatchdog");

   --  Get the thrust from the pilot.
   procedure Commander_Get_Thrust (Thrust : out T_Uint16)
     with
       Global => null;
   pragma Import (C, Commander_Get_Thrust, "commanderGetThrust");

   --  Get Alt Hold Mode parameters from the pilot.
   procedure Commander_Get_Alt_Hold
     (Alt_Hold        : out bool;
      Set_Alt_Hold    : out bool;
      Alt_Hold_Change : out Float)
     with
       Global => null;
   pragma Import (C, Commander_Get_Alt_Hold, "commanderGetAltHold");

private

   --  Tasks and protected objects

   task Get_Command_Task is
      pragma Priority (System.Priority'Last - 1);
   end Get_Command_Task;

end Commander_Pack;
