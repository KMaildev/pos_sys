<?php

namespace App\Helpers;

use Exception;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Mike42\Escpos\Printer;

class PrintHelper
{

    public static function kitchenPrinter($items, $user_name, $order_date_time, $table_no)
    {

        function buatBaris3Kolom($kolom2, $kolom3)
        {
            // Mengatur lebar setiap kolom (dalam satuan karakter)
            $lebar_kolom_2 = 20;
            $lebar_kolom_3 = 20;

            // Melakukan wordwrap(), jadi jika karakter teks melebihi lebar kolom, ditambahkan \n 
            $kolom2 = wordwrap($kolom2, $lebar_kolom_2, "\n", true);
            $kolom3 = wordwrap($kolom3, $lebar_kolom_3, "\n", true);

            // Merubah hasil wordwrap menjadi array, kolom yang memiliki 2 index array berarti memiliki 2 baris (kena wordwrap)
            $kolom2Array = explode("\n", $kolom2);
            $kolom3Array = explode("\n", $kolom3);

            // Mengambil jumlah baris terbanyak dari kolom-kolom untuk dijadikan titik akhir perulangan
            $jmlBarisTerbanyak = max(count($kolom2Array), count($kolom3Array));

            // Mendeklarasikan variabel untuk menampung kolom yang sudah di edit
            $hasilBaris = array();

            // Melakukan perulangan setiap baris (yang dibentuk wordwrap), untuk menggabungkan setiap kolom menjadi 1 baris 
            for ($i = 0; $i < $jmlBarisTerbanyak; $i++) {

                // memberikan rata kanan pada kolom 3 dan 4 karena akan kita gunakan untuk harga dan total harga
                $hasilKolom2 = str_pad((isset($kolom2Array[$i]) ? $kolom2Array[$i] : ""), $lebar_kolom_2, " ", STR_PAD_RIGHT);

                $hasilKolom3 = str_pad((isset($kolom3Array[$i]) ? $kolom3Array[$i] : ""), $lebar_kolom_3, " ", STR_PAD_LEFT);

                // Menggabungkan kolom tersebut menjadi 1 baris dan ditampung ke variabel hasil (ada 1 spasi disetiap kolom)
                $hasilBaris[] = $hasilKolom2 . " " . $hasilKolom3;
            }

            // Hasil yang berupa array, disatukan kembali menjadi string dan tambahkan \n disetiap barisnya.
            return implode($hasilBaris) . "\n";
        }


        $host_name = gethostname();
        $printer_name = 'POS-80';
        $itemTotal = [];

        foreach ($items as $key => $value) {
            if ($value['printer_name'] == $printer_name) {
                $itemTotal[] = $key;
            }
        }
        $item_total = array_sum($itemTotal);

        if ($item_total != 0) {
            try {
                // $connector = new FilePrintConnector("php://stdout");
                // $connector = new WindowsPrintConnector("192.168.100.8", 9200);
                // $connector = new WindowsPrintConnector("Canon-G2000-series-Printer");
                $connector = new WindowsPrintConnector($printer_name);
                // $connector = new WindowsPrintConnector("smb://DESKTOP-IP9SO9N/POS-80");
                // $connector = new WindowsPrintConnector('smb://' . $host_name . '/' . $printer_name);

                $printer = new Printer($connector);
                $printer->text('Waiter: ' . $user_name);
                $printer->feed();
                $printer->text('Time: ' . $order_date_time);
                $printer->feed();
                $printer->text('Table: ' . $table_no);
                $printer->feed();
                $printer->text('==============================================');
                $printer->feed();

                foreach ($items as $key => $value) {
                    if ($value['printer_name'] == $printer_name) {
                        $printer->text(buatBaris3Kolom($value['menu_name'], $value['qty']));
                        $printer->feed();
                    }
                }

                $printer->feed(4);
                $printer->cut();
                $printer->close();
            } catch (Exception $e) {
                echo "Couldn't print to this printer: " . $e->getMessage() . "\n";
            }
        }
    }



    public static function barPrinter($items)
    {
        $host_name = gethostname();
        $printer_name = 'POS-81';
        $itemTotal = [];

        foreach ($items as $key => $value) {
            if ($value['printer_name'] == $printer_name) {
                $itemTotal[] = $key;
            }
        }
        $item_total = array_sum($itemTotal);

        if ($item_total != 0) {
            try {
                $connector = new WindowsPrintConnector($printer_name);
                $printer = new Printer($connector);
                foreach ($items as $key => $value) {
                    if ($value['printer_name'] == $printer_name) {
                        $printer->text($value['menu_name'] . "\n");
                        $printer->text($value['qty'] . "\n");
                    }
                }

                $printer->cut();
                $printer->close();
            } catch (Exception $e) {
                echo "Couldn't print to this printer: " . $e->getMessage() . "\n";
            }
        }
    }
}
