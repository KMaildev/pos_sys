<?php

namespace App\Helpers;

use Exception;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;
use Mike42\Escpos\Printer;

class PrintHelper
{

    public static function kitchenPrinter($items)
    {
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
