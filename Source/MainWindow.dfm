object MainForm: TMainForm
  Left = 640
  Top = 395
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
  object Workspace: TImage
    Left = 110
    Top = 0
    Width = 778
    Height = 485
    Align = alClient
    OnMouseMove = WorkspaceMouseMove
    OnMouseUp = WorkspaceMouseUp
    ExplicitLeft = 366
    ExplicitTop = 98
    ExplicitWidth = 697
    ExplicitHeight = 473
  end
  object Toolbar: TPanel
    Left = 0
    Top = 0
    Width = 110
    Height = 485
    Align = alLeft
    Alignment = taLeftJustify
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitHeight = 473
    object Status: TLabel
      AlignWithMargins = True
      Left = 7
      Top = 400
      Width = 31
      Height = 13
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Caption = 'Status'
      WordWrap = True
    end
    object AddNodeRectangle: TButton
      AlignWithMargins = True
      Left = 10
      Top = 10
      Width = 90
      Height = 20
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Rectangle'
      Constraints.MaxHeight = 20
      Constraints.MaxWidth = 90
      TabOrder = 0
      OnClick = AddNodeRectangleClick
      ExplicitWidth = 20
    end
    object AddNodeEllipse: TButton
      AlignWithMargins = True
      Left = 10
      Top = 50
      Width = 90
      Height = 20
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Ellipse'
      Constraints.MaxHeight = 20
      Constraints.MaxWidth = 90
      TabOrder = 1
      ExplicitTop = 10
      ExplicitWidth = 20
    end
    object AddNodeCircle: TButton
      AlignWithMargins = True
      Left = 10
      Top = 90
      Width = 90
      Height = 20
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Circle'
      Constraints.MaxHeight = 20
      Constraints.MaxWidth = 90
      TabOrder = 2
      ExplicitTop = 10
      ExplicitWidth = 20
    end
    object AddLine: TButton
      AlignWithMargins = True
      Left = 10
      Top = 130
      Width = 90
      Height = 20
      Margins.Left = 10
      Margins.Top = 10
      Margins.Right = 10
      Margins.Bottom = 10
      Align = alTop
      Caption = 'Line'
      Constraints.MaxHeight = 20
      Constraints.MaxWidth = 90
      TabOrder = 3
      ExplicitTop = 10
      ExplicitWidth = 20
    end
  end
  object Properties: TPanel
    Left = 888
    Top = 0
    Width = 143
    Height = 485
    Align = alRight
    TabOrder = 1
  end
  object Menu: TMainMenu
    Left = 752
    Top = 368
    object File1: TMenuItem
      Caption = 'File'
      object Open1: TMenuItem
        Caption = 'Open'
      end
      object Save1: TMenuItem
        Caption = 'Save'
      end
    end
    object Edit1: TMenuItem
      Caption = 'Edit'
      object Undo1: TMenuItem
        Caption = 'Undo'
      end
    end
    object View1: TMenuItem
      Caption = 'View'
    end
    object Help1: TMenuItem
      Caption = 'Help'
      object About1: TMenuItem
        Caption = 'About'
      end
    end
  end
end