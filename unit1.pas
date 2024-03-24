unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    ImageList1: TImageList;
    ImageList2: TImageList;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Image1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    State: Integer;
    Speed: Integer;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Image1Click(Sender: TObject);
begin

end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
  );
begin
  if (State <> 1) then
  begin
     State := 1;    
     Image1.Images := ImageList2;
     Image1.ImageIndex := Image1.Images.Count-1;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  State := 0;
  Speed := 7;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
       State := 0;
       Image1.Images := ImageList1;
       Image1.ImageIndex := Image1.Images.Count-1;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if (State = 1) then Image1.Left := Image1.Left + Speed;
  if (Image1.Left > Form1.Width) then Image1.Left := -Image1.Width;
  if (Image1.ImageIndex-1 >= 0) then
  begin
     Image1.ImageIndex := Image1.ImageIndex - 1;
  end
  else
  begin
      Image1.ImageIndex := Image1.Images.Count-1;
  end;
end;

end.

