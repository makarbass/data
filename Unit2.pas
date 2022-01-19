unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DateUtils, ExtCtrls, IniFiles, Buttons,
  RzSpnEdt, RzTrkBar, Mask, RzEdit, RzBorder, RzLabel, pngimage, RzButton,
  RzTabs, RzPanel, RzCmboBx, Registry, Menus, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, jpeg, LMDPNGImage,
  ImgList, LMDPNGImageList, LMDThemedComboBox, LMDCustomComboBox,
  LMDCustomImageComboBox, LMDImageComboBox;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    RzTrackBar1: TRzTrackBar;
    RzColorEdit1: TRzColorEdit;
    RzColorEdit2: TRzColorEdit;
    RzColorEdit3: TRzColorEdit;
    Label6: TLabel;
    Image1: TImage;
    RzURLLabel1: TRzURLLabel;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    RzBorder1: TRzBorder;
    RzGroupBox1: TRzGroupBox;
    RzButton1: TRzButton;
    RzButton2: TRzButton;
    RzBitBtn1: TRzBitBtn;
    TabSheet3: TRzTabSheet;
    RzBitBtn2: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    TabSheet4: TRzTabSheet;
    RzFontComboBox1: TRzFontComboBox;
    RzFontComboBox2: TRzFontComboBox;
    Label7: TLabel;
    Label8: TLabel;
    CheckBox1: TCheckBox;
    TabSheet5: TRzTabSheet;
    OpenDialog1: TOpenDialog;
    Edit2: TEdit;
    RzRapidFireButton1: TRzRapidFireButton;
    Label9: TLabel;
    CheckBox2: TCheckBox;
    Label10: TLabel;
    RzColorEdit4: TRzColorEdit;
    RzFontComboBox3: TRzFontComboBox;
    Label11: TLabel;
    CheckBox3: TCheckBox;
    RzSpinEdit1: TRzSpinEdit;
    RzSpinEdit2: TRzSpinEdit;
    RzSpinEdit3: TRzSpinEdit;
    RzToolbarButton1: TRzToolbarButton;
    RzLabel1: TRzLabel;
    IdHTTP1: TIdHTTP;
    Image2: TImage;
    RzURLLabel2: TRzURLLabel;
    Image3: TImage;
    RzURLLabel3: TRzURLLabel;
    RzBitBtn4: TRzBitBtn;
    procedure Button1Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure RzTrackBar1Change(Sender: TObject);
    procedure RzColorEdit1Change(Sender: TObject);
    procedure RzColorEdit2Change(Sender: TObject);
    procedure RzColorEdit3Change(Sender: TObject);
    procedure RzBorder1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RzBorder1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RzBorder1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit1Change(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzFontComboBox1Change(Sender: TObject);
    procedure RzFontComboBox2Change(Sender: TObject);
    procedure RzRapidFireButton1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure RzColorEdit4Change(Sender: TObject);
    procedure RzFontComboBox3Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure RzPageControl1MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RzPageControl1MouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure RzPageControl1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RzSpinEdit1Click(Sender: TObject);
    procedure RzSpinEdit1Change(Sender: TObject);
    procedure RzSpinEdit2Change(Sender: TObject);
    procedure RzSpinEdit2Click(Sender: TObject);
    procedure RzSpinEdit3Click(Sender: TObject);
    procedure RzSpinEdit3Change(Sender: TObject);
    procedure RzToolbarButton1Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
  private
      Dragging   : Boolean;
    OldLeft,OldTop   : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1, Unit3;

{$R *.dfm}
 var MyIni,lang,Settings:TIniFile;

procedure TForm2.FormCreate(Sender: TObject);
const
I = 1;
var
event:integer;
days:real;
a:string;
begin
event:=(DaysBetween(DateTimePicker1.DateTime,Now));
days:=event;
Form1.Label4.Caption:= FloatToStr(days);
  MyIni:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'MyIni.ini');
  lang:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'lang.ini');
  Edit1.Text:=lang.ReadString('Name','l2','нового года');
  DateTimePicker1.Date:=MyIni.ReadDate('Настройка','Дата',strtodate('31.12.2011'));
  form1.Color:=MyIni.ReadInteger('Настройка','Фон',clSkyBlue);
  Form1.Label1.Font.Color:=MyIni.ReadInteger('Настройка','Буквы',clBlack);
  Form1.Label4.Font.Color:=MyIni.ReadInteger('Настройка','Цифра',clRed);
  Form1.Label16.Font.Color:=MyIni.ReadInteger('Настройка','Цифры',clGreen);
  form2.RzColorEdit1.FocusColor:=MyIni.ReadInteger('Настройка','Фон',clSkyBlue);
  form2.RzColorEdit2.FocusColor:=MyIni.ReadInteger('Настройка','Буквы',clBlack);
  form2.RzColorEdit3.FocusColor:=MyIni.ReadInteger('Настройка','Цифра',clRed);
  form2.RzColorEdit4.FocusColor:= MyIni.ReadInteger('Настройка','Цифры',clGreen);
  form2.RzColorEdit1.Color:=MyIni.ReadInteger('Настройка','Фон',clSkyBlue);
  form2.RzColorEdit2.Color:=MyIni.ReadInteger('Настройка','Буквы',clBlack);
  form2.RzColorEdit3.Color:=MyIni.ReadInteger('Настройка','Цифра',clRed);
  form2.RzColorEdit4.Color:= MyIni.ReadInteger('Настройка','Цифры',clGreen);
  Form1.AlphaBlendValue:=MyIni.ReadInteger('Настройка','Прозрачность',200);
  Form1.Left:=MyIni.ReadInteger('Window', 'F1Left',0);
  Form1.Top:=MyIni.ReadInteger('Window', 'F1Top',0);
  Form2.Left:=MyIni.ReadInteger('Window', 'F2Left',40);
  Form2.Top:=MyIni.ReadInteger('Window', 'F2Top',40);
  Form3.Left:=MyIni.ReadInteger('Window', 'F3Left',60);
  Form3.Top:=MyIni.ReadInteger('Window', 'F3Top',60);
  Form1.ClientHeight:=MyIni.ReadInteger('Window','F1',75);
  Form1.RzBorder1.Height:= MyIni.ReadInteger('Window','F1',75) ;
  Form1.Label1.Font.Name:= MyIni.ReadString('Шрифт','1','Tahoma') ;
  Form1.Label4.Font.Name:= MyIni.ReadString('Шрифт','2','Tahoma') ;
  Form1.Label16.Font.Name:= MyIni.ReadString('Шрифт','3','Tahoma');
  Form2.RzFontComboBox1.FontName:= MyIni.ReadString('Шрифт','1','Tahoma') ;
  Form2.RzFontComboBox2.FontName:= MyIni.ReadString('Шрифт','2','Tahoma') ;
  Form2.RzFontComboBox3.FontName:= MyIni.ReadString('Шрифт','3','Tahoma') ;
  Form1.Label1.Font.Size:=MyIni.ReadInteger('Шрифт','Size1',10);
  Form1.Label3.Font.Size:=MyIni.ReadInteger('Шрифт','Size2',10);
  Form1.Label16.Font.Size:=MyIni.ReadInteger('Шрифт','Size3',10);
  Form2.RzSpinEdit1.Value:=  MyIni.ReadInteger('Шрифт','Size1',10);
   Form2.RzSpinEdit2.Value:=  MyIni.ReadInteger('Шрифт','Size2',10);
    Form2.RzSpinEdit3.Value:=  MyIni.ReadInteger('Шрифт','Size3',10);
    Form2.Edit2.Text:= MyIni.ReadString('Window','Скин','Skins\first.png');
    Form2.CheckBox2.Checked:=MyIni.ReadBool('Window','Timer',false);
    Form2.CheckBox3.Checked:=MyIni.ReadBool('Window','Bord',true);
    Form1.RzFormShape1.Picture.LoadFromFile(Form2.Edit2.Text);
    Form2.CheckBox1.Checked:= MyIni.ReadBool('Autorun','1',true);
  Settings := TIniFile.Create(ExtractFilePath(paramstr(0))+'settings.ini');
   a:= Settings.ReadString('settings','language','rus');
  if (a='rus') then
  begin
  Form1.Label1.Caption:=lang.ReadString('Name','l1','До');
  Form1.Label3.Caption:=lang.ReadString('Name','l3','осталось');
  Form1.Label2.Caption:=lang.ReadString('Name','l2','нового года');
  Form1.Label5.Caption:=lang.ReadString('Name','l5','дней');
  Form1.N1.Caption:=lang.ReadString('Name','N1','Настройки');
  Form1.N4.Caption:=lang.ReadString('Name','N4','Свернуть');
  Form1.N5.Caption:=lang.ReadString('Name','N5','Развернуть');
  Form1.N7.Caption:=lang.ReadString('Name','N7','Отображать иконку в трее');
  Form1.N8.Caption:=lang.ReadString('Name','N8','Скрыть иконку в трее');
  Form1.N2.Caption:=lang.ReadString('Name','N2','Выход');
  Form2.TabSheet1.Caption:=lang.ReadString('Name','ts1','Основные');
  Form2.TabSheet2.Caption:=lang.ReadString('Name','ts2','Внешний вид');
  Form2.TabSheet3.Caption:=lang.ReadString('Name','ts3','Язык');
  Form2.label2.Caption:=lang.ReadString('Name','2l2','Дата');
  Form2.label1.Caption:=lang.ReadString('Name','2l1','Событие');
  Form2.Rzgroupbox1.Caption:=lang.ReadString('Name','Gr','Тип отсчета');
  Form2.RzButton1.Caption:=lang.ReadString('Name','B1','Осталось до...');
  Form2.RzButton2.Caption:=lang.ReadString('Name','B2','Прошло от...');
  Form2.RzURLLabel1.Caption:=lang.ReadString('Name','URL','Сайт разработчика ');
  Form2.RzBitBtn1.Caption:=lang.ReadString('Name','BB','Готово');
  Form2.Label3.Caption:= lang.ReadString('Name','bck','Цвет фона');
  Form2.Label4.Caption:= lang.ReadString('Name','txt','Цвет букв');
  Form2.Label5.Caption:= lang.ReadString('Name','nmb','Цвет цифр');
  Form2.Label6.Caption:= lang.ReadString('Name','tr','Прозрачность');
  Form2.TabSheet4.Caption:= lang.ReadString('Name','ts4','Шрифт');
  Form2.Label7.Caption:= lang.ReadString('Name','2l7','Шрифт букв');
    Form2.Label8.Caption:= lang.ReadString('Name','2l8','Шрифт цифр');
      Form2.CheckBox1.Caption:= lang.ReadString('Name','Auto','Автозагрузка') ;
  Form2.TabSheet5.Caption:= lang.ReadString('Name','ts5','Скины');
  Form2.Label9.Caption:=lang.ReadString('Name','l9','Загрузите скин (155x95)');
    Form1.Label15.Caption:=lang.ReadString('Name','l15','(чч:мм:сс)');
  Form2.CheckBox2.Caption:=lang.ReadString('Name','ch2','Таймер')    ;
  Form2.Label10.Caption:= lang.ReadString('Name','tim','Цвет таймера');
  Form2.Label11.Caption:= lang.ReadString('Name','2l11','Шрифт таймера');
  Form2.CheckBox3.Caption:= lang.ReadString('Name','ch3','Рамка');


  end;
  if (a='ukr') then
  begin
  Form1.Label1.Caption:=lang.ReadString('Ukr','l1','До');
  Form1.Label3.Caption:=lang.ReadString('Ukr','l3','залишилось');
  Form1.Label2.Caption:=lang.ReadString('Ukr','l2','нового року');
  Form1.Label5.Caption:=lang.ReadString('Ukr','l5','днів');
  Form1.N1.Caption:=lang.ReadString('Ukr','N1','Параметри');
  Form1.N4.Caption:=lang.ReadString('Ukr','N4','Згорнути');
  Form1.N5.Caption:=lang.ReadString('Ukr','N5','Розгорнути');
  Form1.N7.Caption:=lang.ReadString('Ukr','N7','Відображати іконку в лотку');
  Form1.N8.Caption:=lang.ReadString('Ukr','N8','Приховати іконку в лотку');
  Form1.N2.Caption:=lang.ReadString('Ukr','N2','Вихід');
  Form2.TabSheet1.Caption:=lang.ReadString('Ukr','ts1','Основні');
  Form2.TabSheet2.Caption:=lang.ReadString('Ukr','ts2','Зовнішній вигляд');
  Form2.TabSheet3.Caption:=lang.ReadString('Ukr','ts3','Мова');
  Form2.label2.Caption:=lang.ReadString('Ukr','2l2','Дата');
  Form2.label1.Caption:=lang.ReadString('Ukr','2l1','Подія');
  Form2.Rzgroupbox1.Caption:=lang.ReadString('Ukr','Gr','Тип');
  Form2.RzButton1.Caption:=lang.ReadString('Ukr','B1','Залишилось до...');
  Form2.RzButton2.Caption:=lang.ReadString('Ukr','B2','Пройшло від...');
  Form2.RzURLLabel1.Caption:=lang.ReadString('Ukr','URL','Сайт розробника');
  Form2.RzBitBtn1.Caption:=lang.ReadString('Ukr','BB','Гаразд');
  Form2.Label3.Caption:= lang.ReadString('Ukr','bck','Колір тла');
  Form2.Label4.Caption:= lang.ReadString('Ukr','txt','Колір тексту');
  Form2.Label5.Caption:= lang.ReadString('Ukr','nmb','Колір цифр');
  Form2.Label6.Caption:= lang.ReadString('Ukr','tr','Прозорість');
    Form2.TabSheet4.Caption:= lang.ReadString('Ukr','ts4','Шрифт');
  Form2.Label7.Caption:= lang.ReadString('Ukr','2l7','Шрифт тексту');
    Form2.Label8.Caption:= lang.ReadString('Ukr','2l8','Шрифт цифр');
      Form2.CheckBox1.Caption:= lang.ReadString('Ukr','Auto','Автозавантаження') ;
  Form2.TabSheet5.Caption:= lang.ReadString('Ukr','ts5','Обкладинки');
  Form2.Label9.Caption:=lang.ReadString('Ukr','l9','Завантажте обкладинку (155x95)');
      Form1.Label15.Caption:=lang.ReadString('Ukr','l15','(гг:хх:сс)');
  Form2.CheckBox2.Caption:=lang.ReadString('Ukr','ch2','Таймер')    ;
  Form2.Label10.Caption:= lang.ReadString('Ukr','tim','Колір таймера');
  Form2.Label11.Caption:= lang.ReadString('Ukr','2l11','Шрифт таймера');
  Form2.CheckBox3.Caption:= lang.ReadString('Ukr','ch3','Рамка');
  end;
  if (a='engl') then
  begin
  Form1.Label1.Caption:=lang.ReadString('Engl','l1','To');
  Form1.Label3.Caption:=lang.ReadString('Engl','l3','remaind');
  Form1.Label2.Caption:=lang.ReadString('Engl','l2','the new year');
  Form1.Label5.Caption:=lang.ReadString('Engl','l5','days');
  Form1.N1.Caption:=lang.ReadString('Engl','N1','Settings');
  Form1.N4.Caption:=lang.ReadString('Engl','N4','Minimize');
  Form1.N5.Caption:=lang.ReadString('Engl','N5','Deploy');
  Form1.N7.Caption:=lang.ReadString('Engl','N7','Show icon on tray');
  Form1.N8.Caption:=lang.ReadString('Engl','N8','Hide icon on tray');
  Form1.N2.Caption:=lang.ReadString('Engl','N2','Exit');
  Form2.TabSheet1.Caption:=lang.ReadString('Engl','ts1','Main');
  Form2.TabSheet2.Caption:=lang.ReadString('Engl','ts2','Design');
  Form2.TabSheet3.Caption:=lang.ReadString('Engl','ts3','Language');
  Form2.label2.Caption:=lang.ReadString('Engl','2l2','Date');
  Form2.label1.Caption:=lang.ReadString('Engl','2l1','Event');
  Form2.Rzgroupbox1.Caption:=lang.ReadString('Engl','Gr','Type');
  Form2.RzButton1.Caption:=lang.ReadString('Engl','B1','Left until...');
  Form2.RzButton2.Caption:=lang.ReadString('Engl','B2','Passed from...');
  Form2.RzURLLabel1.Caption:=lang.ReadString('Engl','URL','KHB-Soft website ');
  Form2.RzBitBtn1.Caption:=lang.ReadString('Engl','BB','Ok');
  Form2.Label3.Caption:= lang.ReadString('Engl','bck','Color of background');
  Form2.Label4.Caption:= lang.ReadString('Engl','txt','Color of text');
  Form2.Label5.Caption:= lang.ReadString('Engl','nmb','Color of numbers');
  Form2.Label6.Caption:= lang.ReadString('Engl','tr','Transparent');
  Form2.TabSheet4.Caption:= lang.ReadString('Engl','ts4','Font');
  Form2.Label7.Caption:= lang.ReadString('Engl','2l7','Text font');
    Form2.Label8.Caption:= lang.ReadString('Engl','2l8','Numbers font');
     Form2.CheckBox1.Caption:= lang.ReadString('Engl','Auto','Autorun') ;
  Form2.TabSheet5.Caption:= lang.ReadString('Engl','ts5','Skins');
  Form2.Label9.Caption:=lang.ReadString('Engl','l9','Load skin (155x95)');
    Form1.Label15.Caption:=lang.ReadString('Engl','l15','(hh:mm:ss)');
  Form2.CheckBox2.Caption:=lang.ReadString('Engl','ch2','Timer')    ;
  Form2.Label10.Caption:= lang.ReadString('Engl','tim','Color of timer');
  Form2.Label11.Caption:= lang.ReadString('Engl','2l11','Timer font');
  Form2.CheckBox3.Caption:= lang.ReadString('Engl','ch3','Border');
  end;
  MyIni.Free;
  Settings.Free;
  lang.Free;
  Form1.Label2.Font.Color:=Form1.Label1.Font.Color;
  Form1.Label3.Font.Color:=Form1.Label1.Font.Color;
  Form1.Label5.Font.Color:=Form1.Label1.Font.Color;
  Form1.Label15.Font.Color:=Form1.Label1.Font.Color;
  Form1.Label2.Font.Name:=Form1.Label1.Font.Name ;
  Form1.Label3.Font.Name:=Form1.Label1.Font.Name  ;
  Form1.Label5.Font.Name:=Form1.Label1.Font.Name   ;
  Form1.Label1.Font.Size:=Form1.Label2.Font.Size;
  Form1.Label1.Font.Size:=Form1.Label3.Font.Size  ;
  Form1.Label1.Font.Size:=Form1.Label5.Font.Size   ;
  Form1.Label4.Caption:= FloatToStr(days);

  Form1.Label1.Font.Name:=Form2.RzFontComboBox1.FontName;
