{*****************************************************************************************
* Copyright (c) 2011 Beijing Senselock Software Technology Co.,Ltd.
* All rights reserved.
*
* filename: elitee.inc
*
* brief: library interface declaration, return value and some constant definition.
* 
* history:
*   2011,03,04 created 2.3
*****************************************************************************************}
uses SysUtils, windows, Messages;

const

//open mode
ELE_EXCLUSIVE_MODE                    =$00000000;// open dongle with exclusive mode                                 
ELE_SHARE_MODE                        =$00000001;// open dongle with sharing mode                                   
                                                                                                                    
//communication mode                                                                                                                    
ELE_COMM_USB_MODE                     =$00000000;// USB mode                                                        
ELE_COMM_HID_MODE                     =$000000AA;// HID mode                                                        
                                                                                                                    
//device version                                                                                                                    
ELE_V0201                             =$00000201;  
ELE_V0220                             =$00000220;                                                                 
                                                                                                                    
//device type                                                                                                                    
ELE_LOCAL_DEVICE                      =$00000000;// desktop dongle                                                  
ELE_NET_DEVICE                        =$00000001;// network dongle                                                  
ELE_NORMAL_DEVICE                     =$00000000;// non-RTC dongle(dongle without clock function)                   
ELE_RTL_DEVICE                        =$00000002;// RTC dongle(dongle with clock function)                          
ELE_USER_DEVICE                       =$00000000;// user dongle                                                     
ELE_MASTER_DEVICE                     =$00000080;// control dongle                                                  
                                                                                                                    
//device information
ELE_GET_DEVICE_SERIAL                 =$00000001;// device serial number, 8bytes                                    
ELE_GET_VENDOR_DESC                   =$00000002;// manufacturer descritpion, 8bytes                                
ELE_GET_CURRENT_TIME                  =$00000004;// current time from dongle, only for RTC dongle                   
ELE_GET_DEVICE_VERSION                =$00000007;// device verion                                                   
ELE_GET_DEVICE_TYPE                   =$00000008;// device type                                                                                       
ELE_GET_MODIFY_TIME                   =$0000000A;// production date of the dongle                                 
ELE_GET_COMM_MODE                     =$0000000B;// communication mode, USB or HID                                  
ELE_GET_DEVELOPER_NUMBER              =$00000012;// developer number                                                
ELE_GET_MODULE_COUNT                  =$00000013;// module amount                                                   
ELE_GET_MODULE_SIZE                   =$00000014;// module size                                                     
                                                                                                                    
                                                                                                                    
//set information
ELE_RESET_DEVICE                      =$00000016;// reset device                                                    
ELE_SET_LED_UP                        =$00000017;// LED up                                                          
ELE_SET_LED_DOWN                      =$00000018;// LED down                                                        
ELE_SET_LED_FLASH                     =$00000019;// LED blinking                                                    
ELE_SET_COMM_MODE                     =$0000001A;// set communication mode                                          
ELE_SET_VENDOR_DESC                   =$0000001B;// set manufacturer description                                    
                                                                                                                    
//error code
ELE_SUCCESS                           =$00000000; // successful                                                                                          
ELE_INVALID_PARAMETER                 =$00000001; // invalid parameter                                              
ELE_INSUFFICIENT_BUFFER               =$00000002; // insufficient buffer                                            
ELE_NOT_ENOUGH_MEMORY                 =$00000003; // insufficient memory                                            
ELE_INVALID_DEVICE_HANDLE             =$00000004; // invalid device handle                                          
ELE_COMM_ERROR                        =$00000005; // communication error                                            
                                                                               
ELE_INVALID_SHARE_MODE                =$00000006;// open device with invalid share mode                                                                                         
ELE_UNSUPPORTED_OS                    =$00000007;// no supported operating system                                   
ELE_ENUMERATE_DEVICE_FAILED           =$00000008;// failed to enumerate device                                      
ELE_NO_MORE_DEVICE                    =$00000009;// no matched device                                               
                                                  
ELE_VERSION_NOT_MACTH                 =$00000022;// hardware version does not match
ELE_UNSUPPORTED_DEVICE_VERSION        =$00000023;// unsupported hardware version                                                                                                                    
ELE_NOT_RTL_DEVICE                    =$00000024;// not RTC device                                                  
ELE_NOT_MASTER_DEVICE                 =$00000025;// not control dongle                                              
ELE_MODULE_NOT_FOUND                  =$00000027;// the module doesn't exist                                        
ELE_MODULE_SIZE_BEYOND                =$00000028;// out of module range                                             
ELE_INVALID_PACKAGE                   =$0000002C;// invalid package                                                 
ELE_INVALID_STRUCTURE_SIZE            =$00000066;// invalid size field                                              
ELE_CLOSE_DEVICE_FAILED               =$00000067;// faield to close device                                          
ELE_VERIFY_SIGNATURE_ERROR            =$00000068;// failed to verify signature                                      
ELE_INVALID_CODE_SIZE		              =$00000069;// the size of code section isn't 3K     
ELE_INVALID_CODE_SIZE_6k		      =$00000070;// the size of code section isn't 6K                          
                                                                                                                    
