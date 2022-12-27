<?php

namespace App\Http\Controllers\Purchase;

use App\Http\Controllers\Controller;
use App\Models\VariablePurchaseItem;
use Illuminate\Http\Request;

class VariablePurchaseItemController extends Controller
{
    public function destroy($id)
    {
        $fixed_purchase = VariablePurchaseItem::findOrFail($id);
        $fixed_purchase->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }

    public function delete($id)
    {
        $fixed_purchase = VariablePurchaseItem::findOrFail($id);
        $fixed_purchase->delete();
        return redirect()->back()->with('success', 'Your processing has been completed.');
    }
}
