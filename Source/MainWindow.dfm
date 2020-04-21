object MainForm: TMainForm
  Left = 411
  Top = 309
  Caption = 'TreeMaker'
  ClientHeight = 485
  ClientWidth = 1031
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = Menu
  OldCreateOrder = False
  Position = poDesigned
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object Properties: TPanel
    Left = 872
    Top = 0
    Width = 159
    Height = 466
    Align = alRight
    TabOrder = 0
    ExplicitHeight = 485
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 466
    Width = 1031
    Height = 19
    Panels = <
      item
        Text = 'TreeMaker'
        Width = 100
      end
      item
        Text = 'X: Y:'
        Width = 50
      end>
    ExplicitLeft = -8
    ExplicitTop = 434
  end
  object WorkSpacePanel: TPanel
    Left = 61
    Top = 0
    Width = 811
    Height = 466
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 224
    ExplicitTop = 8
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Workspace: TImage
      Left = 30
      Top = 24
      Width = 699
      Height = 413
      OnMouseMove = WorkspaceMouseMove
      OnMouseUp = WorkspaceMouseUp
    end
  end
  object ToolbarPanel: TPanel
    Left = 0
    Top = 0
    Width = 61
    Height = 466
    Align = alLeft
    Alignment = taLeftJustify
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 3
    object ToolBar: TToolBar
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 55
      Height = 460
      Align = alLeft
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 55
      Caption = 'ToolBar1'
      DisabledImages = ImageList
      Images = ImageList
      ShowCaptions = True
      TabOrder = 0
      object tlMouse: TToolButton
        Left = 0
        Top = 0
        Caption = 'Mouse'
        Down = True
        Grouped = True
        ImageIndex = 0
        Wrap = True
        Style = tbsCheck
        OnClick = tlMouseClick
      end
      object tlRectangle: TToolButton
        Left = 0
        Top = 36
        Caption = 'Rectangle'
        Grouped = True
        ImageIndex = 1
        Wrap = True
        Style = tbsCheck
        OnClick = tlRectangleClick
      end
      object tlEllipse: TToolButton
        Left = 0
        Top = 72
        Caption = 'Ellipse'
        Grouped = True
        ImageIndex = 2
        Wrap = True
        Style = tbsCheck
        OnClick = tlEllipseClick
      end
      object tlCircle: TToolButton
        Left = 0
        Top = 108
        Caption = 'Circle'
        Grouped = True
        ImageIndex = 3
        Wrap = True
        Style = tbsCheck
        OnClick = tlCircleClick
      end
      object tlLine: TToolButton
        Left = 0
        Top = 144
        Caption = 'Line'
        Grouped = True
        ImageIndex = 5
        Wrap = True
        Style = tbsCheck
        OnClick = tlLineClick
      end
      object tlText: TToolButton
        Left = 0
        Top = 180
        Caption = 'Text'
        ImageIndex = 4
      end
    end
  end
  object Menu: TMainMenu
    Images = ImageList
    Left = 504
    Top = 320
    object miFile: TMenuItem
      Caption = 'File'
      object MiOpen: TMenuItem
        Action = FileOpen
      end
      object miSave: TMenuItem
        Action = FileSaveAs
        ShortCut = 16467
      end
      object miExit: TMenuItem
        Action = FileExit
        ShortCut = 32883
      end
    end
    object miEdit: TMenuItem
      Caption = 'Edit'
      object miCut: TMenuItem
        Action = EditCut
      end
      object miCopy: TMenuItem
        Action = EditCopy
      end
      object miPaste: TMenuItem
        Action = EditPaste
      end
      object miSelectAll: TMenuItem
        Action = EditSelectAll
      end
      object miUndo: TMenuItem
        Action = EditUndo
      end
      object miDelete: TMenuItem
        Action = EditDelete
      end
    end
    object miView: TMenuItem
      Caption = 'View'
    end
    object miHelp: TMenuItem
      Caption = 'Help'
      object miAbout: TMenuItem
        Caption = 'About'
      end
    end
  end
  object ImageList: TImageList
    Left = 616
    Top = 320
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 552
    Top = 320
    object FileOpen: TFileOpen
      Category = 'File'
      Caption = '&Open...'
      Hint = 'Open|Opens an existing file'
      ImageIndex = 7
      ShortCut = 16463
    end
    object EditCut: TEditCut
      Category = 'Edit'
      Caption = 'Cu&t'
      Hint = 'Cut|Cuts the selection and puts it on the Clipboard'
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditCopy: TEditCopy
      Category = 'Edit'
      Caption = '&Copy'
      Hint = 'Copy|Copies the selection and puts it on the Clipboard'
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditPaste: TEditPaste
      Category = 'Edit'
      Caption = '&Paste'
      Hint = 'Paste|Inserts Clipboard contents'
      ImageIndex = 2
      ShortCut = 16470
    end
    object EditSelectAll: TEditSelectAll
      Category = 'Edit'
      Caption = 'Select &All'
      Hint = 'Select All|Selects the entire document'
      ShortCut = 16449
    end
    object EditUndo: TEditUndo
      Category = 'Edit'
      Caption = '&Undo'
      Hint = 'Undo|Reverts the last action'
      ImageIndex = 3
      ShortCut = 16474
    end
    object EditDelete: TEditDelete
      Category = 'Edit'
      Caption = '&Delete'
      Hint = 'Delete|Erases the selection'
      ImageIndex = 5
      ShortCut = 46
    end
    object FileSaveAs: TFileSaveAs
      Category = 'File'
      Caption = 'Save &As...'
      Hint = 'Save As|Saves the active file with a new name'
      ImageIndex = 30
    end
    object FileExit: TFileExit
      Category = 'File'
      Caption = 'E&xit'
      Hint = 'Exit|Quits the application'
      ImageIndex = 43
    end
  end
end
