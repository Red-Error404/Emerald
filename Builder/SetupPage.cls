VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SetupPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'======================================
'   ҳ�������
    Dim Page As GPage
    Public Progress As Single, SetupInfo As String, DoneMark As Boolean
    Dim DisplayProgress As Single, ChangeTime As Long
'======================================
Public Sub UpdateDone()
    Page.Clear argb(255 * 0.85, 242, 242, 249) '��ջ���
    
    If CmdMark = "Uninstall" Then GoTo uninpage
    
    If SetupErr = 0 Then
        Page.Writes "Emerald Builder ��װ�ɹ�", GW / 2, 100, 30, argb(255, 27, 27, 27), align:=StringAlignmentCenter
        Page.Writes "����Դ���������Ҽ�������Ĺ��̰ɣ�", GW / 2, 140, 16, argb(150, 27, 27, 27), align:=StringAlignmentCenter, animation:=1
        
        Page.Paint 0, GW / 2, 160 + (GH - 160 - 80) / 2, GW + 1, 270, argb(255, 255, 255, 255), pos:=posOnCenter, animation:=2
        Page.DrawImage "tip.png", GW / 2, 160 + (GH - 160 - 80) / 2, Alpha:=1, pos:=posOnCenter, animation:=2
    Else
        Page.Writes "��װ�Ѿ���ɣ����Ƿ�����һЩ����", GW / 2, 200, 20, argb(255, 254, 84, 57), align:=StringAlignmentCenter
        Page.Writes "������룺0x" & format(Hex(SetupErr), "000000"), GW / 2, 230, 16, argb(150, 254, 84, 57), align:=StringAlignmentCenter
        Page.Writes Error(SetupErr), GW / 2, 250, 16, argb(150, 254, 84, 57), align:=StringAlignmentCenter
        
        Page.Writes "����ϵQQ 1361778219 ������Github���ύIssue", GW / 2, 400, 16, argb(150, 27, 27, 27), align:=StringAlignmentCenter
    End If
    
    If Page.ShowColorButton(0, GW / 2 - 130 / 2, GH - 80, 130, 40, "OK", argb(255, 255, 255, 255), argb(255, 85, 219, 211), argb(255, 55, 189, 181), size:=16) = 3 Then
        Unload MainWindow: End
    End If
    
    Exit Sub
    
uninpage:
    If SetupErr = 0 Then
        Page.Writes "Emerald Builder ж�����", GW / 2, GH / 2, 30, argb(255, 27, 27, 27), align:=StringAlignmentCenter
    Else
        Page.Writes "ж���Ѿ���ɣ����Ƿ�����һЩ����", GW / 2, 200, 20, argb(255, 254, 84, 57), align:=StringAlignmentCenter
        Page.Writes "������룺0x" & format(Hex(SetupErr), "000000"), GW / 2, 230, 16, argb(150, 254, 84, 57), align:=StringAlignmentCenter
        Page.Writes Error(SetupErr), GW / 2, 250, 16, argb(150, 254, 84, 57), align:=StringAlignmentCenter
        
        Page.Writes "����ϵQQ 1361778219 ������Github���ύIssue", GW / 2, 400, 16, argb(150, 27, 27, 27), align:=StringAlignmentCenter
    End If
End Sub
Public Sub Update()
    '�����¼�
    If DoneMark Then Call UpdateDone: Exit Sub
    
    If Progress <> DisplayProgress Then
        If GetTickCount - ChangeTime >= 10 Then
            ChangeTime = GetTickCount
            DisplayProgress = DisplayProgress + (Progress - DisplayProgress) / 30
        End If
        If DisplayProgress > Progress Or (Progress - DisplayProgress) < 0.001 Then DisplayProgress = Progress
    End If
        
    
    Page.Clear argb(255 * 0.85, 242, 242, 249) '��ջ���
    
    Page.PaintArc GW / 2, GH / 2 - 20, 200, 200, 360, -90, argb(255, 230, 230, 230), 2, 1, posOnCenter
    Page.PaintArc GW / 2, GH / 2 - 20, 200, 200, DisplayProgress * 360, -90, argb(255, 95, 229, 221), 3, 1, posOnCenter
    Page.Writes Int(DisplayProgress * 100), GW / 2, GH / 2 - 52, 50, argb(255, 27, 27, 27), align:=StringAlignmentCenter, style:=FontStyleBold

    Page.Writes SetupInfo, GW / 2, GH - 110, 18, argb(255, 64, 64, 64), align:=StringAlignmentCenter
    
    If DisplayProgress >= 0.9999 Then Page.StartAnimation 1, 500: Page.StartAnimation 2, 700: ECore.NewTransform , 400: DoneMark = True
End Sub
Public Sub Wheel(Direction As Integer, Depth As Single)
    '�������¼�
    'Direction:����Depth�����
End Sub
Public Sub Enter()
    'ҳ������¼�
    DisplayProgress = 0: Progress = 0: SetupInfo = "׼����": DoneMark = False
End Sub
Public Sub Leave()
    'ҳ���뿪�¼�
End Sub
Public Sub Gotfocus()
    '����ȡ�ý����¼�
End Sub
Public Sub Lostfocus()
    '����ʧȥ�����¼�
End Sub
Public Sub AnimationDone(id As Integer)
    '�������Ž����¼�
    'id�������Ķ���ID
End Sub
Private Sub Class_Initialize()
    '����ҳ�������
    Set Page = New GPage
    Page.Create Me
    '������Ϸ��Դ
    Page.Res.NewImages App.Path & "\assets", 0.7
    '����ҳ��
    ECore.Add Page, "SetupPage"
    
    '===============================================
    '   �����Ҫ���Ӷ�����������ڴ˴�
        Page.NewAnimation False, "FadeIn", 2, 400
        Page.NewAnimation False, "FadeIn", 2, 400
    '===============================================
End Sub