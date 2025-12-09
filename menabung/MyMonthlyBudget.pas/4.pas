program MyMonthlyBudget;
uses crt;

type
    TTransaksi = record
        tanggal, kategori, jenis: string;
        jumlah: longint;
end;

var 
    data: array[1..100] of TTransaksi;
    i, pil, op: integer;
    budgetBulanan: longint;

{-------  FUNCTION --------}
function TotalPemasukan: longint;
var
    x: integer;
    total: longint;
begin
    total := 0;

    for x := 1 to i do 
    begin
        if data[x].jenis = 'Pemasukan' then
            total := total + data[x].jumlah;
    end;

    TotalPemasukan := total;
end;

function TotalPengeluaran: longint;
var
    x: integer;
    total: longint;
begin
    total := 0;

    for x := 1 to i do 
    begin
        if data[x].jenis = 'Pengeluaran' then
            total := total + data[x].jumlah;
    end;

    TotalPengeluaran := total;
end;

function SaldoAkhir: longint;
var
    saldo: longint;
begin
    saldo := TotalPemasukan - TotalPengeluaran;
    SaldoAkhir := saldo;  // WAJIB
end;

{------ PROCEDURE --------}
procedure Menu;
begin
    writeln('1. Tambah Transaksi');
    writeln('2. Tampilkan Transaksi Bulan Ini');
    writeln('3. Lihat Total Pemasukan');
    writeln('4. Lihat Total Pengeluaran');
    writeln('5. Lihat Saldo');
    writeln('6. Keluar');
end;

procedure TambahTransaksi;
var 
    pil: integer;

begin
    i := i + 1;
    with data[i] do 
    begin
        write('Masukkan tanggal (dd/mm/yy): ');
        readln(tanggal);

        write('Jenis Transaksi (1:Pemasukan, 2:Pengeluaran): ');
        readln(pil);
        if (pil = 1) then
            begin
            jenis := 'Pemasukan'
            end
        else
            begin
            jenis := 'Pengeluaran';
        end;

        write('Masukkan Kategori: ');
        readln(kategori);
        write('Masukkan jumlah uang: ');
        readln(jumlah);

    end;
    writeln('Data berhasil ditambahkan!');

end;        

procedure TampilkanTransaksi;
var
    x: integer;
begin
    if i = 0 then
    begin
        writeln('Belum ada transaksi.');
        exit;
    end;

    writeln('===================================================================');
    writeln('| No |   Tanggal   |    Jenis     |     Kategori     |   Jumlah   |');
    writeln('===================================================================');

    for x := 1 to i do
    begin
        with data[x] do
        begin
            writeln('| ',
                x:2, ' | ',
                tanggal:11, ' | ',
                jenis:12, ' | ',
                kategori:15, ' | ',
                jumlah:10, ' |');
        end;
    end;

    writeln('===================================================================');
end;

{-------------            MAIN PROGRAM              -------------}
begin
    clrscr;
    i := 0;
    writeln('--------------------------------------------------');
    writeln('Hi! Welcome to MyMonthly Budget, what can i help?');
    writeln('--------------------------------------------------');
    write('Masukkan budget bulanan kamu: ');
    readln(budgetBulanan);
    clrscr;

repeat 
    Menu;
    write('Pilih menu (1-6): ');
    readln(op);

    case op of
    1 : // Tambah Transaksi
        begin
            clrscr;
            TambahTransaksi;
        end;

    2 : // Tampilkan Transaksi
        begin
            clrscr;
            TampilkanTransaksi;
        end;
    3 : // Tampilkan Pemasukan
        begin
            clrscr;
            writeln('  =================================== ');
            writeln('   Total Pemasukan: ', TotalPemasukan  );
            writeln('  =================================== ');
        end;
    4 : // Tampilkan Pengeluaran
        begin
            clrscr;
            writeln('  ======================================= ');
            writeln('   Total Pengeluaran: ', TotalPengeluaran  );
            writeln('  ======================================= ');
        end;
    5 : // Saldo Akhir
    begin 
        clrscr;
        writeln('===============================');
        writeln('Saldo Akhir Kamu: ', SaldoAkhir  );
        writeln('-------------------------------');

        if (TotalPengeluaran > budgetBulanan) then
        begin
            writeln('Kamu sudah melebihi budget!');
        end;

        writeln('================================');
    end;

    6 : // keluar
        begin
            clrscr;
            writeln('Thank you! semoga dompet mu selalu sehat dan saldo tetap aman!  ');
        end;
    end;

if op <> 6 then
    begin
        writeln;
        writeln('Tekan ENTER untuk kembali ke menu...');
        readln; 
        clrscr;
    end;
until op = 6;

end.