Form1.Label2.Font.Name:=Form1.Label1.Font.Name;
Form1.Label3.Font.Name:=Form1.Label1.Font.Name;
Form1.Label5.Font.Name:=Form1.Label1.Font.Name;

end;

procedure TForm2.FormDestroy(Sender: TObject);
var
a: string;
begin
 Settings := TIniFile.Create(ExtractFilePath(paramstr(0))+'settings.ini');
 MyIni:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'MyIni.ini');
 Myini.WriteString('Настройка','Событие',edit1.Text);
 MyIni.WriteDateTime('Настройка','Дата',DateTimePicker1.Date);
 MyIni.WriteInteger('Настройка','Фон',form1.Color);
 MyIni.WriteInteger('Настройка','Буквы',Form1.Label1.Font.Color);
 MyIni.WriteInteger('Настройка','Цифра',Form1.Label4.Font.Color);
 MyIni.WriteInteger('Настройка','Цифры',Form1.Label16.Font.Color);
 MyIni.WriteInteger('Настройка','Прозрачность',Form1.AlphaBlendValue);
 MyIni.WriteInteger('Window','F1Left',Form1.Left);
 MyIni.WriteInteger('Window','F1Top',Form1.Top);
 MyIni.WriteInteger('Window','F2Left',Form2.Left);
 MyIni.WriteInteger('Window','F2Top',Form2.Top);
 MyIni.WriteInteger('Window','F3Left',Form3.Left);
 MyIni.WriteInteger('Window','F3Top',Form3.Top);
 MyIni.WriteInteger('Window','F1',Form1.ClientHeight);
 MyIni.WriteBool('Window','Timer',Form2.CheckBox2.Checked);
  MyIni.WriteBool('Window','Bord',Form2.CheckBox3.Checked);
 myini.WriteString('Шрифт','1',Form1.Label1.Font.Name);
  myini.WriteString('Шрифт','2',Form1.Label4.Font.Name);
   myini.WriteString('Шрифт','3',Form1.Label16.Font.Name);
   myini.WriteInteger('Шрифт','Size1',Form1.Label1.Font.Size);
     myini.WriteInteger('Шрифт','Size2',Form1.Label4.Font.Size);
       myini.WriteInteger('Шрифт','Size3',Form1.Label16.Font.Size);
  myini.WriteString('Window','Скин',Form2.Edit2.Text);
  myini.WriteBool('Autorun','1',Form2.CheckBox1.Checked);
 lang:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'lang.ini');
 a:= Settings.ReadString('settings','language','rus');
  if (a='rus') then begin
 lang.WriteString('Name','l1',form1.Label1.Caption);
 lang.WriteString('Name','l3',form1.Label3.Caption);
 lang.WriteString('Name','l2',form1.Label2.Caption);
 lang.WriteString('Name','l5',form1.Label5.Caption);
