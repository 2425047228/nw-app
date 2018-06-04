Attribute VB_Name = "SDT"


' *****************************************************************************
' * Copyright @ 2011 by YOWO RFID                                             *
' * All rights are reserved.                                                  *
' *                                                                           *
' * YW SDT RFID Reader   Include File                                         *
' * VB                                                                        *
' * SDT.bas                                                                 *
' * file vesion: 1.2                                                          *
' * web: http://www.youwokeji.com.cn                                          *
' * tel: 010-59395668                                                         *
' *****************************************************************************

Global Const REQUESTMODE_ALL = &H52
Global Const REQUESTMODE_ACTIVE = &H26

Global Const SAM_BOUND_9600 = 0
Global Const SAM_BOUND_38400 = 1

Global Const PASSWORD_A = &H60
Global Const PASSWORD_B = &H61

Global Const ENCRYPT = 0
Global Const DECRYPT = 1


'//*******************************************DLL��غ��� ************************/


'/*    ������ YW_GetDLLVersion
' *    ���ƣ� ���ص�ǰDLL�İ汾
' *    ��������
' *  ����ֵ���汾��
'*/

Public Declare Function YW_GetDLLVersion Lib "SDT.dll" () As Long



'/*    ������ DES
' *    ���ƣ� DES�ӽ��ܺ���
' *    ������cModel�� ���ܻ��߽��� �� 0���ܣ�1���ܣ���Ӧ����ENCRYPT =0��DECRYPT = 1
'              pkey���ӽ�����Կָ�룬8���ֽ�
'            inData��Ҫ�ӽ��ܵ�����ָ�룬8���ֽ�
'            OutData: �����ӽ��ܺ������ָ�룬8���ֽ�
' *  ����ֵ��������
'*/

Public Declare Function DES Lib "SDT.dll" (ByVal cModel As Byte, ByRef pkey As Byte, ByRef InData As Byte, ByRef OutData As Byte) As Long



'/*    ������ DES3
' *    ���ƣ� 3DES�ӽ��ܺ���
' *    ������cModel�� ���ܻ��߽��� �� 0���ܣ�1���ܣ���Ӧ����ENCRYPT =0��DECRYPT = 1
'              pkey���ӽ�����Կָ�룬16���ֽ�
'            inData��Ҫ�ӽ��ܵ�����ָ�룬8���ֽ�
'            OutData: �����ӽ��ܺ������ָ�룬8���ֽ�
' *  ����ֵ��������
'*/
Public Declare Function DES3 Lib "SDT.dll" (ByVal cModel As Byte, ByRef pkey As Byte, ByRef InData As Byte, ByRef OutData As Byte) As Long


'/*    ������ DES3_CBC
' *    ���ƣ� ��������3DES�ӽ��ܺ���
' *    ������cModel�� ���ܻ��߽��� �� 0���ܣ�1���ܣ���Ӧ����ENCRYPT =0��DECRYPT = 1
'             pkey���ӽ�����Կָ�룬8���ֽ�
'             inData��Ҫ�ӽ��ܵ�����ָ�룬8���ֽ�
'             OutData: �����ӽ��ܺ������ָ�룬8���ֽ�
'             pIV:    ����ָ�룬8���ֽ�
'
' *  ����ֵ��������
'*/

Public Declare Function DES3_CBC Lib "SDT.dll" (ByVal cModel As Byte, ByRef pkey As Byte, ByRef InData As Byte, ByRef OutData As Byte, ByRef pIV As Byte) As Long


'//*******************************************��д����غ��� ************************/



'{
'/*    ������ YW_USBHIDInitial
' *    ���ƣ� ����USB�˿ڳ�ʼ��
' *    ������ ��
' *  ����ֵ��>0Ϊ�ɹ� ������ʧ��
'*/
'}
Public Declare Function YW_USBHIDInitial Lib "SDT.dll" () As Long

