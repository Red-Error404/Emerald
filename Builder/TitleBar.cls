VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "TitleBar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'======================================
'   ҳ�������
    Dim Page As GPage
'======================================

Public Sub Update()
    '�����¼�
    
    Page.Clear 0 '��ջ���

    Page.Writes "Emerald Builder", 20, 20, Color:=argb(255, 128, 128, 128), size:=16
    
    Dim m As Integer
    m = CheckMouse(GW - 60, 0, 60, 30 + 16 / 0.75)
    If ECore.ActivePage <> "SetupPage" Or SetupPage.DoneMark = True Then
        If Page.ShowColorButton(0, GW - 60, 0, 61, 30 + 16 / 0.75, "��", IIf(m = 0, argb(255, 128, 128, 128), argb(255, 255, 255, 255)), argb(0, 254, 84, 57), argb(255, 254, 84, 57), size:=18) = 2 Then
            Unload MainWindow
            End
        End If
    Else
        Page.ShowColorButton 0, GW - 60, 0, 61, 30 + 16 / 0.75, "��", argb(255, 168, 168, 168), argb(0, 254, 84, 57), argb(50, 128, 128, 128), size:=18
        If m = 3 Then MsgBox "��װ�����в�������ͣ���ǳ���Ǹ��", 48, "��װ����"
    End If
    m = CheckMouse(GW - 120, 0, 60, 30 + 16 / 0.75)
    If Page.ShowColorButton(0, GW - 120, 0, 61, 30 + 16 / 0.75, "-", IIf(m = 0, argb(255, 128, 128, 128), argb(255, 255, 255, 255)), argb(0, 128, 128, 128), argb(100, 128, 128, 128), size:=18) = 2 Then
        MainWindow.WindowState = 1
    End If
End Sub
Public Sub Wheel(Direction As Integer, Depth As Single)
    '�������¼�
    'Direction:����Depth�����
End Sub
Public Sub Enter()
    'ҳ������¼�
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
    Page.Res.NewImages App.Path & "\assets"
    Page.TopPage = True '�ö�ҳ��
    '����ҳ��
    ECore.Add Page, "TitleBar"
    
    '===============================================
    '   �����Ҫ���Ӷ�����������ڴ˴�
    
    '===============================================
End Sub