lang.WriteString('Name','N1',form1.N1.Caption);
lang.WriteString('Name','N4',form1.N4.Caption);
lang.WriteString('Name','N5',form1.N5.Caption);
lang.WriteString('Name','N7',form1.N7.Caption);
lang.WriteString('Name','N8',form1.N8.Caption);
lang.WriteString('Name','N2',form1.N2.Caption);
lang.WriteString('Name','ts1',Form2.TabSheet1.Caption);
lang.WriteString('Name','ts2',Form2.TabSheet2.Caption);
lang.WriteString('Name','ts3',Form2.TabSheet3.Caption);
lang.WriteString('Name','2l2',Form2.label2.Caption);
lang.WriteString('Name','2l1',Form2.label1.Caption);
lang.WriteString('Name','Gr',Form2.Rzgroupbox1.Caption);
lang.WriteString('Name','B1',Form2.RzButton1.Caption);
lang.WriteString('Name','B2',Form2.RzButton2.Caption);
lang.WriteString('Name','URL',Form2.RzURLLabel1.Caption);
lang.WriteString('Name','BB',Form2.RzBitBtn1.Caption);
lang.WriteString('Name','bck',Form2.Label3.Caption);
lang.WriteString('Name','txt',Form2.Label4.Caption);
lang.WriteString('Name','nmb',Form2.Label5.Caption);
lang.WriteString('Name','tr',Form2.Label6.Caption);
lang.WriteString('Name','ts4',form2.TabSheet4.Caption);
lang.WriteString('Name','2l7',form2.Label7.Caption);
lang.WriteString('Name','2l8',form2.Label8.Caption);
lang.WriteString('Name','ts5',Form2.TabSheet5.Caption);
lang.WriteString('Name','Auto',Form2.CheckBox1.Caption);
lang.WriteString('Name','l9',Form2.label9.Caption);
lang.WriteString('Name','l15',Form1.Label15.Caption);
lang.WriteString('Name','tim',Form2.Label10.Caption);
lang.WriteString('Name','2l11',Form2.Label11.Caption);
lang.WriteString('Name','ch2',Form2.CheckBox2.Caption);
lang.WriteString('Name','ch3',Form2.CheckBox3.Caption) ;

 end;
 if (a='ukr') then begin
 lang.WriteString('Ukr','l1',form1.Label1.Caption);
 lang.WriteString('Ukr','l3',form1.Label3.Caption);
 lang.WriteString('Ukr','l2',form1.Label2.Caption);
 lang.WriteString('Ukr','l5',form1.Label5.Caption);
