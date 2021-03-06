unit Unit_GoodsDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, DBCtrlsEh,
  DBLookupEh, DBGridEh;

type
  Tfrm_GoodsDetail = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Bevel1: TBevel;
    Bevel2: TBevel;
    btok: TBitBtn;
    btno: TBitBtn;
    btadd: TBitBtn;
    Memo1: TMemo;
    Image1: TImage;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    Label12: TLabel;
    DBEdit4: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit5: TDBEdit;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    pf: TDBEdit;
    Label21: TLabel;
    ls: TDBEdit;
    Label22: TLabel;
    edit6: TDBMemo;
    Bevel3: TBevel;
    jx: TDBComboBoxEh;
    dw: TDBComboBoxEh;
    Label1: TLabel;
    lx: TDBComboBoxEh;
    cj: TDBComboBoxEh;
    wh: TDBEdit;
    sp1: TSpeedButton;
    look1: TDBLookupComboboxEh;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure check(Sender: TObject);
    procedure btokClick(Sender: TObject);
    procedure btnoClick(Sender: TObject);
    procedure btaddClick(Sender: TObject);
    procedure checkstr(Sender: TObject);
    procedure jxButtonDown(Sender: TObject; TopButton: Boolean;
      var AutoRepeat, Handled: Boolean);
    procedure dwButtonDown(Sender: TObject; TopButton: Boolean;
      var AutoRepeat, Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure lxButtonDown(Sender: TObject; TopButton: Boolean;
      var AutoRepeat, Handled: Boolean);
    procedure cjButtonDown(Sender: TObject; TopButton: Boolean;
      var AutoRepeat, Handled: Boolean);
    procedure pfExit(Sender: TObject);
    procedure lsExit(Sender: TObject);
    procedure whEnter(Sender: TObject);
    procedure whExit(Sender: TObject);
    procedure look1Change(Sender: TObject);
    procedure look1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    function search(fieldname:string;value:string):boolean;
    procedure dotj;
    { Private declarations }
  public
     function checkdata:boolean;
    { Public declarations }
  end;

var frm_GoodsDetail:tfrm_GoodsDetail;

implementation

uses Unit_DataModule;

{$R *.dfm}

procedure Tfrm_GoodsDetail.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then
  postmessage(handle,wm_keydown,vk_tab,0);
end;

function Tfrm_GoodsDetail.checkdata: boolean;
begin

   result:=true;
   if trim(dbedit1.Text)='' then
   begin
   showmessage('商品编号不能为空!');
   result:=false;
   dbedit1.SetFocus;
   exit;
   end ;
    if search(dbedit1.DataField,dbedit1.Text) then
      begin
      showmessage('商品编号重复,请重新录入!');
      result:=false;
      dbedit1.SetFocus;
      exit;
    end;


   if trim(dbedit2.Text)='' then
   begin
   showmessage('商品代码不能为空!');
   result:=false;
   dbedit2.SetFocus;
   exit;
   end;

    if search(dbedit2.datafield,dbedit2.Text) then
    begin
      showmessage('商品代码重复,请重新录入!');
      result:=false;
      dbedit2.SetFocus;
      exit;
    end;

   if trim(dbedit3.Text)='' then
   begin
   showmessage('商品名称不能为空!');
   result:=false;
   dbedit3.SetFocus;
   exit;
   end;
   if trim(jx.Text)='' then
   begin
   showmessage('商品剂型不能为空!');
   result:=false;
   jx.SetFocus;
   exit;
   end;
   if trim(dw.Text)='' then
   begin
   showmessage('商品单位不能为空!');
   result:=false;
   dw.SetFocus;
   exit;
   end;
   if trim(pf.Text)='' then
   begin
   showmessage('商品批发价格不能为空!');
   result:=false;
   pf.SetFocus;
   exit;
   end;
     if trim(ls.Text)='' then
   begin
   showmessage('商品零售价不能为空!');
   result:=false;
   ls.SetFocus;
   exit;
   end;

    if pf.Field.Value>ls.Field.Value then
    if application.MessageBox('批发价大于零售价,是否调整？','警告' ,MB_yesno)=idyes then
    begin
    result:=false;
    pf.SetFocus;
    exit;
    end;


   if trim(dbedit5.Text)='' then
   begin
   showmessage('商品规格不能为空!');
   result:=false;
   dbedit5.SetFocus;
   exit;
   end;
     if trim(lx.Text)='' then
   begin
   showmessage('商品类型不能为空!');
   result:=false;
   lx.SetFocus;
   exit;
   end;
   if  trim(wh.EditText)='' then
   begin
   showmessage('批准文号不能为空！请认真填写！');
   result:=false;
   wh.SetFocus;
   exit;
   end;
   if (trim(dbedit8.Text)<>'') and (trim(dbedit9.Text)<>'') then
   if (dbedit8.Field.Value<>-1) and (dbedit9.Field.Value<>0)  then
   if dbedit8.Field.Value<dbedit9.Field.Value then
   begin
   showmessage('最高库存限量小于最低库存限量！');
   result:=false;
   dbedit8.SetFocus;
   exit;
   end;



end;

procedure Tfrm_GoodsDetail.check(Sender: TObject);
begin
if (sender as tdbedit).Field.AsFloat<0 then
begin
 showmessage('存量限制必需大于0');
 (sender as tdbedit).SetFocus;
end;
end;

procedure Tfrm_GoodsDetail.btokClick(Sender: TObject);
begin
  if sp1.Visible then
  dotj
  else
  if checkdata then
    DMod.typzdk.Post;
  close;
end;

procedure Tfrm_GoodsDetail.btnoClick(Sender: TObject);
begin
      DMod.typzdk.Cancel;
      close;
end;

procedure Tfrm_GoodsDetail.btaddClick(Sender: TObject);
begin
   if checkdata then
   DMod.typzdk.Append;
end;

procedure Tfrm_GoodsDetail.checkstr(Sender: TObject);
begin
   if   trim((sender as Tdbedit).Text)='' then
      (sender as Tdbedit).SetFocus;
end;

procedure Tfrm_GoodsDetail.jxButtonDown(Sender: TObject; TopButton: Boolean;
  var AutoRepeat, Handled: Boolean);

begin

  jx.Items.Clear;
  DMod.ttemp.Close;
  DMod.ttemp.CommandText:=' select distinct 剂型 from ypzdk'   ;
  DMod.ttemp.Open;
  DMod.ttemp.First;
  while not DMod.ttemp.Eof do
  begin
    jx.Items.Add(DMod.ttemp.Fields[0].asstring) ;
    DMod.ttemp.Next;
  end;
end;

procedure Tfrm_GoodsDetail.dwButtonDown(Sender: TObject;
  TopButton: Boolean; var AutoRepeat, Handled: Boolean);
begin
  dw.Items.Clear;
  DMod.ttemp.Close;
  DMod.ttemp.CommandText:=' select distinct 单位 from ypzdk'   ;
  DMod.ttemp.Open;
  DMod.ttemp.First;
  while not DMod.ttemp.Eof do
  begin
    dw.Items.Add(DMod.ttemp.Fields[0].asstring) ;
    DMod.ttemp.Next;
  end;
end;

procedure Tfrm_GoodsDetail.FormShow(Sender: TObject);
begin
//DMod.typzdk.Append;

end;

procedure Tfrm_GoodsDetail.lxButtonDown(Sender: TObject;
  TopButton: Boolean; var AutoRepeat, Handled: Boolean);
begin
  lx.Items.Clear;
  DMod.ttemp.Close;
  DMod.ttemp.CommandText:=' select distinct 分类 from ypzdk'   ;
  DMod.ttemp.Open;
  DMod.ttemp.First;
  while not DMod.ttemp.Eof do
  begin
    lx.Items.Add(DMod.ttemp.Fields[0].asstring) ;
    DMod.ttemp.Next;
  end;
end;

procedure Tfrm_GoodsDetail.cjButtonDown(Sender: TObject; TopButton: Boolean;
  var AutoRepeat, Handled: Boolean);
begin
  cj.Items.Clear;
  DMod.ttemp.Close;
  DMod.ttemp.CommandText:=' select distinct 生产厂家 from ypzdk'   ;
  DMod.ttemp.Open;
  DMod.ttemp.First;
  while not DMod.ttemp.Eof do
  begin
    cj.Items.Add(DMod.ttemp.Fields[0].asstring) ;
    DMod.ttemp.Next;
  end;
end;

procedure Tfrm_GoodsDetail.pfExit(Sender: TObject);
begin
 if pf.Field.Value<0 then
 begin
 showmessage('批发价必须大于0!');
 pf.SetFocus;
 end;
end;

procedure Tfrm_GoodsDetail.lsExit(Sender: TObject);
begin
if ls.Field.Value<0 then
 begin
 showmessage('批发价必须大于0!');
 ls.SetFocus;
 end;
end;

function Tfrm_GoodsDetail.search(fieldname: string; value: string): boolean;
begin
   DMod.ttemp.Close;
   DMod.ttemp.CommandText:=' select id from ypzdk where '+trim(fieldname)+' ='''+trim(value)+'''';

   if look1.Visible then
   DMod.ttemp.commandtext:=DMod.ttemp.CommandText+' and id <>'+DMod.typzdk.Fieldbyname('id').asstring;

   showmessage(DMod.ttemp.commandtext);
   DMod.ttemp.Open;
   result:= not DMod.ttemp.Eof;  
end;

procedure Tfrm_GoodsDetail.whEnter(Sender: TObject);
begin
   wh.Width:=150;
end;

procedure Tfrm_GoodsDetail.whExit(Sender: TObject);
begin
wh.Width:=81;
end;

procedure Tfrm_GoodsDetail.dotj;
var a:int64;
begin
  if (trim(pf.Text)='') or (trim(ls.Text)='') then
  begin
    showmessage('请将价格信息录入完整！');
    pf.SetFocus;
    exit;
  end;
  if pf.Field.Value>ls.Field.Value then
  begin
    
    showmessage('批发价大于零售价！');
    ls.SetFocus;
    exit;
  end;
  // if (pf.Field.OldValue=pf.Field.Value) and (ls.Field.OldValue=ls.Field.Value) then
  // begin
    //showmessage('价格没有变动，请点击取消！');
    //ls.SetFocus;
    //exit;
   //end;
   //showmessage(floattostr(pf.Field.OldValue));
   //showmessage(floattostr(pf.Field.value));
  begin
  a:=DMod.typzdk.FieldValues['id'];
  //showmessage(inttostr(a));
  DMod.ttj.Open;
  DMod.ttj.append;
  DMod.ttj.Edit;
  DMod.ttj.Fieldbyname('ypid').AsInteger:=a;
  DMod.ttj.Fieldvalues['oldpf']:=pf.Field.oldvalue;
  DMod.ttj.Fieldvalues['oldls']:=ls.Field.oldvalue;
  DMod.ttj.Fieldvalues['newpf']:=pf.Field.value;
  DMod.ttj.FieldValues['newls']:=ls.Field.Value;
  DMod.ttj.FieldValues['tjdate']:=now;
  DMod.ttj.Post;
  DMod.typzdk.Edit;
  DMod.typzdk.Post;
  DMod.ttj.Close;
  
  end

end;

procedure Tfrm_GoodsDetail.look1Change(Sender: TObject);
begin
if trim(look1.Text)<>'' then
 begin
  DMod.typzdk.DisableControls;
  DMod.typzdk.filtered:=false;
  DMod.typzdk.Filter:=' 编号 like '''+trim(look1.text)+'%'' or '+'简码 like '''+trim(look1.text)+'%'' or '+'名称 like '''+trim(look1.text)+'%''' ;
  //showmessage(DMod.typzdk.Filter);
  DMod.typzdk.Filtered:=true;
  DMod.typzdk.EnableControls;
 end
else
  DMod.typzdk.Filtered:=false;
end;

procedure Tfrm_GoodsDetail.look1Exit(Sender: TObject);
begin
if DMod.typzdk.Filtered then
 postmessage(look1.Handle,wm_keydown,vk_down,0);
end;

procedure Tfrm_GoodsDetail.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sp1.Visible:=false;
  look1.Visible:=false;
  btadd.Visible:=false;
end;

end.