'{
'/*    ������ YW_USBHIDInitial
' *    ���ƣ� ����USB�˿��ͷ�
' *    ������ ��
' *  ����ֵ��>0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_USBHIDFree Lib "SDT.dll" () As Long




'{
'/*    ������ YW_ComNewBound
' *    ���ƣ� ���Ĵ��ڲ�����
' *    ������ NewBound�� �µĲ�����
' *  ����ֵ��>0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_SetReaderID Lib "SDT.dll" (ByVal OldID As Integer, ByVal NewID As Integer) As Long

'{
'/*    ������ YW_GetReaderID
' *    ���ƣ� ��ȡ��д��ID
' *    ������ ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
' *  ����ֵ��>=0Ϊ�ɹ�������Ϊ��д��ID ������ʧ��
'*/
'}
Public Declare Function YW_GetReaderID Lib "SDT.dll" (ByVal ReaderID As Integer) As Long

'{
'/*    ������ YW_GetReaderVersion
' *    ���ƣ� ��ȡ��д���İ汾
' *    ������ ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
' *  ����ֵ��>=0Ϊ�ɹ�������Ϊ��д���汾 ������ʧ��
'*/
'}
Public Declare Function YW_GetReaderVersion Lib "SDT.dll" (ByVal ReaderID As Integer) As Long

'{
'/*    ������ YW_GetReaderSerial
' *    ���ƣ� ��ȡ��д�������к�
' *    ������     ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
'             ReaderSerial�����Ϊ��д�������кţ�8���ֽ�
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_GetReaderSerial Lib "SDT.dll" (ByVal ReaderID As Integer, ByRef ReaderSerial As Byte) As Long

'{
'/*    ������ YW_GetReaderNo
' *    ���ƣ� ��ȡ��д�����ͺ�
' *    ������ ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
'              ReadeNo�����Ϊ��д�����ͺţ�8���ֽ�
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_GetReaderNo Lib "SDT.dll" (ByVal ReaderID As Integer, ByRef ReadeNo As Byte) As Long

'
'{
'/*    ������ YW_Buzzer
' *    ���ƣ� ��������������
' *    ������ ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
'              Time_ON����������ʱ�䣬��λ0.1s
'             Time_OFF������������ʱ�䣬��λ0.1s
'Cycle:                   ������ѭ������
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_Buzzer Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal Time_ON As Integer, ByVal Time_OFF As Integer, ByVal Cycle As Integer) As Long


'{
'/*    ������ YW_Led
' *    ���ƣ� LED�Ʋ�������
' *    ������ ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
'LEDIndex:              ѡ��Ҫ������LED��
'              Time_ON�� ������ʱ�䣬��λ0.1s
'             Time_OFF���Ʋ���ʱ�䣬��λ0.1s
'Cycle:                    ѭ������
'LedIndexOn:              ���Ҫ���ĵ�
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_Led Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal LEDIndex As Integer, ByVal Time_ON As Integer, ByVal Time_OFF As Integer, ByVal Cycle As Integer, ByVal LedIndexOn As Integer) As Long


'{
'/*    ������ YW_AntennaStatus
' *    ���ƣ� �������ߣ������п�����֮ǰ���뿪������
' *    ������  ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
'               Status: trueΪ�������ߣ� falseΪ�ر�����
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_AntennaStatus Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal Status As Boolean) As Long


'//*******************************************ISO14443A��Ƭ�������� ************************/


'{
'/*    ������ YW_RequestCard
' *    ���ƣ� Ѱ��TypeA��
' *    ������  ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
'RequestMode:            Ѱ��ģʽ
'                        ���п�  ���� REQUESTMODE_ALL=$52,
'                        ����Ŀ� ���� REQUESTMODE_ACTIVE=$26,
'CardType:            ���������
'                      0x4400 -> Ultralight/UltraLight C /MifarePlus(7Byte UID)
'                      0x4200 -> MifarePlus(7Byte UID)
'                      0x0400 ->Mifare Mini/Mifare 1K (S50) /MifarePlus(4Byte UID)
'                      0x0200->Mifare_4K(S70)/ MifarePlus(4Byte UID)
'                      0x4403 ->Mifare_DESFire
'                      0x0800 ->Mifare_Pro
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_RequestCard Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal RequestMode As Byte, ByRef CardType As Integer) As Long