lang.WriteString('Ukr','N1',form1.N1.Caption);
lang.WriteString('Ukr','N4',form1.N4.Caption);
lang.WriteString('Ukr','N5',form1.N5.Caption);
lang.WriteString('Ukr','N7',form1.N7.Caption);
lang.WriteString('Ukr','N8',form1.N8.Caption);
lang.WriteString('Ukr','N2',form1.N2.Caption);
lang.WriteString('Ukr','ts1',Form2.TabSheet1.Caption);
lang.WriteString('Ukr','ts2',Form2.TabSheet2.Caption);
lang.WriteString('Ukr','ts3',Form2.TabSheet3.Caption);
lang.WriteString('Ukr','2l2',Form2.label2.Caption);
lang.WriteString('Ukr','2l1',Form2.label1.Caption);
lang.WriteString('Ukr','Gr',Form2.Rzgroupbox1.Caption);
lang.WriteString('Ukr','B1',Form2.RzButton1.Caption);
lang.WriteString('Ukr','B2',Form2.RzButton2.Caption);
lang.WriteString('Ukr','URL',Form2.RzURLLabel1.Caption);
lang.WriteString('Ukr','BB',Form2.RzBitBtn1.Caption);
lang.WriteString('Ukr','bck',Form2.Label3.Caption);
lang.WriteString('Ukr','txt',Form2.Label4.Caption);
lang.WriteString('Ukr','nmb',Form2.Label5.Caption);
lang.WriteString('Ukr','tr',Form2.Label6.Caption);
lang.WriteString('Ukr','ts4',form2.TabSheet4.Caption);
lang.WriteString('Ukr','2l7',form2.Label7.Caption);
lang.WriteString('Ukr','2l8',form2.Label8.Caption);
lang.WriteString('Ukr','ts5',Form2.TabSheet5.Caption);
lang.WriteString('Ukr','Auto',Form2.CheckBox1.Caption);
lang.WriteString('Ukr','l9',Form2.label9.Caption);
lang.WriteString('Ukr','l15',Form1.Label15.Caption);
lang.WriteString('Ukr','tim',Form2.Label10.Caption);
lang.WriteString('Ukr','2l11',Form2.Label11.Caption);
lang.WriteString('Ukr','ch2',Form2.CheckBox2.Caption);
lang.WriteString('Ukr','ch3',Form2.CheckBox3.Caption) ;
 end;
 if (a='engl') then begin
 lang.WriteString('Engl','l1',form1.Label1.Caption);
 lang.WriteString('Engl','l3',form1.Label3.Caption);
 lang.WriteString('Engl','l2',form1.Label2.Caption);
  lang.WriteString('Engl','l5',form1.Label5.Caption);