//Hardware's error                                                                                                  
                                                                                                                    
ELE_WRITE_FLASH_ERROR                 =$00008001;// error occurs when writing eeprom                                
ELE_UNSUPPORTED_FUNCTION              =$00008002;// function not support                                            
ELE_RTC_ERROR                         =$00008003;// read clock module error                                         
ELE_RTC_POWER_OFF                     =$00008004;// the clock module is power off                                   
ELE_WRONG_COMMAND_INS                 =$00008101;// invalid INS                                                     
ELE_WRONG_COMMAND_CLA                 =$00008102;// invalid CLA                                                     
ELE_WRONG_COMMAND_LC                  =$00008301;// invalid LC                                                      
ELE_WRONG_COMMAND_DATA                =$00008302;// invalid DATA                                                    
ELE_WRONG_COMMAND_LE                  =$00008303;// invalid LE                                                      
ELE_WRONG_COMMAND_PP                  =$00008306;// invalid PP                                                      
ELE_INVALID_OFFSET                    =$00008307;// invalid offset                                                  
ELE_INVALID_MODULE                    =$00008501;// invalid module                                                  
ELE_MACHINE_CODE_MISMATCH             =$00008502;// machine code mismatch                                           
ELE_INVALID_HEAD_SIZE                 =$00008503;// invalid optional head size                                      
ELE_INVALID_SECTION_NUMBER            =$00008504;// invalid section number                                          
ELE_SECTION_NOT_FOUND                 =$00008505;// section doesn't exist                                           
ELE_INVALID_SECTION_OFFSET            =$00008506;// invalid section offset                                          
ELE_INVALID_SECTION_SIZE              =$00008507;// invalid section size                                            
ELE_SECTION_TYPE_MISMATCH             =$00008508;// section type mismach                                            
ELE_ANONYMOUS_USER                    =$00008800;// anonymous user                                                  
ELE_DEVICE_STATE_MISMATCH             =$00008801;// device state mismatch                                           
ELE_SECURITY_STATE_MISMATCH           =$00008802;// security state mismatch                                         
ELE_DEVICE_PIN_BLOCK                  =$00008803;// PIN is locked                                                   
ELE_SECURITY_MESSAGE_ERROR            =$00008808;// invalid security message in package                             
ELE_DEVICE_PIN_ERROR                  =$000088c0;// 88cx is PIN verification error, x times left to retry           
ELE_OBJECT_NOT_FOUND                  =$00008901;// object doesn't exist                                            
ELE_NO_CURRENT_MODULE                 =$00008902;// no current module                                               
ELE_OBJECT_NAME_ALREADY_EXIST         =$00008903;// object name is existent                                         
ELE_BEYOND_OBJECT_SIZE                =$00008905;// exceed object's size                                            
ELE_INVALID_OBJECT_HANDLE             =$00008906;// invalid object handle                                           
ELE_DEVICE_NOT_IN_WHITE_LIST          =$00008a01;// the updating device isn't existent in whitelist                 
ELE_BLOCK_CIPHER_ERROR                =$00008a02;// updating block's key is incorrect                               
ELE_BLOCK_SIGNATURE_ERROR             =$00008a03;// updating block's signature is incorrect                         
ELE_BLOCK_MISMATCH                    =$00008a04;// updating block mismatch                                         
ELE_ERROR_UNKNOWN                     =$00008fff;// unknown error                                                   
                                                                                                                    
ELE_ELC_ERROR_SES_EEPROM              =$00009001;// write eeprom failed                                             
ELE_ELC_ERROR_SES_UNSUPPORT           =$00009002;// function not support                                            
ELE_ELC_ERROR_SES_RTC                 =$00009003;// read clock module error                                         
ELE_ELC_ERROR_SES_RTC_POWER           =$00009004;// the clock module has been power down                            
ELE_ELC_ERROR_SES_MEMORY              =$00009201;// memory error                                                    
ELE_ELC_ERROR_SES_PARAM               =$00009204;// parameter error                                                 
ELE_ELC_ERROR_SES_OBJECT              =$00009901;// object error                                                    
                                                        

ELE_VM_W_CODE_RANGE   	              =$0000A001;// exceed ROM address space
ELE_VM_W_INST_RSV     	              =$0000A002;//invalid instruction
ELE_VM_W_IDATA_RANGE  	              =$0000A003;// exceed RAM address space
ELE_VM_W_BIT_RANGE    	              =$0000A004;// exceed BIT address space
ELE_VM_W_SFR_RANGE    	              =$0000A005;// exceed SFR address space
ELE_VM_W_XRAM_RANGE   	              =$0000A006;// exceed XRAM address sapce

