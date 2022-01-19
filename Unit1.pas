unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DateUtils, ComCtrls, ExtCtrls, Menus, RzTray, Buttons,
  RzSpnEdt, RzButton, RzBorder, IniFiles, pngimage, RzForms,
  LMDCustomComponent, LMDClass, ImgList, LMDFormVista, LMDWndProcComponent,
  LMDTrayIcon, LMDPNGImage;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DateTimePicker1: TDateTimePicker;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Timer1: TTimer;
    RzTrayIcon1: TRzTrayIcon;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    RzBorder1: TRzBorder;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Timer2: TTimer;
    Image1: TImage;
    Image2: TImage;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    RzFormShape1: TRzFormShape;
    ImageList1: TImageList;
    Timer3: TTimer;
    Label17: TLabel;
    LMDTrayIcon1: TLMDTrayIcon;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure RzBorder1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RzBorder1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RzBorder1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RzFormShape1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RzFormShape1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RzFormShape1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer3Timer(Sender: TObject);
  private
    Dragging   : Boolean;
    OldLeft,OldTop   : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Settings: TIniFile;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
Form2.Show
end;

procedure TForm1.FormCreate(Sender: TObject);
const
I = 1;
var
event:integer;
days:real;
k:integer;
sending:string;
a:string;
q,w,e:string;
begin
event:=(DaysBetween(DateTimePicker1.DateTime,Now));
days:=event+I;
Label4.Caption:= FloatToStr(days);
Form1.AlphaBlend := True;
Form1.AlphaBlendValue := 200;
ShowWindow(Application.Handle, SW_HIDE);
SetWindowLong(Application.Handle, GWL_EXSTYLE,
GetWindowLong(Application.Handle, GWL_EXSTYLE) or
WS_EX_TOOLWINDOW);
  Settings := TIniFile.Create(ExtractFilePath(paramstr(0))+'settings.ini');
 a:= Settings.ReadString('settings','language','rus');
 if (a='engl') then
begin
q:='days';
w:='day';
e:='days';
end;
if (a='ukr') then
begin
q:='днів';
w:='день';
e:='дня';
end;
if (a='rus') then
begin
q:='дней';
w:='день';
e:='дня';
end;
  k := Strtoint(form1.label4.Caption);
  if ((k mod 100)>=11) and ((k mod 100)<=13) then
      sEnding := q
  else
    case (k mod 10) of
     1: sEnding := w;
     2..4: sEnding := e;
    else
     sEnding := q;
    end;
label5.Caption:=sEnding;

end;

procedure TForm1.N1Click(Sender: TObject);
begin
Form2.Show;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
Self.Close;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
const
I=1;
var
event:integer;
days:real;
od,om:string;
begin
event:=(DaysBetween(Form2.DateTimePicker1.DateTime,Now));
days:= event+I;
Form1.Label4.Caption:= FloatToStr(days);
label6.Caption:= Floattostr(hourof(now))+':'+Floattostr(minuteof(now))+':'+Floattostr(secondof(now));
if label6.Caption= '0:0:0' then
Form1.Label4.Caption:= FloatToStr(days);
   if Now=Form2.DateTimePicker1.Date  then
    Form2.DateTimePicker1.Date := incyear(Form2.DateTimePicker1.Date,1) ;
     Form1.Label4.Caption:= FloatToStr(days);
if dayof(now)<10 then
od:= '0'+floattostr(dayof(now));
if dayof(now)>=10 then
od:= floattostr(dayof(now));
if monthof(now)<10 then
om:= '0'+floattostr(monthof(now));
if monthof(now)>=10 then
om:= floattostr(monthof(now));
begin label7.Caption:= od+'.'+om+'.'+ floattostr(yearof(now));
if label7.Caption= datetostr(form2.DateTimePicker1.Date) then
form2.DateTimePicker1.Date:= IncYear(form2.DateTimePicker1.Date,1) ;
if form2.DateTimePicker1.Date= IncYear(form2.DateTimePicker1.Date,-1) then
Form1.Label4.Caption:= FloatToStr(event);
end;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
Form1.Hide;
N4.Enabled:= False;
N5.Enabled:= True;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
Form1.Show;
N5.Enabled:=False;
N4.Enabled:=True;
end;

procedure TForm1.RzBorder1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if button=mbLeft then
  begin
   Dragging := True;
   OldLeft := X;
   OldTop := Y;
  end;
end;

procedure TForm1.RzBorder1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if Dragging then
  begin
   Left := Left+X-OldLeft;
   Top := Top+Y-OldTop;
  end;
end;

procedure TForm1.RzBorder1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 Dragging := False;
end;

procedure TForm1.FormShow(Sender: TObject);
const
I = 1;
var
event:integer;
days:real;
begin
event:=(DaysBetween(Form2.DateTimePicker1.DateTime,Now));
days:=event+I;
Label4.Caption:=FloatToStr(days);
end;

procedure TForm1.N7Click(Sender: TObject);
begin
n8.Enabled:=true;
if lmdtrayicon1.Active=false then
form1.lmdTrayIcon1.Active:=true;
if Form1.N7.Checked=false then
n7.Enabled:=false;


end;

procedure TForm1.N8Click(Sender: TObject);
begin
n7.Enabled:=true;