lang.WriteString('Engl','N1',form1.N1.Caption);
lang.WriteString('Engl','N4',form1.N4.Caption);
lang.WriteString('Engl','N5',form1.N5.Caption);
lang.WriteString('Engl','N7',form1.N7.Caption);
lang.WriteString('Engl','N8',form1.N8.Caption);
lang.WriteString('Engl','N2',form1.N2.Caption);
lang.WriteString('Engl','ts1',Form2.TabSheet1.Caption);
lang.WriteString('Engl','ts2',Form2.TabSheet2.Caption);
lang.WriteString('Engl','ts3',Form2.TabSheet3.Caption);
lang.WriteString('Engl','2l2',Form2.label2.Caption);
lang.WriteString('Engl','2l1',Form2.label1.Caption);
lang.WriteString('Engl','Gr',Form2.Rzgroupbox1.Caption);
lang.WriteString('Engl','B1',Form2.RzButton1.Caption);
lang.WriteString('Engl','B2',Form2.RzButton2.Caption);
lang.WriteString('Engl','URL',Form2.RzURLLabel1.Caption);
lang.WriteString('Engl','BB',Form2.RzBitBtn1.Caption);
lang.WriteString('Engl','bck',Form2.Label3.Caption);
lang.WriteString('Engl','txt',Form2.Label4.Caption);
lang.WriteString('Engl','nmb',Form2.Label5.Caption);
lang.WriteString('Engl','tr',Form2.Label6.Caption);
lang.WriteString('Engl','ts4',form2.TabSheet4.Caption);
lang.WriteString('Engl','2l7',form2.Label7.Caption);
lang.WriteString('Engl','2l8',form2.Label8.Caption);
lang.WriteString('Engl','ts5',Form2.TabSheet5.Caption);
lang.WriteString('Engl','Auto',Form2.CheckBox1.Caption);
lang.WriteString('Engl','l9',Form2.label9.Caption);
lang.WriteString('Engl','l15',Form1.Label15.Caption);
lang.WriteString('Engl','tim',Form2.Label10.Caption);
lang.WriteString('Engl','2l11',Form2.Label11.Caption);
lang.ReadString('Engl','ch2',Form2.CheckBox2.Caption)  ;
lang.ReadString('Engl','ch2',Form2.CheckBox3.Caption)   ;
 end;
 MyIni.Free;
 lang.Free;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
Form2.Close;
end;

procedure TForm2.DateTimePicker1Change(Sender: TObject);
const
I = 1;
var
event:integer;
days:real;
begin
event:=(DaysBetween(DateTimePicker1.DateTime,Now));
days:=event;
Form1.Label4.Caption:= FloatToStr(days);
end;

procedure TForm2.RzTrackBar1Change(Sender: TObject);
begin
if RzTrackBar1.Position = 0 then
Form1.AlphaBlendValue := 250;
if RzTrackBar1.Position = 1 then
Form1.AlphaBlendValue := 225;
if RzTrackBar1.Position = 2 then
Form1.AlphaBlendValue := 200;
if RzTrackBar1.Position = 3 then
Form1.AlphaBlendValue := 175;
if RzTrackBar1.Position = 4 then
Form1.AlphaBlendValue := 150;
if RzTrackBar1.Position = 5 then
Form1.AlphaBlendValue := 125;
if RzTrackBar1.Position = 6 then
Form1.AlphaBlendValue := 100;
if RzTrackBar1.Position = 7 then
Form1.AlphaBlendValue := 75;
if RzTrackBar1.Position = 8 then
Form1.AlphaBlendValue := 50;
end;

