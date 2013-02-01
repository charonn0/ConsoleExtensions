#tag Module
Protected Module Console
	#tag ExternalMethod, Flags = &h0
		Declare Function CloseHandle Lib "Kernel32" (handle As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function CreateFile Lib "Kernel32" Alias "CreateFileW" (name As WString, access As Integer, sharemode As Integer, SecAtrribs As Integer, CreateDisp As Integer, flags As Integer, template As Integer) As Integer
	#tag EndExternalMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Function CTRL_Event_HandlerRoutine(CTRLType As Integer) As Boolean
	#tag EndDelegateDeclaration

	#tag ExternalMethod, Flags = &h0
		Declare Function FillConsoleOutputAttribute Lib "Kernel32" (cHandle As Integer, attrib As UInt16, len As Integer, startCoord As COORD, ByRef charsWritten As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function FillConsoleOutputCharacter Lib "Kernel32" Alias "FillConsoleOutputCharacterW" (cHandle As Integer, character As Integer, length As Integer, startCoord As COORD, ByRef charsWritten As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function FormatMessage Lib "Kernel32" Alias "FormatMessageW" (dwFlags As Integer, lpSource As Integer, dwMessageId As Integer, dwLanguageId As Integer, lpBuffer As ptr, nSize As Integer, Arguments As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GenerateConsoleCtrlEvent Lib "Kernel32" (CtrlEvent As Integer, ProcessGroupID As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetConsoleCursorInfo Lib "Kernel32" (cHandle As Integer, ByRef CurseInfo As CONSOLE_CURSOR_INFO) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetConsoleDisplayMode Lib "Kernel32" (ByRef flags As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function GetConsoleOriginalTitle Lib "Kernel32" Alias "GetConsoleOriginalTitleW" (Contitle As Ptr, mbsize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function GetConsoleScreenBufferInfo Lib "Kernel32" (hConsole As Integer, ByRef buffinfo As CONSOLE_SCREEN_BUFFER_INFO) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function GetConsoleTitle Lib "Kernel32" Alias "GetConsoleTitleW" (Contitle As Ptr, mbsize As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function GetConsoleWindow Lib "Kernel32" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetCurrentProcess Lib "Kernel32" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetCurrentThreadId Lib "Kernel32" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetLargestConsoleWindowSize Lib "Kernel32" (cHandle As Integer) As COORD
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetLastError Lib "Kernel32" () As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function GetStdHandle Lib "Kernel32" (hIOStreamType As Integer) As Integer
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function ReadConsoleOutputCharacter Lib "Kernel32" Alias "ReadConsoleOutputCharacterW" (cHandle As Integer, chars As Ptr, Length As Integer, buffCords As COORD, charsRead As Ptr) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetConsoleCtrlHandler Lib "Kernel32" (handlerRoutine As Ptr, add As Boolean) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetConsoleCursorInfo Lib "Kernel32" (cHandle As Integer, ByRef CurseInfo As CONSOLE_CURSOR_INFO) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetConsoleCursorPosition Lib "Kernel32" (cHandle As Integer, NewCoords As COORD) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetConsoleDisplayMode Lib "Kernel32" (cHandle As Integer, Flags As Integer, ByRef NewDimensions As COORD) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetConsoleScreenBufferInfoEx Lib "Kernel32" (cHandle As Integer, info As CONSOLE_SCREEN_BUFFER_INFOEX) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Soft Declare Function SetConsoleScreenBufferSize Lib "Kernel32" (Handle As Integer, NewSize As COORD) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetConsoleTextAttribute Lib "Kernel32" (hConsole As Integer, attribs As UInt16) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetConsoleTitle Lib "Kernel32" Alias "SetConsoleTitleW" (NewTitle As WString) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function SetConsoleWindowInfo Lib "Kernel32" (cHandle As Integer, Absolute As Boolean, ByRef coords As SMALL_RECT) As Boolean
	#tag EndExternalMethod

	#tag Method, Flags = &h1
		Protected Function ShiftColor(InputColor As Color) As UInt16
		  Dim intR, intG, intB, i32R, i32G, i32B As UInt32
		  
		  intR = InputColor.Red
		  intG = InputColor.Green
		  intB = InputColor.Blue
		  
		  While BitAnd(intR, 1) = 0
		    intR = Bitwise.ShiftLeft(intR, 1)
		    i32R = i32R + 1
		  Wend
		  
		  While BitAnd(intG, 1) = 0
		    intG = Bitwise.ShiftLeft(intG, 1)
		    i32G = i32G + 1
		  Wend
		  
		  While BitAnd(intB, 1) = 0
		    intB = Bitwise.ShiftLeft(intB, 1)
		    i32B = i32B + 1
		  Wend
		  
		  intR = Bitwise.ShiftLeft(intR, i32R)
		  intG = Bitwise.ShiftLeft(intG, i32G)
		  intB = Bitwise.ShiftLeft(intB, i32B)
		  
		  Return intR + intG + intB
		  
		End Function
	#tag EndMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function ShowWindow Lib "User32" (HWND As Integer, Command As Integer) As Boolean
	#tag EndExternalMethod

	#tag ExternalMethod, Flags = &h0
		Declare Function WriteConsoleOutputCharacter Lib "Kernel32" Alias "WriteConsoleOutputCharacterW" (cHandle As Integer, chars As Ptr, Length As Integer, buffCoords As COORD, charWritten As Ptr) As Boolean
	#tag EndExternalMethod


	#tag Constant, Name = CTRL_BREAK_EVENT, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CTRL_C_EVENT, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FORMAT_MESSAGE_FROM_SYSTEM, Type = Double, Dynamic = False, Default = \"&H1000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = INVALID_HANDLE_VALUE, Type = Double, Dynamic = False, Default = \"&hffffffff", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STD_ERROR_HANDLE, Type = Double, Dynamic = False, Default = \"-12\r", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STD_INPUT_HANDLE, Type = Double, Dynamic = False, Default = \"-10", Scope = Public
	#tag EndConstant

	#tag Constant, Name = STD_OUTPUT_HANDLE, Type = Double, Dynamic = False, Default = \"-11", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_HIDE, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SW_RESTORE, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant


	#tag Structure, Name = CONSOLE_CURSOR_INFO, Flags = &h0
		height As Integer
		visible As Boolean
	#tag EndStructure

	#tag Structure, Name = CONSOLE_SCREEN_BUFFER_INFO, Flags = &h0
		Dimensions As COORD
		  CursorPosition As COORD
		  Attribute As UInt16
		  WindowRect As SMALL_RECT
		MaxWindowSize As COORD
	#tag EndStructure

	#tag Structure, Name = CONSOLE_SCREEN_BUFFER_INFOEX, Flags = &h0, Attributes = \"StructureAlignment \x3D 8"
		sSize As Integer
		  Dimensions As COORD
		  CursorPosition As COORD
		  Attribute As UInt16
		  WindowRect As SMALL_RECT
		  MaxWindowSize As COORD
		  PopupAttributes As UInt16
		  FullscreenSupported As Boolean
		ColorTable(15) As UInt32
	#tag EndStructure

	#tag Structure, Name = COORD, Flags = &h0
		X As UInt16
		Y As UInt16
	#tag EndStructure

	#tag Structure, Name = SMALL_RECT, Flags = &h0
		Left As UInt16
		  Top As UInt16
		  Right As UInt16
		Bottom As UInt16
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