if lmdtrayicon1.Active=true then
form1.lmdTrayIcon1.Active:=false;
if Form1.N8.Checked=true then
n8.Enabled:=false;
n8.Enabled:=false;

end;


procedure TForm1.Timer2Timer(Sender: TObject);
var
  k:integer;
q,w,e,a,sending,firstboot:string;
sr,st,sy:real;
begin
sr:= StrToFloat(Label10.Caption)- hourof(now);
st:= StrToFloat(Label11.Caption)- minuteof(now);
sy:= StrToFloat(Label12.Caption)- secondof(now);
label9.Caption:= FloatToStr(sr)+':';
label13.Caption:= FloatToStr(st)+':';
label14.Caption:= FloatToStr(sy);
if sr<10 then
label9.Caption:= '0'+ FloatToStr(sr)+':';
if st<10 then
label13.Caption:= '0'+ FloatToStr(st)+':';
if sy<10 then
label14.Caption:= '0'+ FloatToStr(sy);
Label16.Caption:= label9.Caption+label13.Caption+label14.Caption;
  Settings := TIniFile.Create(ExtractFilePath(paramstr(0))+'settings.ini');
  firstboot := Settings.ReadString('settings','firstboot','true');
    Settings := TIniFile.Create(ExtractFilePath(paramstr(0))+'settings.ini');
 a:= Settings.ReadString('settings','language','rus');
 if (a='engl') then
begin
q:='days';
w:='day';
e:='days';
end;
if (a='ukr') then
begin
q:='днів';
w:='день';
e:='дня';
end;
if (a='rus') then
begin
q:='дней';
w:='день';
e:='дня';
end;
  k := Strtoint(form1.label4.Caption);
  if ((k mod 100)>=11) and ((k mod 100)<=13) then
      sEnding := q
  else
    case (k mod 10) of
     1: sEnding := w;
     2..4: sEnding := e;
    else
     sEnding := q;
    end;
label5.Caption:=sEnding;
  if (firstboot = 'true') then
  begin
  Form3.Show;
  Settings.WriteString('settings', 'firstboot', 'false');
  end;
  Settings.Free;
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
Image1.Visible:=False;
SetWindowPos(Handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
Image2.Visible:=True
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
Image2.Visible:=False;
SetWindowPos(Handle, HWND_NOTOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
Image1.Visible:=True
end;

procedure TForm1.FormMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if button=mbLeft then
  begin
   Dragging := True;
   OldLeft := X;
   OldTop := Y;
  end;
end;

procedure TForm1.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if Dragging then
  begin
   Left := Left+X-OldLeft;
   Top := Top+Y-OldTop;
  end;
end;

procedure TForm1.FormMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 Dragging := False;
end;

procedure TForm1.RzFormShape1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if button=mbLeft then
  begin
   Dragging := True;
   OldLeft := X;
   OldTop := Y;
  end;
end;

procedure TForm1.RzFormShape1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
 if Dragging then
  begin
   Left := Left+X-OldLeft;
   Top := Top+Y-OldTop;
  end;
end;

procedure TForm1.RzFormShape1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Dragging := False;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
begin
 if dayof(now)=1 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/1.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/1.ico');
end;
 if dayof(now)=2 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/2.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/2.ico');
end;
 if dayof(now)=3 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/3.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/3.ico');
end;
 if dayof(now)=4 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/4.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/4.ico');
end;
 if dayof(now)=5 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/5.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/5.ico');
end;

 if dayof(now)=6 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/6.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/6.ico');
end;

 if dayof(now)=7 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/7.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/7.ico');
end;

 if dayof(now)=8 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/8.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/8.ico');
end;

 if dayof(now)=9 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/9.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/9.ico');
end;

 if dayof(now)=10 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/10.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/10.ico');
end;

 if dayof(now)=11 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/11.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/11.ico');
end;

 if dayof(now)=12 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/12.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/12.ico');
end;

 if dayof(now)=13 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/13.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/13.ico');
end;

 if dayof(now)=14 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/14.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/14.ico');
end;

 if dayof(now)=15 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/15.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/15.ico');
end;

 if dayof(now)=16 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/16.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/16.ico');
end;

 if dayof(now)=17 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/17.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/17.ico');
end;

 if dayof(now)=18 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/18.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/18.ico');
end;

 if dayof(now)=19 then
 begin
  Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/19.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/19.ico');
end;

if dayof(now)=20 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/20.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/20.ico');
end;

if dayof(now)=21 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/21.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/21.ico');
end;

if dayof(now)=22 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/22.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/22.ico');
end;

if dayof(now)=23 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/23.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/23.ico');
end;

if dayof(now)=24 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/24.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/24.ico');
end;

if dayof(now)=25 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/25.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/25.ico');
end;

if dayof(now)=26 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/26.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/26.ico');
end;

if dayof(now)=27 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/27.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/27.ico');
end;

if dayof(now)=28 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/28.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/28.ico');
end;

if dayof(now)=29 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/29.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/29.ico');
end;

if dayof(now)=30 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/30.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/30.ico');
end;

if dayof(now)=31 then
 begin
 Application.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'icons/31.ico');
 LMDTrayIcon1.Icon.LoadFromFile(ExtractFilePath(ParamStr(0))+'/icons/31.ico');
end;
end;

end.