procedure TForm2.RzColorEdit1Change(Sender: TObject);
begin
Form1.Color:= Form2.RzColorEdit1.SelectedColor
end;

procedure TForm2.RzColorEdit2Change(Sender: TObject);
begin
Form1.Label1.Font.Color:=Form2.RzColorEdit2.SelectedColor;
Form1.Label2.Font.Color:=Form2.RzColorEdit2.SelectedColor;
Form1.Label3.Font.Color:=Form2.RzColorEdit2.SelectedColor;
Form1.Label5.Font.Color:=Form2.RzColorEdit2.SelectedColor;
Form1.Label15.Font.Color:=Form2.RzColorEdit2.SelectedColor;
end;

procedure TForm2.RzColorEdit3Change(Sender: TObject);
begin
Form1.Label4.Font.Color:=Form2.RzColorEdit3.SelectedColor;
end;

procedure TForm2.RzBorder1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if button=mbLeft then
  begin
   Dragging := True;
   OldLeft := X;
   OldTop := Y;
  end;
end;

procedure TForm2.RzBorder1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
 if Dragging then
  begin
   Left := Left+X-OldLeft;
   Top := Top+Y-OldTop;
  end;
end;

procedure TForm2.RzBorder1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 Dragging := False;
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
form1.Label2.Caption:=edit1.Text;
end;

procedure TForm2.RzButton1Click(Sender: TObject);
var
a:string;
begin
 Settings := TIniFile.Create(ExtractFilePath(paramstr(0))+'settings.ini');
 a:= Settings.ReadString('settings','language','rus');
if (a='engl') then
begin
Form1.Label1.Caption:='To';
Form1.Label3.Caption:='remaind';
end;
if (a='rus') then
begin
Form1.Label1.Caption:='До';
Form1.Label3.Caption:='осталось';
end;
if (a='ukr') then
begin
Form1.Label1.Caption:='До';
Form1.Label3.Caption:='залишилось';
end;
end;

procedure TForm2.RzButton2Click(Sender: TObject);
var
a:string;
begin
 Settings := TIniFile.Create(ExtractFilePath(paramstr(0))+'settings.ini');
 a:= Settings.ReadString('settings','language','rus');
if (a='engl') then
begin
Form1.Label1.Caption:='From';
Form1.Label3.Caption:='has passed';
end;
if (a='rus') then
 Form1.Label1.Caption:='От';
Form1.Label3.Caption:='прошло';
if (a='ukr') then
begin
Form1.Label1.Caption:='Від';
Form1.Label3.Caption:='пройшло';

end;
end;


procedure TForm2.RzBitBtn1Click(Sender: TObject);
var
Reg: TRegistry;
begin
   if CheckBox1.Checked=True then
  begin
    Reg:=TRegistry.Create;
    Begin
      Reg.RootKey:=HKEY_LOCAL_MACHINE;
      Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run',True);
      Reg.WriteString('OFPBor',Application.ExeName);
      Reg.Free;
    End;
  end
  else
  begin
    Reg:=TRegistry.Create;
    Begin
      Reg.RootKey:=HKEY_LOCAL_MACHINE;
      Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run',True);
      Reg.DeleteValue('OFPBor');
      Reg.Free;
    End;
end;
Form2.Close;
end;

procedure TForm2.RzBitBtn3Click(Sender: TObject);
begin
lang:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'lang.ini');
 Form1.Label1.Caption:=lang.ReadString('Engl','l1','To');
  Form1.Label3.Caption:=lang.ReadString('Engl','l3','remaind');
  Form1.Label2.Caption:=lang.ReadString('Engl','l2','the new year');
  Form1.Label5.Caption:=lang.ReadString('Engl','l5','days');
  Form1.N1.Caption:=lang.ReadString('Engl','N1','Settings');
  Form1.N4.Caption:=lang.ReadString('Engl','N4','Minimize');
  Form1.N5.Caption:=lang.ReadString('Engl','N5','Deploy');
  Form1.N7.Caption:=lang.ReadString('Engl','N7','Show icon on tray');
  Form1.N8.Caption:=lang.ReadString('Engl','N8','Hide icon on tray');
  Form1.N2.Caption:=lang.ReadString('Engl','N2','Exit');
  Form2.TabSheet1.Caption:=lang.ReadString('Engl','ts1','Main');
  Form2.TabSheet2.Caption:=lang.ReadString('Engl','ts2','Design');
  Form2.TabSheet3.Caption:=lang.ReadString('Engl','ts3','Language');
  Form2.label2.Caption:=lang.ReadString('Engl','2l2','Date');
  Form2.label1.Caption:=lang.ReadString('Engl','2l1','Event');
  Form2.Rzgroupbox1.Caption:=lang.ReadString('Engl','Gr','Type');
  Form2.RzButton1.Caption:=lang.ReadString('Engl','B1','Left until...');
  Form2.RzButton2.Caption:=lang.ReadString('Engl','B2','Passed from...');
  Form2.RzURLLabel1.Caption:=lang.ReadString('Engl','URL','KHB-Soft website ');
  Form2.RzBitBtn1.Caption:=lang.ReadString('Engl','BB','Ok');
  Form2.Label3.Caption:= lang.ReadString('Engl','bck','Color of background');
  Form2.Label4.Caption:= lang.ReadString('Engl','txt','Color of text');
  Form2.Label5.Caption:= lang.ReadString('Engl','nmb','Color of numbers');
  Form2.Label6.Caption:= lang.ReadString('Engl','tr','Transparent');
    Form2.TabSheet4.Caption:= lang.ReadString('Engl','ts4','Font');
  Form2.Label7.Caption:= lang.ReadString('Engl','2l7','Text font');
    Form2.Label8.Caption:= lang.ReadString('Engl','2l8','Numbers font');
         Form2.CheckBox1.Caption:= lang.ReadString('Engl','Auto','Autorun') ;
  Form2.TabSheet5.Caption:= lang.ReadString('Engl','ts5','Skins');
  Form2.Label9.Caption:=lang.ReadString('Engl','l9','Load skin (155x95)');
    Form1.Label15.Caption:=lang.ReadString('Engl','l15','(hh:mm:ss)');
  Form2.CheckBox2.Caption:=lang.ReadString('Engl','ch2','Timer')    ;
  Form2.Label10.Caption:= lang.ReadString('Engl','tim','Color of timer');
  Form2.Label11.Caption:= lang.ReadString('Engl','2l11','Timer font');
  Form2.CheckBox3.Caption:= lang.ReadString('Engl','ch3','Border');
  Settings := TIniFile.Create(ExtractFilePath(paramstr(0))+'settings.ini');
  Settings.WriteString('settings','language','engl');
  Settings.Free;