'{
'/*    ������ YW_AntiCollide
' *    ���ƣ� �ó�ͻ����
' *    ������  ReaderID����д��ID�ţ�0Ϊ�㲥��ַ
'LenSNO:              ������ŵĳ���
'SNO:                 �������
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_AntiCollide Lib "SDT.dll" (ByVal ReaderID As Integer, ByRef LenSNO As Byte, ByRef SNO As Byte) As Long

'
'{
'/*    ������ YW_CardSelect
' *    ���ƣ� ѡ��
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'LenSNO:                   Ҫѡ�񿨿��ŵĳ���
'SNO:                      Ҫѡ�񿨿���
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_CardSelect Lib "SDT.dll" (ByVal ReaderID As Integer, ByRef LenSNO As Byte, ByRef SNO As Byte) As Long

'{
'/*    ������ YW_KeyAuthorization
' *    ���ƣ� M1����Ȩ
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'                KeyMode:  ��Կѡ��Key A����Key B
'                           ����  PASSWORD_A           =    $60,
'                           ����  PASSWORD_B           =    $61,
'BlockAddr:                 Ҫ��Ȩ�Ŀ�
'                   Key��  ��Կ�ֽ�ָ�룬6�ֽ�
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_KeyAuthorization Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal KeyMode As Byte, ByVal BlockAddr As Integer, ByRef Key As Byte) As Long

'{
'/*    ������ YW_ReadaBlock
' *    ���ƣ� ��ȡM1��һ����
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'BlockAddr:                Ҫ��ȡ�Ŀ��
'              LenData��  Ҫ��ȡ���ֽ��������Ϊ16
'Data:                    ����ָ��
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_ReadaBlock Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal BlockAddr As Integer, ByVal LenData As Integer, ByRef Data As Byte) As Long

'{
'/*    ������ YW_WriteaBlock
' *    ���ƣ� д��M1��һ����
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'BlockAddr:                Ҫд��Ŀ��
'              LenData��  Ҫ��ȡ���ֽ���������Ϊ16
'Data:                    ����ָ��
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_WriteaBlock Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal BlockAddr As Integer, ByVal LenData As Integer, ByRef Data As Byte) As Long

'{
'/*    ������ YW_Purse_Initial
' *    ���ƣ� M1����ĳһ���ʼ��Ǯ��
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'BlockAddr:                Ҫ��ʼ��Ǯ���Ŀ��
'IniValue:                 Ǯ����ʼ��ֵ
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_Purse_Initial Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal BlockAddr As Integer, ByVal IniValue As Integer) As Long
'
'{
'/*    ������ YW_Purse_Read
' *    ���ƣ� ��ȡM1��ĳ�����Ǯ��ֵ
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'BlockAddr:                Ҫ��ʼ��Ǯ���Ŀ��
'Value:                   Ǯ���ĵ�ǰֵ
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_Purse_Read Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal BlockAddr As Integer, ByRef Value As Integer) As Long

'{
'/*    ������ YW_Purse_Decrease
' *    ���ƣ� ��Ǯ�����м�ֵ����
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'BlockAddr:                Ҫ��ʼ��Ǯ���Ŀ��
'Decrement:                Ҫ��ȥ��ֵ
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_Purse_Decrease Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal BlockAddr As Integer, ByVal Decrement As Integer) As Long

