VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "WelcomePage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'======================================
'   ҳ�������
    Public Page As GPage
'======================================
    Dim HideTime As Long

Public Sub Update()
    '�����¼�
    
    Dim BtnStr As String
    
    Page.Clear argb(255 * 0.85, 242, 242, 249) '��ջ���
    
    If Repaired Then
        Page.Writes "Something Wrong", GW / 2, 200, Color:=argb(255, 27, 27, 27), size:=36, align:=StringAlignmentCenter, animation:=1
        Page.Writes "There is something wrong with your Builder .", GW / 2, 260, Color:=argb(150, 27, 27, 27), size:=18, align:=StringAlignmentCenter, animation:=2
        BtnStr = "Repair"
        GoTo Draw
    End If
    
    If InstalledPath <> "" Then
        If (Not IsUpdate) Then
            If Command$ = "-Uninstall" Then
                Page.Writes "Say Goodbye to Emerald Builder", GW / 2, 200, Color:=argb(255, 242, 242, 242), size:=36, align:=StringAlignmentCenter, animation:=1
                Page.Writes "Are you really going to uninstall me ?", GW / 2, 260, Color:=argb(150, 242, 242, 242), size:=18, align:=StringAlignmentCenter, animation:=2
                BtnStr = "Uninstall"
            Else
            
                Dim pro As Single
                If HideTime <> 0 Then pro = Cubic((GetTickCount - 3000 - HideTime) / 1000, 0, 1, 1, 1)
                If pro > 1 Then pro = 1
                If pro < 0 Then pro = 0
            
                Page.Clear argb(255 * 0.85, 64, 64, 73) '��ջ���
            
                Page.DrawImage "404.png", 165, GH / 2, Alpha:=1 - pro, pos:=posOnCenter, animation:=1
            
                Page.Writes "����", 350 + pro * 22, 170 + pro * 36, Color:=argb(255, 242, 242, 242), size:=18 + pro * 4, animation:=1, style:=FontStyleBold
                Page.Writes "������ Error 404��QQ 1361778219��" & vbCrLf & "���䣺 ris_vb@126.com", 350 - pro * 110, 220 + pro * 40, Color:=argb(150, 242, 242, 242), size:=18, animation:=2
                Page.Writes "�汾�� " & Version, 350 - pro * 50, 270 + pro * 40, Color:=argb(150 - pro * 150, 242, 242, 242), size:=18, animation:=2
                Page.Writes "��лInter.net��RedstoneȺ��֧�֡�", 350 - pro * 90, 340 + pro * 180, Color:=argb(150 - pro * 60, 242, 242, 242), size:=18 - pro * 2, animation:=2
                If NewVersion = 0 Then
                    NewVersion = 1
                    Call CheckOnLineUpdate
                End If
                
                Select Case NewVersion
                    Case 1
                        Page.ShowLoading 30, GH - 30 - 24, 24, 24, 3, argb(255, 242, 195, 17), argb(255, 240, 127, 34), argb(255, 232, 76, 61)
                        Page.Writes "���ڼ�����...", 80, GH - 30 - 24, Color:=argb(150, 242, 242, 242), size:=18, animation:=2
                    Case Is > Version
                        If HideTime = 0 Then HideTime = GetTickCount
                        Page.Paint 1, 30, GH - 30 - 24, 24, 24, argb(255, 255, 206, 69)
                        Page.Writes "�и��¿��ã�" & NewVersion & "��������˴����ء�", 80, GH - 30 - 24, w:=GW, h:=25, Color:=argb(255, 232, 76, 61), size:=18, animation:=2
                        If CheckMouse2 = mMouseUp Then ShellExecuteA 0, "open", "https://github.com/Red-Error404/Emerald", "", "", SW_SHOW
                    Case Is = Version
                        If HideTime = 0 Then HideTime = GetTickCount
                        Page.Paint 1, 30, GH - 30 - 24, 24, 24, argb(255 - pro * 255, 95, 229, 221)
                        Page.Writes "�Ѿ������°汾", 80, GH - 30 - 24, Color:=argb(150 - pro * 150, 242, 242, 242), size:=18, animation:=2
                    Case 3
                        If HideTime = 0 Then HideTime = GetTickCount
                        Page.Paint 1, 30, GH - 30 - 24, 24, 24, argb(255 - pro * 255, 254, 84, 57)
                        Page.Writes "���ӳ�ʱ", 80, GH - 30 - 24, Color:=argb(150 - pro * 150, 242, 242, 242), size:=18, animation:=2
                End Select
                
                Exit Sub
            End If
        Else
            Page.Writes "New Version : " & Version, GW / 2, 200, Color:=argb(255, 27, 27, 27), size:=36, align:=StringAlignmentCenter, animation:=1
            Page.Writes "Make everything better .", GW / 2, 260, Color:=argb(150, 27, 27, 27), size:=18, align:=StringAlignmentCenter, animation:=2
            BtnStr = "Update"
        End If
    End If
    
    If InstalledPath = "" Then
        Page.Writes "Welcome to Emerald Builder", GW / 2, 200, Color:=argb(255, 27, 27, 27), size:=36, align:=StringAlignmentCenter, animation:=1
        Page.Writes "Let's create our own games together .", GW / 2, 260, Color:=argb(150, 27, 27, 27), size:=18, align:=StringAlignmentCenter, animation:=2
        BtnStr = "Setup"
    End If
        
Draw:
    If Page.ShowColorButton(0, GW / 2 - 130 / 2, GH - 150, 130, 40, BtnStr, argb(255, 255, 255, 255), argb(255, 85, 219, 211), argb(255, 55, 189, 181), size:=16) = 3 Then
        ECore.NewTransform transFadeIn, 700, "SetupPage"
        CmdMark = BtnStr
        If BtnStr = "Uninstall" Then
            If Dialog("ж��", "��ȷ��Ҫж��Emerald Builder��", "�ǵ�", "�ֻ�") <> 1 Then Exit Sub
            Call Uninstall
        Else
            Call Setup
        End If
    End If
End Sub
Public Sub Wheel(Direction As Integer, Depth As Single)
    '�������¼�
    'Direction:����Depth�����
End Sub
Public Sub Enter()
    'ҳ������¼�
    Page.StartAnimation 1
    Page.StartAnimation 2, 200
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
    Page.Res.NewImages App.path & "\assets", 0.5
    '����ҳ��
    ECore.Add Page, "WelcomePage"
    
    '===============================================
    '   �����Ҫ���Ӷ�����������ڴ˴�
        Page.NewAnimation False, "FadeIn", 2, 500
        Page.NewAnimation False, "FadeIn", 2, 500
    '===============================================
End Sub