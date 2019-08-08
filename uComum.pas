unit uComum;

interface

type
  TComum = Class
  public
    procedure ExitEditMoeda(Objeto: TObject);
    procedure FormatEditMoeda(Objeto: TObject; var VKey: Char; Espaco: integer);
    function VirgulaPorPonto(Valor: string): String;
    function RemoveEditMoeda(Texto: String): String;
  End;

implementation

uses
  Vcl.StdCtrls, System.SysUtils;

{ TComum }

procedure TComum.ExitEditMoeda(Objeto: TObject);
var
  Texto: String;
begin
  Texto := TEdit(Objeto).Text;

  while (pos('R$', Texto) > 0) do
  begin
    Delete(Texto, pos('R$', Texto), 2);
  end;

  if TEdit(Objeto).Text = '' then
    TEdit(Objeto).Text := Format('%m', [0.00])
  else
    TEdit(Objeto).Text := Format('%20s', [trim(Texto)]);
end;

procedure TComum.FormatEditMoeda(Objeto: TObject; var VKey: Char;
  Espaco: integer);
var
  vChar, vDiv: String;
  i: integer;
begin
  if VKey = #13 then
    Exit;

  if pos('R$', TEdit(Objeto).Text) > 0 then
    TEdit(Objeto).Clear;

  if not CharInSet(VKey, ['0' .. '9', ',', #8]) then
  begin
    VKey := #0;
    Exit;
  end;

  vDiv := '1';

  for i := 1 to 2 do
    vDiv := vDiv + '0';

  vChar := Copy(TEdit(Objeto).Text, 1, Length(TEdit(Objeto).Text));

  if (vChar = '') or (vChar = '0') then
  begin
    if VKey <> #8 then
      vChar := VKey
    else
      vChar := '0';
  end
  else if (VKey <> #8) then
    vChar := vChar + VKey;

  while (pos(',', vChar) > 0) or (pos('.', vChar) > 0) do
  begin
    Delete(vChar, pos('.', vChar), 1);
    Delete(vChar, pos(',', vChar), 1);
  end;

  TEdit(Objeto).MaxLength := Espaco;
  TEdit(Objeto).Text := Format('%*.*n',
    [Espaco, 2, StrToFloat(vChar) / StrToInt(vDiv)]);
  TEdit(Objeto).SelStart := Length(TEdit(Objeto).Text);
end;

function TComum.RemoveEditMoeda(Texto: String): String;
begin
  while (pos('R$', Texto) > 0) do
  begin
    Delete(Texto, pos('R$', Texto), 2);
  end;

  Result := trim(Texto);
end;

function TComum.VirgulaPorPonto(Valor: string): String;
var
  i: integer;
begin
  if Valor <> '' then
  begin
    for i := 0 to Length(Valor) do
    begin
      if Valor[i] = ',' then
        Valor[i] := '.';

    end;
  end;
  Result := Valor;
end;

end.
