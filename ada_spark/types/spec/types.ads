with IMU_Pack; use IMU_Pack;
with Interfaces;
with Interfaces.C.Extensions;

package Types is

   --  General types
   type T_Int8   is new Interfaces.Integer_8;
   type T_Int16  is new Interfaces.Integer_16;
   type T_Int32  is new Interfaces.Integer_32;
   type T_Uint8  is new Interfaces.Unsigned_8;
   type T_Uint16 is new Interfaces.Unsigned_16;
   type T_Uint32 is new Interfaces.Unsigned_32;



   subtype Positive_Float is Float range 0.0 .. Float'Last;

   --  Allowed delta time range
   subtype T_Delta_Time   is Float range IMU_UPDATE_DT .. 1.0;

   --  Smoothing terms
   subtype T_Alpha        is Float range 0.0 .. 1.0;

   --  Angle range type, in degrees.
   subtype T_Angle        is Float range -360.0 .. 360.0;

   --  Allowed speed range, in m/s
   subtype T_Speed        is Float range -2000.0 .. 2000.0;

   --  Allowed sensitivity for target altitude change in Alt Hold mode
   subtype T_Sensitivity  is Float range 100.0 .. 300.0;

   --  Allowed factor to relate Altitude with Thrust command for motors
   subtype T_Motor_Fac    is Float range 10_000.0 .. 15_000.0;

end Types;