//Hardware Version
ELE_HARDWARE_V0200                    =$00000200;// Hardware Version 2.0
ELE_HARDWARE_V0201                    =$00000201;// Hardware Version 2.1
ELE_HARDWARE_V0213                    =$00000213;// Hardware Version 2.1.3
ELE_HARDWARE_V0220                    =$00000220;// Hardware Version 2.2

type

ELE_DEVICE_CONTEXT = record
        ulSize: DWORD;                           
        ulFinger: DWORD;                         
        ulMask: DWORD;                           
        ucDevNumber: array [0..7] of Byte;       
        ucDesp: array [0..7] of Byte;            
        ucSerialNumber: array [0..7] of Byte;    
        ulShareMode: DWORD;                      
        ulIndex: DWORD;                          
        ulDriverMode: DWORD;                     
        hDevice: THandle;                        
        hMutex: THandle;                         
end;
PELE_DEVICE_CONTEXT = ^ELE_DEVICE_CONTEXT;

ELE_LIBVERSIONINFO  = record

  ulVersionInfoSize: DWORD;                      
  ulMajorVersion: DWORD;                         
  ulMinorVersion: DWORD;                         
  ulClientID: DWORD;                             
  acDesp: array [0..127] of Byte;                  
end;
PELE_LIBVERSIONINFO = ^ELE_LIBVERSIONINFO;

function EleSign(
        pDeviceContext: PELE_DEVICE_CONTEXT;
        pucSerial: PChar;
        pcModuleName: PChar;
        pucModuleContent: PChar;
        ulModuleSize: DWORD;
        pPkgBuffer: PChar;
        ulPkgBufferLen: DWORD;
        var pulActualPkgLen: DWORD;
        ulHardwareVersion: DWORD
): BOOL;stdcall;

function EleUpdate(
        pDeviceContext: PELE_DEVICE_CONTEXT;
        pucPkgContent: PChar;
        ulPkgLen: DWORD
): BOOL;stdcall;

function EleVerifyPin(
        pDeviceContext: PELE_DEVICE_CONTEXT;
        pucPin: PChar
): BOOL;stdcall;

function EleChangePin(
        pDeviceContext: PELE_DEVICE_CONTEXT;
        pucOldPin: PChar;
        pucNewPin: PChar
): BOOL;stdcall;

function EleReadModule(
        pDeviceContext: PELE_DEVICE_CONTEXT;
        pcModuleName: PChar;
        pucModuleBuffer: PChar;
        ulModuleBufferLen: DWORD;
        var pulActualModuleLen: DWORD
): BOOL;stdcall;

function EleWriteModule(
        pDeviceContext: PELE_DEVICE_CONTEXT;
        pcModuleName: PChar;
        pucModuleContent: PChar;
        ulModuleContentLen: DWORD;
        var pulActualWrittenLen: DWORD
): BOOL;stdcall;

function EleExecute(
        pDeviceContext: PELE_DEVICE_CONTEXT;
        pcModuleName: PChar;
        pucInput: PChar;
        ulInputLen: DWORD;
        pucOutput: PChar;
        ulOutputLen: DWORD;
        var pulActualOutputLen: DWORD
): BOOL;stdcall;

function EleGetFirstModuleName(
        pDeviceContext: PELE_DEVICE_CONTEXT;
        pcModuleNameBuffer: PChar;
        ulModuleNameBufferLen: DWORD;
        var pulModuleNameLen: DWORD;
        var pulIndex: DWORD
): BOOL;stdcall;

function EleGetNextModuleName(
        pDeviceContext: PELE_DEVICE_CONTEXT;
        pcModuleNameBuffer: PChar;
        ulModuleNameBufferLen: DWORD;
        var pulModuleNameLen: DWORD;
        var pulIndex: DWORD
): BOOL;stdcall;

function EleOpenFirstDevice(
        pucDevNumber: PChar;
        pucDesp: PChar;
        pucSerialNumber: PChar;
        ulShareMode: DWORD;
        pDeviceContext: PELE_DEVICE_CONTEXT
): BOOL;stdcall;

function EleOpenNextDevice(pDeviceContext: PELE_DEVICE_CONTEXT): BOOL;stdcall;

function EleClose(pDeviceContext: PELE_DEVICE_CONTEXT): BOOL;stdcall;

function EleControl(
        pDeviceContext: PELE_DEVICE_CONTEXT;
        ulCtrlCode: DWORD;
        pucInput: PChar;
        ulInputLen: DWORD;
        pucOutput: PChar;
        ulOutputLen: DWORD;
        var pulActualLen: DWORD
): BOOL;stdcall;

function EleChangeModuleName (
        pDeviceContext: PELE_DEVICE_CONTEXT;
        pcOldModuleName:Pchar;
        pcNewModuleName:Pchar
):BOOL;stdcall;


function EleGetLastError(): DWORD;stdcall;

function EleGetVersion(pE3LibVersionInfo: PELE_LIBVERSIONINFO): BOOL;stdcall;
