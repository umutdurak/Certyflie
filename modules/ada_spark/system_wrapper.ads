package System_Wrapper is
	procedure C_SystemLaunch;
	procedure Ada_SystemLaunch;
	pragma Import(C, C_SystemLaunch, "systemLaunch");
	pragma Export(C, Ada_SystemLaunch, "ada_systemLaunch");
end System_Wrapper;