{
 *****************************************************************************
 * Copyright @ 2011 by YOWO RFID                                             *
 * All rights are reserved.                                                  *
 *                                                                           *
 * YW SDT RFID Reader   Include File                                         *
 * Delphi                                                                    *
 * SDT.pas                                                                 *
 * file vesion: 1.2                                                          *
 * web: http://www.youwokeji.com.cn                                          *
 * tel: 010-59395668                                                         *
 *****************************************************************************
}

unit SDT;

interface


const REQUESTMODE_ALL      =    $52;
const REQUESTMODE_ACTIVE   =    $26;

const PASSWORD_A           =    $60;
const PASSWORD_B           =    $61;

const SAM_BOUND_9600	     =	  0;
const SAM_BOUND_38400	     =	  1;
                        
const  ENCRYPT             =    0;
const  DECRYPT             =    1;


const SDTDLL          =    'SDT.dll';

//*******************************************DLL��غ��� ************************/

{
/*    ������ YW_GetDLLVersion
 *    ���ƣ� ���ص�ǰDLL�İ汾
 *    ��������
 *  ����ֵ���汾��
*/ 
}
function  YW_GetDLLVersion(): Integer;stdcall;external SDTDLL;


{
/*    ������ DES
 *    ���ƣ� DES�ӽ��ܺ���
 *    ������cModel�� ���ܻ��߽��� �� 0���ܣ�1���ܣ���Ӧ����ENCRYPT =0��DECRYPT = 1
              pkey���ӽ�����Կָ�룬8���ֽ�
            inData��Ҫ�ӽ��ܵ�����ָ�룬8���ֽ�
            OutData: �����ӽ��ܺ������ָ�룬8���ֽ�
 *  ����ֵ��������
*/ 
}
function DES(cModel:Byte;pkey: PChar;InData:PChar;OutData:PChar): Integer;stdcall;external SDTDLL;


{
/*    ������ DES3
 *    ���ƣ� 3DES�ӽ��ܺ���
 *    ������cModel�� ���ܻ��߽��� �� 0���ܣ�1���ܣ���Ӧ����ENCRYPT =0��DECRYPT = 1
              pkey���ӽ�����Կָ�룬16���ֽ�
            inData��Ҫ�ӽ��ܵ�����ָ�룬8���ֽ�
            OutData: �����ӽ��ܺ������ָ�룬8���ֽ�
 *  ����ֵ��������
*/ 
}
function DES3(cModel:Byte;pkey: PChar;InData:PChar;OutData:PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ DES3_CBC
 *    ���ƣ� ��������3DES�ӽ��ܺ���
 *    ������cModel�� ���ܻ��߽��� �� 0���ܣ�1���ܣ���Ӧ����ENCRYPT =0��DECRYPT = 1
             pkey���ӽ�����Կָ�룬8���ֽ�
             inData��Ҫ�ӽ��ܵ�����ָ�룬8���ֽ�
             OutData: �����ӽ��ܺ������ָ�룬8���ֽ�
             pIV:    ����ָ�룬8���ֽ�

 *  ����ֵ��������
*/ 
}
function DES3_CBC(cModel:Byte;pkey: PChar;InData:PChar;OutData:PChar;pIV:PChar): Integer;stdcall;external SDTDLL;


//*******************************************��д����غ��� ************************/


{
/*    ������ YW_USBHIDInitial
 *    ���ƣ� ����USB�˿ڳ�ʼ��
 *    ������ ��
 *  ����ֵ��>0Ϊ�ɹ� ������ʧ��
*/ 
}
function  YW_USBHIDInitial(): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_USBHIDInitial
 *    ���ƣ� ����USB�˿��ͷ�
 *    ������ ��
 *  ����ֵ��>0Ϊ�ɹ�������ʧ��
*/ 
}
function  YW_USBHIDFree(): Integer;stdcall;external SDTDLL;


{
/*    ������ YW_SetReaderID
 *    ���ƣ� ���ö�д��ID
 *    ������ OldID����д���ϵ�ID
             NewID����д���µ�ID
 *  ����ֵ��>0Ϊ�ɹ�������ʧ��
*/
}
function  YW_SetReaderID(OldID: Integer; NewID: Integer): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_GetReaderID
 *    ���ƣ� ��ȡ��д��ID
 *    ������ ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
 *  ����ֵ��>=0Ϊ�ɹ�������Ϊ��д��ID ������ʧ��
