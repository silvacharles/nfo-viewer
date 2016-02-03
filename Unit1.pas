unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ClipBrd, ComCtrls, MiniFMOD, Effects,
  WinSkinData, uOXAutoUpdate;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit2: TEdit;
    FormAlphaBlended1: TFormAlphaBlended;
    SkinData1: TSkinData;
    procedure New1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure AutoUpdateNeedDeploy(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SelPos: Integer;
  FoundAt: LongInt;
  StartPos: Integer;
  ToEnd: Integer;
  Pastable: Boolean;
  fName: String;
  CmdLn: String;

implementation

uses Registry;

{$R *.dfm}
{$R som.RES}

procedure TForm1.New1Click(Sender: TObject);
begin
Memo1.Text := '';
end;

procedure TForm1.AutoUpdateNeedDeploy(Sender: TObject);
begin
AutoUpdate.Deploy;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Memo1.Font.Name := 'Terminal';
Memo1.Font.Size := 8;
CmdLn := ParamStr(ParamCount);
Edit2.Text := CmdLn;
if ((Copy(Edit2.Text,Edit2.GetTextLen - 3,4)) = '.nfo') then Memo1.Lines.LoadFromFile(Edit2.Text);
//Memo1.Lines.LoadFromFile(Copy(Edit2.text, 2, Edit2.GetTextLen));
begin
  { Se o primeiro parâmetro for um nome de arquivo existente... }
  if FileExists('sequelinha.nfo') then
  { Carrega o conteúdo do arquivo no memo }
  Memo1.Lines.LoadFromFile('sequelinha.nfo')
else
MessageDlg('Arquivo sequelinha.nfo não encontrado', mterror, [mbOK], 0);
end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
AutoUpdate.OptionalUpdate:=True;
AutoUpdate.UpdateMode:=umXMLAutomatic;
AutoUpdate.Execute;
end;

{MessageDlg(
          'sEqUeLiNhA TeaM .nfo Visualisador v1.0' + chr(10) +
          'Versão 1.0' + chr(10) +
          'http://foruminfobyte.no-ip.org/forum/' + chr(10) +
          'by ChArLeS_sEqUeLiNhA'
          ,mtInformation
          ,[mbOk]
          ,0); }

procedure TForm1.FormActivate(Sender: TObject);
begin
XMPlayFromRes('XM', 'MUSIC');
end;

end.
