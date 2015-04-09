--  Package implementing the link between
--  the two Crazyflie MCU

with Types; use Types;
with Interfaces.C.Extensions; use Interfaces.C.Extensions;

package Syslink_Pack is

   --  Constants

   --  Size of Syslink packet data
   SYSLINK_MTU : constant := 32;

   --  Types

   --  Syslink packet group type
   type Syslink_Packet_Group_Type is (SYSLINK_RADIO_GROUP,
                                      SYSLINK_PM_GROUP,
                                      SYSLINK_OW_GROUP);

   for Syslink_Packet_Group_Type use (SYSLINK_RADIO_GROUP => 16#00#,
                                      SYSLINK_PM_GROUP    => 16#10#,
                                      SYSLINK_OW_GROUP    => 16#20#);

   --  Syslink packet types
   type Syslink_Packet_Type is (SYSLINK_RADIO_RAW,
                                SYSLINK_RADIO_CHANNEL,
                                SYSLINK_RADIO_DATARATE,
                                SYSLINK_RADIO_CONTWAVE,
                                SYSLINK_RADIO_RSSI,
                                SYSLINK_PM_SOURCE,
                                SYSLINK_PM_ONOFF_SWITCHOFF,
                                SYSLINK_PM_BATTERY_VOLTAGE,
                                SYSLINK_PM_BATTERY_STATE,
                                SYSLINK_PM_BATTERY_AUTOUPDATE,
                                SYSLINK_OW_SCAN,
                                SYSLINK_OW_GETINFO,
                                SYSLINK_OW_READ,
                                SYSLINK_OW_WRITE);
   for Syslink_Packet_Type use (SYSLINK_RADIO_RAW             => 16#00#,
                                SYSLINK_RADIO_CHANNEL         => 16#01#,
                                SYSLINK_RADIO_DATARATE        => 16#02#,
                                SYSLINK_RADIO_CONTWAVE        => 16#03#,
                                SYSLINK_RADIO_RSSI            => 16#04#,
                                SYSLINK_PM_SOURCE             => 16#10#,
                                SYSLINK_PM_ONOFF_SWITCHOFF    => 16#11#,
                                SYSLINK_PM_BATTERY_VOLTAGE    => 16#12#,
                                SYSLINK_PM_BATTERY_STATE      => 16#13#,
                                SYSLINK_PM_BATTERY_AUTOUPDATE => 16#14#,
                                SYSLINK_OW_SCAN               => 16#20#,
                                SYSLINK_OW_GETINFO            => 16#21#,
                                SYSLINK_OW_READ               => 16#22#,
                                SYSLINK_OW_WRITE              => 16#23#);

   --  Type for Syslink packet data
   type Syslink_Data is array (1 .. SYSLINK_MTU) of T_Uint8;

   --  Type for Syslink packets
   type Syslink_Packet is record
      Slp_Type : Syslink_Packet_Type;
      Length   : T_Uint8;
      Data     : Syslink_Data;
   end record;

   type Syslink_Rx_State is (WAIT_FOR_FIRST_START,
                             WAIT_FOR_SECOND_START,
                             WAIT_FOR_TYPE,
                             WAIT_FOR_LENGTH,
                             WAIT_FOR_DATA,
                             WAIT_FOR_CHKSUM_1,
                             WAIT_FOR_CHKSUM_2);

   --  Initialize the Syslink protocol
   procedure Syslink_Init;

   --  Test the Syslink protocol
   function Syslink_Test return Bool;

end Syslink_Pack;