'{
'/*    ������ YW_Purse_Decrease
' *    ���ƣ� ��Ǯ�����м�ֵ����
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'BlockAddr:                Ҫ��ʼ��Ǯ���Ŀ��
'Charge:                  Ҫ���ӵ�ֵ
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_Purse_Charge Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal BlockAddr As Integer, ByVal Charge As Integer) As Long

'{
'/*    ������ YW_Purse_Decrease
' *    ���ƣ� ��Ǯ������Restor����
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'BlockAddr:                Ǯ���Ŀ��
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_Restore Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal BlockAddr As Integer) As Long

'{
'/*    ������ YW_Purse_Decrease
' *    ���ƣ� ��Ǯ������Transfer����
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'BlockAddr:                Ǯ���Ŀ��
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_Transfer Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal BlockAddr As Integer) As Long


'{
'/*    ������ YW_CardHalt
' *    ���ƣ� ��M1������Halt����
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_CardHalt Lib "SDT.dll" (ReaderID As Integer) As Long

'{
'/*    ������ YW_AntiCollide_Level
' *    ���ƣ� ��M1������n������ײ
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'              Leveln��n������ײ����1��3
'LenSNO:               ���ŵĳ���
'SNO:                 ����ָ��
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_AntiCollide_Level Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal Leveln As Integer, ByRef LenSNO As Byte, ByRef SNO As Byte) As Long


'{
'/*    ������ YW_SelectCard_Level
' *    ���ƣ� ��M1������n��ѡ��
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'              Leveln��n������ײ����1��3
'SAK:                  ���SAK
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_SelectCard_Level Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal Leveln As Integer, ByRef SAK As Byte) As Long

'{
'/*    ������ YW_AntiCollideAndSelect
' *    ���ƣ� ��M1�����з���ײ��ѡ��
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'RequestMode:            Ѱ��ģʽ
'                        ���п�  ���� REQUESTMODE_ALL=$52,
'                        ����Ŀ� ���� REQUESTMODE_ACTIVE=$26,
'MultiCardMode:          �Զ��ſ��Ĵ���ʽ
'0                            ���ض࿨����
'1                            ����һ�ſ�Ƭ
'CardMem:                ���ؿ����ڴ����
'SNOLen:                 ������ŵĳ���
'SNO:                    �������к�
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_AntiCollideAndSelect Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal MultiCardMode As Byte, ByRef CardMem As Byte, ByRef SNOLen As Long, ByRef SNO As Byte) As Long

'{
'/*    ������ YW_RequestAntiandSelect
' *    ���ƣ� ��M1��Ѱ��������ײ��ѡ��
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ

'MultiCardMode:          �Զ��ſ��Ĵ���ʽ
'0                            ���ض࿨����
'1                            ����һ�ſ�Ƭ
'ATQA:                    ATQA
'SAK:                    SAK
'SNOLen:                 ������ŵĳ���
'SNO:                    �������к�
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_RequestAntiandSelect Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal RequestMode As Byte, ByVal MultiCardMode As Byte, ByRef ATQA As Integer, ByRef SAK As Byte, ByRef LenSNO As Byte, ByRef SNO As Byte) As Long

'{
'/*    ������ YW_WriteM1MultiBlock
' *    ���ƣ� ��M1��д���
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'StartBlock:               ��ʼ���
'BlockNums:                Ҫд�ÿ�����
'                LenData�� Ҫд�����ݳ��ȣ�16�ı���
'PData:                    Ҫд������
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_WriteM1MultiBlock Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal StartBlock As Integer, ByVal BlockNums As Integer, ByVal LenData As Integer, ByRef PData As Byte) As Long

'{
'/*    ������ YW_ReadM1MultiBlock
' *    ���ƣ� ��M1����ȡ���
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'StartBlock:               ��ʼ���
'BlockNums:                Ҫ��ȡ�Ŀ�����
'LenData:                  ���ض�ȡ�����ݳ���
'PData:                    ���ص�����
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_ReadM1MultiBlock Lib "SDT.dll" (ByVal ReaderID As Integer, StartBlock As Integer, BlockNums As Integer, ByRef LenData As Integer, ByRef PData As Byte) As Long