*/
}
function  YW_GetReaderID(ReaderID: Integer): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_GetReaderVersion
 *    ���ƣ� ��ȡ��д���İ汾
 *    ������ ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
 *  ����ֵ��>=0Ϊ�ɹ�������Ϊ��д���汾 ������ʧ��
*/
}
function  YW_GetReaderVersion(ReaderID: Integer): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_GetReaderSerial
 *    ���ƣ� ��ȡ��д�������к�
 *    ������     ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
             ReaderSerial�����Ϊ��д�������кţ�8���ֽ�
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_GetReaderSerial(ReaderID: Integer; ReaderSerial: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_GetReaderNo
 *    ���ƣ� ��ȡ��д�����ͺ�
 *    ������ ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
              ReadeNo�����Ϊ��д�����ͺţ�8���ֽ�
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function   YW_GetReaderNo(ReaderID: Integer; ReadeNo: PChar): Integer;stdcall;external SDTDLL;


{
/*    ������ YW_Buzzer
 *    ���ƣ� ��������������
 *    ������ ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
              Time_ON����������ʱ�䣬��λ0.1s
             Time_OFF������������ʱ�䣬��λ0.1s
                Cycle��  ������ѭ������
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_Buzzer(ReaderID: Integer;Time_ON: Integer;Time_OFF: Integer;Cycle: Integer): Integer;stdcall;external SDTDLL;   //5


{
/*    ������ YW_Led
 *    ���ƣ� LED�Ʋ�������
 *    ������ ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
             LEDIndex��ѡ��Ҫ������LED��
              Time_ON�� ������ʱ�䣬��λ0.1s
             Time_OFF���Ʋ���ʱ�䣬��λ0.1s
                Cycle��   ѭ������
             LedIndexOn�����Ҫ���ĵ�
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_Led(ReaderID: Integer;LEDIndex: Integer;Time_ON: Integer;Time_OFF: Integer;Cycle: Integer;LedIndexOn: Integer): Integer;stdcall;external SDTDLL;    //6


{
/*    ������ YW_AntennaStatus
 *    ���ƣ� �������ߣ������п�����֮ǰ���뿪������
 *    ������  ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
               Status: trueΪ�������ߣ� falseΪ�ر�����
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_AntennaStatus(ReaderID: Integer;Status: Boolean): Integer;stdcall;external SDTDLL;


//*******************************************ISO14443A��Ƭ�������� ************************/


{
/*    ������ YW_RequestCard
 *    ���ƣ� Ѱ��TypeA��
 *    ������  ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
           RequestMode: Ѱ��ģʽ
                        ���п�  ���� REQUESTMODE_ALL=$52;
                        ����Ŀ� ���� REQUESTMODE_ACTIVE=$26;
           CardType�����������
                      0x4400 -> Ultralight/UltraLight C /MifarePlus(7Byte UID)
                      0x4200 -> MifarePlus(7Byte UID)
                      0x0400 ->Mifare Mini/Mifare 1K (S50) /MifarePlus(4Byte UID)
                      0x0200->Mifare_4K(S70)/ MifarePlus(4Byte UID)
                      0x4403 ->Mifare_DESFire
                      0x0800 ->Mifare_Pro
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_RequestCard(ReaderID: Integer;RequestMode: Byte;var CardType: Word): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_AntiCollide
 *    ���ƣ� �ó�ͻ����
 *    ������  ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
           LenSNO:   ������ŵĳ���
              SNO��  �������
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_AntiCollide(ReaderID: Integer; var LenSNO: Byte; SNO: PChar): Integer;stdcall;external SDTDLL;


{
/*    ������ YW_CardSelect
 *    ���ƣ� ѡ��
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
                LenSNO:   Ҫѡ�񿨿��ŵĳ���
                   SNO��  Ҫѡ�񿨿���
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_CardSelect(ReaderID: Integer; LenSNO: Byte; SNO: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_KeyAuthorization
 *    ���ƣ� M1����Ȩ
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
                KeyMode:  ��Կѡ��Key A����Key B
                           ����  PASSWORD_A           =    $60;
                           ����  PASSWORD_B           =    $61;
              BlockAddr��  Ҫ��Ȩ�Ŀ�
                   Key��  ��Կ�ֽ�ָ�룬6�ֽ�
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_KeyAuthorization(ReaderID: Integer;KeyMode: Byte;BlockAddr: Integer; Key: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_ReadaBlock
 *    ���ƣ� ��ȡM1��һ����
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
             BlockAddr:   Ҫ��ȡ�Ŀ��
              LenData��  Ҫ��ȡ���ֽ��������Ϊ16
                 Data��  ����ָ��
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_ReadaBlock(ReaderID: Integer;BlockAddr: Integer;LenData: Integer; Data: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_WriteaBlock
 *    ���ƣ� д��M1��һ����
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
             BlockAddr:   Ҫд��Ŀ��
              LenData��  Ҫ��ȡ���ֽ���������Ϊ16
                 Data��  ����ָ��
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_WriteaBlock(ReaderID: Integer;BlockAddr: Integer; LenData: Integer; Data: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_Purse_Initial
 *    ���ƣ� M1����ĳһ���ʼ��Ǯ��
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
             BlockAddr:   Ҫ��ʼ��Ǯ���Ŀ��
              IniValue��  Ǯ����ʼ��ֵ
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_Purse_Initial(ReaderID: Integer;BlockAddr: Integer; IniValue: Integer): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_Purse_Read
 *    ���ƣ� ��ȡM1��ĳ�����Ǯ��ֵ
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
             BlockAddr:   Ҫ��ʼ��Ǯ���Ŀ��
                Value��  Ǯ���ĵ�ǰֵ
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_Purse_Read(ReaderID: Integer;BlockAddr: Integer; var Value: Integer): Integer;stdcall;external SDTDLL;  //16

{
/*    ������ YW_Purse_Decrease
 *    ���ƣ� ��Ǯ�����м�ֵ����
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
             BlockAddr:   Ҫ��ʼ��Ǯ���Ŀ��
             Decrement��  Ҫ��ȥ��ֵ
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_Purse_Decrease(ReaderID: Integer;BlockAddr: Integer;Decrement: Integer): Integer;stdcall;external SDTDLL;  //17

{
/*    ������ YW_Purse_Decrease
 *    ���ƣ� ��Ǯ�����м�ֵ����
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
             BlockAddr:   Ҫ��ʼ��Ǯ���Ŀ��
             Charge��    Ҫ���ӵ�ֵ
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_Purse_Charge(ReaderID: Integer;BlockAddr: Integer;Charge: Integer): Integer;stdcall;external SDTDLL;  //18

{
/*    ������ YW_Purse_Decrease
 *    ���ƣ� ��Ǯ������Restor����
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
             BlockAddr:   Ǯ���Ŀ��
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_Restore(ReaderID: Integer;BlockAddr: Integer): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_Purse_Decrease
 *    ���ƣ� ��Ǯ������Transfer����
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
             BlockAddr:   Ǯ���Ŀ��
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_Transfer(ReaderID: Integer;BlockAddr: Integer): Integer;stdcall;external SDTDLL;


{
/*    ������ YW_CardHalt
 *    ���ƣ� ��M1������Halt����
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_CardHalt(ReaderID: Integer): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_AntiCollide_Level
 *    ���ƣ� ��M1������n������ײ
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
              Leveln��n������ײ����1��3
              LenSNO�����ŵĳ���
                SNO������ָ��
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function YW_AntiCollide_Level(ReaderID: Integer; Leveln: Integer;var LenSNO: Byte; SNO: PChar): Integer;stdcall;external SDTDLL;


{
/*    ������ YW_SelectCard_Level
 *    ���ƣ� ��M1������n��ѡ��
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
              Leveln��n������ײ����1��3
                 SAK�����SAK
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function YW_SelectCard_Level(ReaderID: Integer; Leveln: Integer;var SAK: Byte): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_AntiCollideAndSelect
 *    ���ƣ� ��M1�����з���ײ��ѡ��
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ

         MultiCardMode���Զ��ſ��Ĵ���ʽ
                         00  ���ض࿨����
                         01  ����һ�ſ�Ƭ
               CardMem�����ؿ����ڴ����
                SNOLen: ������ŵĳ���
                   SNO���������к�        
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}  
function  YW_AntiCollideAndSelect(ReaderID: Integer;MultiCardMode:Byte;var CardMem: Byte;var SNOLen:Integer;SNO: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_RequestAntiandSelect
 *    ���ƣ� ��M1��Ѱ��������ײ��ѡ��
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
           RequestMode��Ѱ��ģʽ
                        ���п�  ���� REQUESTMODE_ALL=$52;
                        ����Ŀ� ���� REQUESTMODE_ACTIVE=$26;
         MultiCardMode���Զ��ſ��Ĵ���ʽ
                         00  ���ض࿨����
                         01  ����һ�ſ�Ƭ
                 ATQA �� ATQA
                  SAK ��SAK
                SNOLen: ������ŵĳ���
                   SNO���������к�        
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function YW_RequestAntiandSelect(ReaderID: Integer; RequestMode: Byte;MultiCardMode:Byte; var ATQA: word; var SAK: Byte;var LenSNO:Byte; SNO: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_WriteM1MultiBlock
 *    ���ƣ� ��M1��д���
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
              StartBlock����ʼ���
              BlockNums�� Ҫд�ÿ�����
                LenData�� Ҫд�����ݳ��ȣ�16�ı���
                 pData��  Ҫд������
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function YW_WriteM1MultiBlock(ReaderID: Integer;  StartBlock: Integer; BlockNums: Integer; LenData: Integer; pData: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_ReadM1MultiBlock
 *    ���ƣ� ��M1����ȡ���
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
              StartBlock����ʼ���
              BlockNums�� Ҫ��ȡ�Ŀ�����
                LenData�� ���ض�ȡ�����ݳ���
                 pData��  ���ص�����
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function YW_ReadM1MultiBlock(ReaderID: Integer;  StartBlock: Integer; BlockNums: Integer;var LenData: Integer; pData: PChar): Integer;stdcall;external SDTDLL;


//*******************************************UltraLight��Ƭ�������� ************************/

{
/*    ������ YW_UltraLightRead
 *    ���ƣ� Ultra Light ����ȡ��
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
              BlockID �� ��ȡ�Ŀ��
                 pData��  ���ص�����
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_UltraLightRead(ReaderID: Integer; BlockID: Integer;pData: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_UltraLightWrite
 *    ���ƣ� Ultra Light ��д��
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
              BlockID �� Ҫд�Ŀ��
                 pData��  д�������
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_UltraLightWrite(ReaderID: Integer; BlockID: Integer;pData: PChar): Integer;stdcall;external SDTDLL;


//*******************************************Type A CPU ��Ƭ�������� ************************/

{
/*    ������ YW_TypeA_Reset
 *    ���ƣ� Type A CPU����λ
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
           RequestMode��Ѱ��ģʽ
                        ���п�  ���� REQUESTMODE_ALL=$52;
                        ����Ŀ� ���� REQUESTMODE_ACTIVE=$26;
         MultiCardMode���Զ��ſ��Ĵ���ʽ
                         00  ���ض࿨����
                         01  ����һ�ſ�Ƭ
                 rtLen: ��λ�������ݵĳ���        
                 pData�� ��λ���ص�����
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_TypeA_Reset(ReaderID: Integer; RequestMode: Byte;MultiCardMode:Byte; var rtLen: Integer; pData: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_TypeA_COS
 *    ���ƣ� Type A CPU��ִ��COS����
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
                LenCOS��  COS����ĳ���
               Com_COS��  COS����
                 rtLen:   ִ��COS�󷵻ص����ݳ���
                 pData��  ִ��COS�󷵻ص�����
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_TypeA_COS(ReaderID: Integer; LenCOS: Integer; Com_COS: PChar;var DataLen :Integer; pData: PChar): Integer;stdcall;external SDTDLL;


{
/*    ������ YW_SAM_ResetBaud
 *    ���ƣ� SAM����λ����������
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
             SAMIndex:   SAM�����
             BoundIndex:   ���������
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_SAM_ResetBaud(ReaderID: Integer;SAMIndex: Integer; BoundIndex: Integer): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_SAM_Reset
 *    ���ƣ� SAM����λ
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
              SAMIndex:   SAM�����
               DataLen:   ���ظ�λ���ݵĳ���
                 pData:   ��λ����
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_SAM_Reset(ReaderID: Integer;SAMIndex: Integer;var DataLen: Integer; pData: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_SAM_Reset
 *    ���ƣ� SAM����λ
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
              SAMIndex:   SAM�����
                LenCOS:   COS�����
               Com_COS:   COS��������
               DataLen:   ���ظ�λ���ݵĳ���
                 pData:   ��λ����
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_SAM_COS(ReaderID: Integer;SAMIndex: Integer;  LenCOS: Integer;  Com_COS: PChar; var DataLen: Integer; pData: PChar): Integer;stdcall;external SDTDLL;

{
/*    ������ YW_SAM_PPSBaud
 *    ���ƣ� SAM��PPS����������
 *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
              SAMIndex:   SAM�����  
             BoundIndex:   ���������
 *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
*/
}
function  YW_SAM_PPSBaud(ReaderID: Integer; SAMIndex: Integer; BaudIndex: Integer): Integer;stdcall;external SDTDLL;

implementation

end.