end;

procedure TForm2.RzBitBtn2Click(Sender: TObject);
begin
lang:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'lang.ini');
  Form1.Label1.Caption:=lang.ReadString('Name','l1','До');
  Form1.Label3.Caption:=lang.ReadString('Name','l3','осталось');
  Form1.Label2.Caption:=lang.ReadString('Name','l2','нового года');
  Form1.Label5.Caption:=lang.ReadString('Name','l5','дней');
  Form1.N1.Caption:=lang.ReadString('Name','N1','Настройки');
  Form1.N4.Caption:=lang.ReadString('Name','N4','Свернуть');
  Form1.N5.Caption:=lang.ReadString('Name','N5','Развернуть');
  Form1.N7.Caption:=lang.ReadString('Name','N7','Отображать иконку в трее');
  Form1.N8.Caption:=lang.ReadString('Name','N8','Скрыть иконку в трее');
  Form1.N2.Caption:=lang.ReadString('Name','N2','Выход');
  Form2.TabSheet1.Caption:=lang.ReadString('Name','ts1','Основные');
  Form2.TabSheet2.Caption:=lang.ReadString('Name','ts2','Внешний вид');
  Form2.TabSheet3.Caption:=lang.ReadString('Name','ts3','Язык');
  Form2.label2.Caption:=lang.ReadString('Name','2l2','Дата');
  Form2.label1.Caption:=lang.ReadString('Name','2l1','Событие');
  Form2.Rzgroupbox1.Caption:=lang.ReadString('Name','Gr','Тип отсчета');
  Form2.RzButton1.Caption:=lang.ReadString('Name','B1','Осталось до...');
  Form2.RzButton2.Caption:=lang.ReadString('Name','B2','Прошло от...');
  Form2.RzURLLabel1.Caption:=lang.ReadString('Name','URL','Сайт разработчика ');
  Form2.RzBitBtn1.Caption:=lang.ReadString('Name','BB','Готово');
  Form2.Label3.Caption:= lang.ReadString('Name','bck','Цвет фона');
  Form2.Label4.Caption:= lang.ReadString('Name','txt','Цвет букв');
  Form2.Label5.Caption:= lang.ReadString('Name','nmb','Цвет цифр');
  Form2.Label6.Caption:= lang.ReadString('Name','tr','Прозрачность');
    Form2.TabSheet4.Caption:= lang.ReadString('Name','ts4','Шрифт');
  Form2.Label7.Caption:= lang.ReadString('Name','2l7','Шрифт букв');
    Form2.Label8.Caption:= lang.ReadString('Name','2l8','Шрифт цифр');
          Form2.CheckBox1.Caption:= lang.ReadString('Name','Auto','Автозагрузка') ;
  Form2.TabSheet5.Caption:= lang.ReadString('Name','ts5','Скины');
  Form2.Label9.Caption:=lang.ReadString('Name','l9','Загрузите скин (155x95)');
    Form1.Label15.Caption:=lang.ReadString('Name','l15','(чч:мм:сс)');
  Form2.CheckBox2.Caption:=lang.ReadString('Name','ch2','Таймер')    ;
  Form2.Label10.Caption:= lang.ReadString('Name','tim','Цвет таймера');
  Form2.Label11.Caption:= lang.ReadString('Name','2l11','Шрифт таймера');
  Form2.CheckBox3.Caption:= lang.ReadString('Name','ch3','Рамка');
    Settings := TIniFile.Create(ExtractFilePath(paramstr(0))+'settings.ini');
    Settings.WriteString('settings','language','rus');
  Settings.Free;
end;

procedure TForm2.RzFontComboBox1Change(Sender: TObject);
begin
Form1.Label1.Font.Name:=Form2.RzFontComboBox1.FontName;
Form1.Label2.Font.Name:=Form1.Label1.Font.Name;
Form1.Label3.Font.Name:=Form1.Label1.Font.Name;
Form1.Label5.Font.Name:=Form1.Label1.Font.Name;
end;

procedure TForm2.RzFontComboBox2Change(Sender: TObject);
begin
Form1.Label4.Font.Name:=Form2.RzFontComboBox2.FontName;
end;

procedure TForm2.RzRapidFireButton1Click(Sender: TObject);
begin
 if OpenDialog1.Execute then
 with Form1.RzFormShape1 do
 begin
   Picture.LoadFromFile(OpenDialog1.FileName);
   Form1.RzFormShape1.RecreateRegion;


 end;
 edit2.Text:= OpenDialog1.FileName;
 form1.RzFormShape1.Refresh;
 if edit2.Text='' then
 edit2.Text:='Skins/first.png';
end;

procedure TForm2.CheckBox2Click(Sender: TObject);
begin
if Checkbox2.Checked= false then
begin
form1.ClientHeight:=75;
form1.RzBorder1.Height:=75;
end;
if Checkbox2.Checked= true then
begin
form1.ClientHeight:=95;
form1.RzBorder1.Height:=95;
end;
end;

procedure TForm2.RzColorEdit4Change(Sender: TObject);
begin
Form1.Label16.Font.Color:=Form2.RzColorEdit4.SelectedColor;
end;

procedure TForm2.RzFontComboBox3Change(Sender: TObject);
begin
Form1.Label16.Font.Name:=Form2.RzFontComboBox3.FontName;
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
begin
if Checkbox3.Checked= false then
begin
Form1.RzBorder1.Visible:=False;
end;
if Checkbox3.Checked= true then
begin
Form1.RzBorder1.Visible:=True;
end;
end;

