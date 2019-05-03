VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MainPage"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'======================================
'   ҳ�������
    Dim Page As GPage, Music As GMusic
'======================================

Public Sub Update()
    '�����¼�
    Dim Map() As Single, MapTotal As Long, w As Long, h As Long
    
    On Error Resume Next
    Map = Music.GetMusicMap
    For i = 0 To UBound(Map)
        MapTotal = MapTotal + Map(i)
    Next
    
    Dim pro As Single
    Page.Paint 0, 0, GH / 2 - 1, GW, 4, argb(255, 222, 222, 222)
    
    Page.Paint 1, GW / 2 - 256 / 2, GH / 2 - 256 / 2, 256, 256, argb(255, 222, 222, 222)
    pro = MapTotal / 100000
    If pro > 1 Then pro = 1
    Page.PaintArc GW / 2 - 256 / 2, GH / 2 - 256 / 2, 256, 256, pro * 360, Color:=argb(255, 0, 176, 240), size:=3, Style:=1
    Page.Paint 1, GW / 2 - 256 / 2, GH / 2 - 256 / 2, 256, 256, argb(255 * pro, 0, 176, 240)

    For i = 0 To 20
        pro = Map(i) / 3000
        If pro > 1 Then pro = 1
        Page.Paint 0, GW / 2 + Int(GW / 30) * i + 148, GH / 2 - GH * pro / 2, 5, GH * pro, argb(255, 0, 176, 240)
        Page.Paint 0, GW / 2 - Int(GW / 30) * i - 148, GH / 2 - GH * pro / 2, 5, GH * pro, argb(255, 0, 176, 240)
    Next
    Page.DrawImage "music.png", GW / 2, GH / 2, Alpha:=1, Pos:=1
    
    If Not Music.IsPlaying Then Music.Play
End Sub
Public Sub PlayNew(Path As String)
    Music.Dispose
    Music.Create Path
    Music.Play
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
    Page.NewImages App.Path & "\assets"
    '����ҳ��
    ECore.Add Page, "MainPage"
    
    Set Music = New GMusic
    PlayNew App.Path & "\music\Anticipation.mp3"
    
    '===============================================
    '   �����Ҫ���Ӷ�����������ڴ˴�
    
    '===============================================
End Sub