unit UnitQz;

interface

function printKuitansi(file_name: String): string;
function printLabel(no_lab: string; nama: string; usia: string;
  tgl_lahir: string; alamat: string; tgl: string; hp: string; dokter: string;
  gender: string; zpl: string): string;
function printBarcode(sid: string; pid: string; nama: string;
  specimen: string): string;
function printTubeLabel(no_lab: string; suffix_tube: string;
  nama_pasien: string; tanggal_lahir: string; asal_pasien: string;
  nama_tube: string; no_rm: string; no_rm1: string; test: string;
  gender: string; zpl: string): string;
function printKePrinter(printer: string; file_name: String): string;
function printKePrinterESCPOS(printer: string; header: String; grup: string;
  detail: string): string;
function printKePrinterLabel(printer: string; no_pedaftaran: string;
  kode: string; sid_desc: string; nama: string; tgl: string;
  usia: string): string;

implementation

uses SysUtils, Classes, NetEncoding, StrUtils, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  uniDBLookupComboBox, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  MainModule;

function EncodeFile(const FileName: string): AnsiString;
var
  stream: TMemoryStream;
begin
  stream := TMemoryStream.Create;
  try
    stream.LoadFromFile(FileName);
    result := TNetEncoding.Base64.EncodeBytesToString(stream.Memory,
      stream.Size);
  finally
    stream.Free;
  end;
end;

function printTubeLabel(no_lab: string; suffix_tube: string;
  nama_pasien: string; tanggal_lahir: string; asal_pasien: string;
  nama_tube: string; no_rm: string; no_rm1: string; test: string;
  gender: string; zpl: string): string;
var
  js: string;
  zpl2: string;