procedure TForm2.RzPageControl1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 if button=mbLeft then
  begin
   Dragging := True;
   OldLeft := X;
   OldTop := Y;
  end;
end;

procedure TForm2.RzPageControl1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
 if Dragging then
  begin
   Left := Left+X-OldLeft;
   Top := Top+Y-OldTop;
  end;
end;

procedure TForm2.RzPageControl1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
 Dragging := False;
end;

procedure TForm2.RzSpinEdit1Click(Sender: TObject);
begin
form1.Label1.Font.Size:=form2.RzSpinEdit1.IntValue;
form1.Label2.Font.Size:=form1.Label1.Font.Size;
form1.Label3.Font.Size:=form1.Label1.Font.Size;
form1.Label5.Font.Size:=form1.Label1.Font.Size;
end;

procedure TForm2.RzSpinEdit1Change(Sender: TObject);
begin
form1.Label1.Font.Size:=form2.RzSpinEdit1.IntValue;
form1.Label2.Font.Size:=form1.Label1.Font.Size;
form1.Label3.Font.Size:=form1.Label1.Font.Size;
form1.Label5.Font.Size:=form1.Label1.Font.Size;
end;

procedure TForm2.RzSpinEdit2Change(Sender: TObject);
begin
form1.Label4.Font.Size:=form2.RzSpinEdit2.IntValue;
end;

procedure TForm2.RzSpinEdit2Click(Sender: TObject);
begin
form1.Label4.Font.Size:=form2.RzSpinEdit2.IntValue;
end;

procedure TForm2.RzSpinEdit3Click(Sender: TObject);
begin
form1.Label16.Font.Size:=form2.RzSpinEdit3.IntValue;
end;

procedure TForm2.RzSpinEdit3Change(Sender: TObject);
begin
form1.Label16.Font.Size:=form2.RzSpinEdit3.IntValue;
end;

procedure TForm2.RzToolbarButton1Click(Sender: TObject);
var
 version:WideString;
 begin
   try
    version:=IdHTTP1.Get('http://khb-soft.org.ua/update/date/version.html');
    if version=RzLabel1.Caption then
     begin
      Application.MessageBox('You have a last version','KHB-Soft',MB_OK);
     end
    else
     begin
      Application.MessageBox('You can download a new version from KHB-Soft web-site','KHB-Soft',MB_OK);
     end;
   except
    on e:Exception do
     //-//-//-//-//-//
   end;
end;

procedure TForm2.RzBitBtn4Click(Sender: TObject);
begin
lang:=TIniFile.Create(ExtractFilePath(Application.ExeName)+'lang.ini');
  Form1.Label1.Caption:=lang.ReadString('Ukr','l1','До');
  Form1.Label3.Caption:=lang.ReadString('Ukr','l3','залишилось');
  Form1.Label2.Caption:=lang.ReadString('Ukr','l2','нового року');
  Form1.Label5.Caption:=lang.ReadString('Ukr','l5','днів');
  Form1.N1.Caption:=lang.ReadString('Ukr','N1','Параметри');
  Form1.N4.Caption:=lang.ReadString('Ukr','N4','Згорнути');
  Form1.N5.Caption:=lang.ReadString('Ukr','N5','Розгорнути');
  Form1.N7.Caption:=lang.ReadString('Ukr','N7','Відображати іконку в лотку');
  Form1.N8.Caption:=lang.ReadString('Ukr','N8','Приховати іконку в лотку');
  Form1.N2.Caption:=lang.ReadString('Ukr','N2','Вихід');
  Form2.TabSheet1.Caption:=lang.ReadString('Ukr','ts1','Основні');
  Form2.TabSheet2.Caption:=lang.ReadString('Ukr','ts2','Зовнішній вигляд');
  Form2.TabSheet3.Caption:=lang.ReadString('Ukr','ts3','Мова');
  Form2.label2.Caption:=lang.ReadString('Ukr','2l2','Дата');
  Form2.label1.Caption:=lang.ReadString('Ukr','2l1','Подія');
  Form2.Rzgroupbox1.Caption:=lang.ReadString('Ukr','Gr','Тип');
  Form2.RzButton1.Caption:=lang.ReadString('Ukr','B1','Залишилось до...');
  Form2.RzButton2.Caption:=lang.ReadString('Ukr','B2','Пройшло від...');
  Form2.RzURLLabel1.Caption:=lang.ReadString('Ukr','URL','Сайт розробника');
  Form2.RzBitBtn1.Caption:=lang.ReadString('Ukr','BB','Гаразд');
  Form2.Label3.Caption:= lang.ReadString('Ukr','bck','Колір тла');
  Form2.Label4.Caption:= lang.ReadString('Ukr','txt','Колір тексту');
  Form2.Label5.Caption:= lang.ReadString('Ukr','nmb','Колір цифр');
  Form2.Label6.Caption:= lang.ReadString('Ukr','tr','Прозорість');
    Form2.TabSheet4.Caption:= lang.ReadString('Ukr','ts4','Шрифт');
  Form2.Label7.Caption:= lang.ReadString('Ukr','2l7','Шрифт тексту');
    Form2.Label8.Caption:= lang.ReadString('Ukr','2l8','Шрифт цифр');
      Form2.CheckBox1.Caption:= lang.ReadString('Ukr','Auto','Автозавантаження') ;
  Form2.TabSheet5.Caption:= lang.ReadString('Ukr','ts5','Обкладинки');
  Form2.Label9.Caption:=lang.ReadString('Ukr','l9','Завантажте обкладинку (155x95)');
      Form1.Label15.Caption:=lang.ReadString('Ukr','l15','(гг:хх:сс)');
  Form2.CheckBox2.Caption:=lang.ReadString('Ukr','ch2','Таймер')    ;
  Form2.Label10.Caption:= lang.ReadString('Ukr','tim','Колір таймера');
  Form2.Label11.Caption:= lang.ReadString('Ukr','2l11','Шрифт таймера');
  Form2.CheckBox3.Caption:= lang.ReadString('Ukr','ch3','Рамка');
  Settings := TIniFile.Create(ExtractFilePath(paramstr(0))+'settings.ini');
  Settings.WriteString('settings','language','ukr');
  Settings.Free;
end;

end.
