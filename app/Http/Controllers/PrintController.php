<?php

namespace App\Http\Controllers;

use Exception;
use Mike42\Escpos\Printer;
use Mike42\Escpos\PrintConnectors\FilePrintConnector;
use Illuminate\Http\Request;
use Mike42\Escpos\PrintConnectors\NetworkPrintConnector;
use Mike42\Escpos\PrintConnectors\WindowsPrintConnector;

class PrintController extends Controller
{
    public function printReceipt(Request $request)
    {
        // Get the input data from the request
        $data = $request->all();
        $host_name = gethostname();
        $printer_name = 'POS-80';

        try {
			// $connector = new FilePrintConnector("php://stdout");
            // $connector = new WindowsPrintConnector("192.168.100.8", 9200);
            // $connector = new WindowsPrintConnector("Canon-G2000-series-Printer");
            // $connector = new WindowsPrintConnector("POS-80");
            // $connector = new WindowsPrintConnector("smb://DESKTOP-IP9SO9N/POS-80");
            $connector = new WindowsPrintConnector('smb://'.$host_name.'/'.$printer_name);

            $printer = new Printer($connector);
            $printer->text("Hello World Printer Test!\n");
            $printer->cut();
            $printer->close();
		} catch (Exception $e) {
			echo "Couldn't print to this printer: " . $e -> getMessage() . "\n";
		}
        
    }
}