begin
  // clean linebreak
  no_lab := StringReplace(no_lab, sLineBreak, ' ', [rfReplaceAll]);
  suffix_tube := StringReplace(suffix_tube, sLineBreak, ' ', [rfReplaceAll]);
  nama_pasien := StringReplace(nama_pasien, sLineBreak, ' ', [rfReplaceAll]);
  tanggal_lahir := StringReplace(tanggal_lahir, sLineBreak, ' ',
    [rfReplaceAll]);
  asal_pasien := StringReplace(tanggal_lahir, sLineBreak, ' ', [rfReplaceAll]);
  nama_tube := StringReplace(nama_tube, sLineBreak, ' ', [rfReplaceAll]);
  test := StringReplace(test, sLineBreak, ' ', [rfReplaceAll]);
  no_rm := StringReplace(no_rm, sLineBreak, ' ', [rfReplaceAll]);
  no_rm1 := StringReplace(no_rm1, sLineBreak, ' ', [rfReplaceAll]);
  gender := StringReplace(gender, sLineBreak, ' ', [rfReplaceAll]);

  // clean quote
  no_lab := StringReplace(no_lab, '"', ' ', [rfReplaceAll]);
  suffix_tube := StringReplace(suffix_tube, '"', ' ', [rfReplaceAll]);
  nama_pasien := StringReplace(nama_pasien, '"', ' ', [rfReplaceAll]);
  tanggal_lahir := StringReplace(tanggal_lahir, '"', ' ', [rfReplaceAll]);
  asal_pasien := StringReplace(asal_pasien, '"', ' ', [rfReplaceAll]);
  nama_tube := StringReplace(nama_tube, '"', ' ', [rfReplaceAll]);
  test := StringReplace(test, sLineBreak, ' ', [rfReplaceAll]);
  no_rm := StringReplace(no_rm, sLineBreak, ' ', [rfReplaceAll]);
  no_rm1 := StringReplace(no_rm1, sLineBreak, ' ', [rfReplaceAll]);
  gender := StringReplace(gender, sLineBreak, ' ', [rfReplaceAll]);

  zpl2 := zpl;
  zpl2 := StringReplace(zpl2, '<no_lab>', no_lab, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<suffix_tube>', suffix_tube, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<asal_pasien>', asal_pasien, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<nama_pasien>', nama_pasien, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<nama_tube>', nama_tube, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<tanggal_lahir>', tanggal_lahir, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<test>', test, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<no_rm>', no_rm, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<no_rm1>', no_rm1, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<gender>', gender, [rfReplaceAll]);

  js := 'function print_' + no_lab + suffix_tube + '() { ' +
    ' var config = qz.configs.create("LABELPRINTER"); ' + ' var data = [' + zpl2
    + ']; ' + ' qz.print(config, data).catch(function(e) { console.error(e);}); '
    + ' } ' + '  if (qz.websocket.isActive()) {  print_' + no_lab + suffix_tube
    + '(); }  else { qz.websocket.connect().then(function() { print_' + no_lab +
    suffix_tube + '();});}  ';

  result := js;
end;

function printTubeLabelOld(no_sampel: string; nama_pasien: string;
  tanggal_lahir: string; asal_pasien: string; nama_tube: string; test: string;
  zpl: string): string;
var
  js: string;
  zpl2: string;
begin
  // clean linebreak
  no_sampel := StringReplace(no_sampel, sLineBreak, ' ', [rfReplaceAll]);
  nama_pasien := StringReplace(nama_pasien, sLineBreak, ' ', [rfReplaceAll]);
  tanggal_lahir := StringReplace(tanggal_lahir, sLineBreak, ' ',
    [rfReplaceAll]);
  asal_pasien := StringReplace(tanggal_lahir, sLineBreak, ' ', [rfReplaceAll]);
  nama_tube := StringReplace(tanggal_lahir, sLineBreak, ' ', [rfReplaceAll]);
  test := StringReplace(test, sLineBreak, ' ', [rfReplaceAll]);

  // clean quote
  no_sampel := StringReplace(no_sampel, '"', ' ', [rfReplaceAll]);
  nama_pasien := StringReplace(nama_pasien, '"', ' ', [rfReplaceAll]);
  tanggal_lahir := StringReplace(tanggal_lahir, '"', ' ', [rfReplaceAll]);
  asal_pasien := StringReplace(asal_pasien, '"', ' ', [rfReplaceAll]);
  nama_tube := StringReplace(nama_tube, '"', ' ', [rfReplaceAll]);
  test := StringReplace(test, sLineBreak, ' ', [rfReplaceAll]);

  //
  {
    "^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR5,5~SD15^JUS^LRN^CI0^XZ\n",
    "^XA\n",
    "^MMT\n",
    "^PW400\n",
    "^LL0240\n",
    "^LS0\n",
    "^BY2,3,92^FT328,22^BCI,,Y,N\n",
    ^FD>;<nomor_lab>6<prefix_tube>^FS
    "^FT385,211^A0I,25,24^FH\^FD<no_lab>^FS\n",
    "^FT385,181^A0I,23,24^FH\^FD<no_rm>^FS\n",
    "^FT385,150^A0I,25,24^FH\^FD<nama_pasien>^FS\n",
    "^FT159,203^A0I,20,19^FH\^FD<gender>^FS\n",
    "^FT160,180^A0I,17,16^FH\^FD<tgl_lahir>^FS\n",
    "^FT385,129^A0I,14,14^FH\^FD<test>^FS\n",
    "^FT21,127^A0R,28,28^FH\^FD<nama_tube>^FS\n",
    "^PQ1,0,1,Y^XZ\n",

  }
  zpl2 := zpl;

  zpl2 := StringReplace(zpl2, '<no_sampel>', no_sampel, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<asal_pasien>', asal_pasien, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<nama_pasien>', nama_pasien, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<nama_tube>', nama_tube, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<tanggal_lahir>', tanggal_lahir, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<test>', test, [rfReplaceAll]);

  js := 'function print() { ' +
    ' var config = qz.configs.create("LABELPRINTER"); ' + ' var data = [' + zpl2
    + ']; ' + ' qz.print(config, data).catch(function(e) { console.error(e);}); '
    + ' } ' + '  if (qz.websocket.isActive()) {  print(); }  else { qz.websocket.connect().then(function() { print();});}  ';

  result := js;
end;

function printKePrinter(printer: string; file_name: String): string;
var
  tmp: AnsiString;
  js, Data: string;
  inStream: TStream;
  outStream: TStream;
begin
  tmp := StringReplace(EncodeFile(file_name), sLineBreak, '"+'#10 + '"',
    [rfReplaceAll]);
  js := 'function print() { ' + ' var config = qz.configs.create("' + printer +
  // '", { size: {width: 148, height: 210 } , units: "mm" }); ' +
    '", { size: {width: 140, height: 216 } , units: "mm" }); ' +
    ' var data = [{ type: "pdf",format:"base64", data: "' + tmp + '" }]; ' +
    ' qz.print(config, data).catch(function(e) { console.error(e);}); ' + ' } '
    + '  if (qz.websocket.isActive()) {  print(); }  else { qz.websocket.connect().then(function() { print();});}  ';

  result := js;
end;

function printKePrinterESCPOS(printer: string; header: String; grup: string;
  detail: string): string;
var
  tmp: AnsiString;
  js, Data: string;
  inStream: TStream;
  outStream: TStream;
begin

  js := 'function print() { ' + ' var config = qz.configs.create("' + printer +
    '"); ' + ' var data = [ { options: { language: "ESCPOS", dotDensity: "double" } }, '
    + '"\x1B"+' + '"\x40",+' + // init
    '"\x1B"+' + '"\x4D"+' + '"\x30",+' + // normal text
  // set font and font size
    header + // Header
    grup + // Grup
    detail + '"\x0A"+' + '"\x0A",' + // line feed 2 times
    '"\x1D"+' + '"\x56"+' + '"\x30"' // full cut (new syntax)
    + ']; ' + ' qz.print(config, data).catch(function(e) { console.error(e);}); '
    + ' } ' + '  if (qz.websocket.isActive()) {  print(); }  else { qz.websocket.connect().then(function() { print();});}  ';

  result := js;
end;

function printKePrinterLabel(printer: string; no_pedaftaran: string;
  kode: string; sid_desc: string; nama: string; tgl: string;
  usia: string): string;
var
  js, sid, old_sid, fname: string;
begin
  old_sid := no_pedaftaran + kode;
  sid := no_pedaftaran + '>6' + kode;
  fname := old_sid + SysUtils.FormatDateTime('yyyymmddhhnnsszzz', now());

  js := 'function printZPL' + fname + '() {   ' +
    ' var config = qz.configs.create("' + printer + '"); ' +
    ' var printData = [ ' + '"CT~~CD,~CC^~CT~\n",' +
    '"^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR5,5~SD15^JUS^LRN^CI0^XZ\n",'
    + '"^XA\n",' + '"^MMT\n",' + '"^PW400\n",' + '"^LL0240\n",' + '"^LS0\n",' +
    '"^BY2,3,105^FT77,125^BCN,,N,N\n",' + '"^FD>;' + sid + '^FS\n",' +
    '"^FT113,173^A0N,25,24^FH\^FD' + nama + '^FS\n",' +
    '"^FT75,150^A0N,25,24^FH\^FD' + sid_desc + '^FS\n",' +
    '"^FT93,196^A0N,25,24^FH\^FD' + tgl + '^FS\n",' +
    '"^FT81,219^A0N,25,24^FH\^FD' + usia + '^FS\n",' +
    '"^PQ1,0,1,Y^XZ\n",' + ' ]; ' +
    ' qz.print(config, printData).catch(function(e) { console.error(e);}); ' +
    ' } ' + '  if (qz.websocket.isActive()) { printZPL' + fname +
    '(); }  else { qz.websocket.connect().then(function() { printZPL' + fname +
    '();});}  ';
  result := js;
end;

function printKuitansi(file_name: String): string;
var
  tmp: AnsiString;
  js, Data: string;
  inStream: TStream;
  outStream: TStream;
begin
  tmp := StringReplace(EncodeFile(file_name), sLineBreak, '"+'#10 + '"',
    [rfReplaceAll]);
  js := 'function print() { ' +
    ' var config = qz.configs.create("KUITANSIPRINTER", { size: {width: 148, height: 210 } , units: "mm" }); '
    + ' var data = [{ type: "pdf",format:"base64", data: "' + tmp + '" }]; ' +
    ' qz.print(config, data).catch(function(e) { console.error(e);}); ' + ' } '
    + '  if (qz.websocket.isActive()) {  print(); }  else { qz.websocket.connect().then(function() { print();});}  ';

  result := js;
end;

function printLabel(no_lab: string; nama: string; usia: string;
  tgl_lahir: string; alamat: string; tgl: string; hp: string; dokter: string;
  gender: string; zpl: string): string;
var
  js: string;
  zpl2: string;
begin
  // clean linebreak
  no_lab := StringReplace(no_lab, sLineBreak, ' ', [rfReplaceAll]);
  nama := StringReplace(nama, sLineBreak, ' ', [rfReplaceAll]);
  usia := StringReplace(usia, sLineBreak, ' ', [rfReplaceAll]);
  tgl_lahir := StringReplace(tgl_lahir, sLineBreak, ' ', [rfReplaceAll]);
  alamat := StringReplace(alamat, sLineBreak, ' ', [rfReplaceAll]);
  tgl := StringReplace(tgl, sLineBreak, ' ', [rfReplaceAll]);
  hp := StringReplace(hp, sLineBreak, ' ', [rfReplaceAll]);
  dokter := StringReplace(dokter, sLineBreak, ' ', [rfReplaceAll]);
  gender := StringReplace(gender, sLineBreak, ' ', [rfReplaceAll]);

  // clean quote
  no_lab := StringReplace(no_lab, '"', ' ', [rfReplaceAll]);
  nama := StringReplace(nama, '"', ' ', [rfReplaceAll]);
  usia := StringReplace(usia, '"', ' ', [rfReplaceAll]);
  tgl_lahir := StringReplace(tgl_lahir, '"', ' ', [rfReplaceAll]);
  alamat := StringReplace(alamat, '"', ' ', [rfReplaceAll]);
  tgl := StringReplace(tgl, '"', ' ', [rfReplaceAll]);
  hp := StringReplace(hp, '"', ' ', [rfReplaceAll]);
  dokter := StringReplace(dokter, '"', ' ', [rfReplaceAll]);
  gender := StringReplace(gender, '"', ' ', [rfReplaceAll]);

  // clean no ascii character
  alamat := StringReplace(alamat, 'á', ' ', [rfReplaceAll]);
  // clean new line
  alamat := StringReplace(alamat, sLineBreak, ' ', [rfReplaceAll]);

  //
  zpl2 := zpl;

  zpl2 := StringReplace(zpl2, '<no_lab>', no_lab, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<hp>', hp, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<dokter>', dokter, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<tgl>', tgl, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<alamat>', alamat, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<tgl_lahir>', tgl_lahir, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<usia>', usia, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<nama_pasien>', nama, [rfReplaceAll]);
  zpl2 := StringReplace(zpl2, '<gender>', gender, [rfReplaceAll]);

  js := 'function print_' + no_lab + '() { ' +
    ' var config = qz.configs.create("LABELPRINTER"); ' + ' var data = [' + zpl2
    + ']; ' + ' qz.print(config, data).catch(function(e) { console.error(e);}); '
    + ' } ' + '  if (qz.websocket.isActive()) {  print_' + no_lab +
    '(); }  else { qz.websocket.connect().then(function() { print_' + no_lab +
    '();});}  ';

  result := js;
end;

function printBarcode(sid: string; pid: string; nama: string;
  specimen: string): string;
var
  js: string;
  zpl2: string;
begin
  // clean linebreak
  sid := StringReplace(sid, sLineBreak, ' ', [rfReplaceAll]);
  pid := StringReplace(pid, sLineBreak, ' ', [rfReplaceAll]);
  nama := LeftStr(nama, 25);
  nama := StringReplace(nama, sLineBreak, ' ', [rfReplaceAll]);

  // clean quoted "
  sid := StringReplace(sid, '"', ' ', [rfReplaceAll]);
  pid := StringReplace(pid, '"', ' ', [rfReplaceAll]);
  nama := StringReplace(nama, '"', ' ', [rfReplaceAll]);

  zpl2 := '"^XA~TA000~JSN^LT0^MNW^MTT^PON^PMN^LH0,0^JMA^PR5,5~SD15^JUS^LRN^CI0^XZ\n",';
  zpl2 := zpl2 + '"^XA\n",';
  zpl2 := zpl2 + '"^MMT\n",';
  zpl2 := zpl2 + '"^PW400\n",';
  zpl2 := zpl2 + '"^LL0240\n",';
  zpl2 := zpl2 + '"^LS0\n",';
  zpl2 := zpl2 + '"^FT385,162^A0I,28,28^FH\^FDPID : ' + pid + '^FS\n",';
  zpl2 := zpl2 + '"^FT385,201^A0I,28,28^FH\^FD' + nama + '^FS\n",';
  zpl2 := zpl2 + '"^BY2,3,125^FT385,27^BCI,,Y,N\n",';
  zpl2 := zpl2 + '"^FD>:' + sid + '^FS\n",';
  zpl2 := zpl2 + '"^FT9,39^A0R,28,28^FH\^FD' + specimen + '^FS\n",';
  zpl2 := zpl2 + '"^PQ1,0,1,Y^XZ\n",';

  js := 'function print() { ' +
    ' var config = qz.configs.create("LABELPRINTER"); ' + ' var data = [' + zpl2
    + ']; ' + ' qz.print(config, data).catch(function(e) { console.error(e);}); '
    + ' } ' + '  if (qz.websocket.isActive()) {  print(); }  else { qz.websocket.connect().then(function() { print();});}  ';

  result := js;
end;

end.
