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
  PixelsPerInch = 96
  TextHeight = 13
  object Properties: TPanel
    Left = 872
    Top = 0
    Width = 159
    Height = 466
    Align = alRight
    TabOrder = 0
    object ScrollBoxProperties: TScrollBox
      Left = 1
      Top = 1
      Width = 157
      Height = 464
      Align = alClient
      TabOrder = 0
      object MainProperties: TPanel
        Left = 0
        Top = 0
        Width = 153
        Height = 127
        Align = alTop
        TabOrder = 0
        object lblPosition: TLabel
          Left = 16
          Top = 17
          Width = 56
          Height = 16
          Alignment = taCenter
          Caption = 'Position:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblX: TLabel
          Left = 16
          Top = 39
          Width = 10
          Height = 13
          Caption = 'X:'
        end
        object lblY: TLabel
          Left = 88
          Top = 39
          Width = 10
          Height = 13
          Caption = 'Y:'
        end
        object lblWidth: TLabel
          Left = 16
          Top = 66
          Width = 32
          Height = 13
          Caption = 'Width:'
        end
        object lblHeigth: TLabel
          Left = 16
          Top = 94
          Width = 35
          Height = 13
          Caption = 'Heigth:'
        end
        object edtX: TEdit
          Left = 32
          Top = 36
          Width = 33
          Height = 21
          NumbersOnly = True
          TabOrder = 0
        end
        object edtY: TEdit
          Left = 104
          Top = 36
          Width = 33
          Height = 21
          NumbersOnly = True
          TabOrder = 1
        end
        object edtHeigth: TEdit
          Left = 56
          Top = 91
          Width = 43
          Height = 21
          NumbersOnly = True
          TabOrder = 2
        end
        object edtWidth: TEdit
          Left = 56
          Top = 63
          Width = 43
          Height = 21
          NumbersOnly = True
          TabOrder = 3
        end
      end
      object TextProperties: TPanel
        Left = 0
        Top = 265
        Width = 153
        Height = 64
        Align = alTop
        TabOrder = 1
        object lblFont: TLabel
          Left = 58
          Top = 6
          Width = 33
          Height = 16
          Caption = 'Font:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object btnFont: TButton
          Left = 38
          Top = 28
          Width = 75
          Height = 25
          Caption = 'Change'
          TabOrder = 0
        end
      end
      object BorderPanel: TPanel
        Left = 0
        Top = 191
        Width = 153
        Height = 74
        Align = alTop
        TabOrder = 2
        object lblBorder: TLabel
          Left = 16
          Top = 10
          Width = 49
          Height = 16
          Alignment = taCenter
          Caption = 'Border:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblColor: TLabel
          Left = 16
          Top = 48
          Width = 29
          Height = 13
          Caption = 'Color:'
        end
        object lblBorderWidth: TLabel
          Left = 16
          Top = 29
          Width = 32
          Height = 13
          Caption = 'Width:'
        end
      end
      object BackGroundPanel: TPanel
        Left = 0
        Top = 127
        Width = 153
        Height = 64
        Align = alTop
        TabOrder = 3
        object lblBackground: TLabel
          Left = 3
          Top = 6
          Width = 81
          Height = 16
          Alignment = taCenter
          Caption = 'Background:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblBackgroundColor: TLabel
          Left = 19
          Top = 33
          Width = 29
          Height = 13
          Caption = 'Color:'
        end
        object btnBackgroundColor: TButton
          Left = 59
          Top = 28
          Width = 75
          Height = 25
          Caption = 'Change'
          TabOrder = 0
        end
      end
    end
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
    TabOrder = 2
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
        OnClick = toolButtonClick
      end
      object tlRectangle: TToolButton
        Tag = 1
        Left = 0
        Top = 36
        Caption = 'Rectangle'
        Grouped = True
        ImageIndex = 1
        Wrap = True
        Style = tbsCheck
        OnClick = toolButtonClick
      end
      object tlEllipse: TToolButton
        Tag = 2
        Left = 0
        Top = 72
        Caption = 'Ellipse'
        Grouped = True
        ImageIndex = 2
        Wrap = True
        Style = tbsCheck
        OnClick = toolButtonClick
      end
      object tlCircle: TToolButton
        Tag = 3
        Left = 0
        Top = 108
        Caption = 'Circle'
        Grouped = True
        ImageIndex = 3
        Wrap = True
        Style = tbsCheck
        OnClick = toolButtonClick
      end
      object tlLine: TToolButton
        Tag = 4
        Left = 0
        Top = 144
        Caption = 'Line'
        Grouped = True
        ImageIndex = 5
        Wrap = True
        Style = tbsCheck
        OnClick = toolButtonClick
      end
      object tlText: TToolButton
        Tag = 5
        Left = 0
        Top = 180
        Caption = 'Text'
        Grouped = True
        ImageIndex = 4
        Style = tbsCheck
        OnClick = toolButtonClick
      end
    end
  end
  object ScrollBox: TScrollBox
    Left = 61
    Top = 0
    Width = 811
    Height = 466
    Align = alClient
    TabOrder = 3
    object WorkSpacePanel: TPanel
      Left = 0
      Top = 0
      Width = 700
      Height = 940
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object Workspace: TImage
        AlignWithMargins = True
        Left = 50
        Top = 50
        Width = 600
        Height = 840
        Margins.Left = 50
        Margins.Top = 50
        Margins.Right = 50
        Margins.Bottom = 50
        OnMouseDown = WorkspaceMouseDown
        OnMouseMove = WorkspaceMouseMove
        OnMouseUp = WorkspaceMouseUp
      end
    end
  end
  object Menu: TMainMenu
    Images = ImageList
    Left = 504
    Top = 328
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
    Top = 328
  end
  object ActionList: TActionList
    Images = ImageList
    Left = 560
    Top = 328
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
      OnExecute = EditSelectAllExecute
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
  object FontDialog: TFontDialog
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsStrikeOut]
    Left = 352
    Top = 296
  end
  object ColorDialog: TColorDialog
    Left = 360
    Top = 336
  end
end