'//*******************************************UltraLight��Ƭ�������� ************************/

'{
'/*    ������ YW_UltraLightRead
' *    ���ƣ� Ultra Light ����ȡ��
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'BlockID:                 ��ȡ�Ŀ��
'PData:                    ���ص�����
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_UltraLightRead Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal BlockID As Integer, ByRef PData As Byte) As Long

'{
'/*    ������ YW_UltraLightWrite
' *    ���ƣ� Ultra Light ��д��
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'BlockID:                 Ҫд�Ŀ��
'PData:                    д�������
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_UltraLightWrite Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal BlockID As Integer, ByRef PData As Byte) As Long


'//*******************************************Type A CPU ��Ƭ�������� ************************/

'{
'/*    ������ YW_TypeA_Reset
' *    ���ƣ� Type A CPU����λ
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'RequestMode:            Ѱ��ģʽ
'                        ���п�  ���� REQUESTMODE_ALL=$52,
'                        ����Ŀ� ���� REQUESTMODE_ACTIVE=$26,
'MultiCardMode:          �Զ��ſ��Ĵ���ʽ
'0                            ���ض࿨����
'1                            ����һ�ſ�Ƭ
'rtLen:                  ��λ�������ݵĳ���
'PData:                   ��λ���ص�����
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_TypeA_Reset Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal RequestMode As Byte, ByVal MultiCardMode As Byte, ByRef rtLen As Integer, ByRef PData As Byte) As Long

'{
'/*    ������ YW_TypeA_COS
' *    ���ƣ� Type A CPU��ִ��COS����
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'LenCOS:                   COS����ĳ���
'Com_COS:                  COS����
'rtLen:                    ִ��COS�󷵻ص����ݳ���
'PData:                    ִ��COS�󷵻ص�����
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_TypeA_COS Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal LenCOS As Integer, ByVal Com_COS As Byte, ByRef DataLen As Integer, ByRef PData As Byte) As Long


'{
'/*    ������ YW_SAM_ResetBaud
' *    ���ƣ� SAM����λ����������
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'SAMIndex:                SAM�����
'BoundIndex:                ���������
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_SAM_ResetBaud Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal SAMIndex As Integer, ByVal BoundIndex As Integer) As Long

'{
'/*    ������ YW_SAM_Reset
' *    ���ƣ� SAM����λ
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'SAMIndex:                 SAM�����
'DataLen:                  ���ظ�λ���ݵĳ���
'PData:                    ��λ����
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_SAM_Reset Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal SAMIndex As Integer, ByRef DataLen As Integer, ByRef PData As Byte) As Long

'{
'/*    ������ YW_SAM_Reset
' *    ���ƣ� SAM����λ
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'SAMIndex:                 SAM�����
'LenCOS:                   COS�����
'Com_COS:                  COS��������
'DataLen:                  ���ظ�λ���ݵĳ���
'PData:                    ��λ����
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_SAM_COS Lib "SDT.dll" (ByVal ReaderID As Integer, ByVal ByValSAMIndex As Integer, ByVal LenCOS As Integer, ByRef Com_COS As Byte, ByRef DataLen As Integer, ByRef PData As Byte) As Long

'{
'/*    ������ YW_SAM_PPSBaud
' *    ���ƣ� SAM��PPS����������
' *    ������  ReaderID��  ��д��ID�ţ�0Ϊ�㲥��ַ
'SAMIndex:                 SAM�����
'BoundIndex:                ���������
' *  ����ֵ��>=0Ϊ�ɹ�������ʧ��
'*/
'}
Public Declare Function YW_SAM_PPSBaud Lib "SDT.dll" (ByVal ReaderID As Integer, ByValSAMIndex As Integer, ByVal BaudIndex As Integer) As Long


