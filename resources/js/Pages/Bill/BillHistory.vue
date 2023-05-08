<template>
    <div>
        <master :user_name="user_name">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <BillMenuButton></BillMenuButton>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-4 col-lg-4 col-sm-12">
                    <div id="printArea" style="width: 100% !important">
                        <div class="bill" style="width: 100% !important">
                            <div class="receipt" style="background-color: white;">

                                <div class="mybill">
                                    <div class="brand" style="font-size: 16px;">
                                        LEVITATE Bar & Restaurant
                                    </div>
                                    <div class="address" style="font-size: 16px;">
                                        Yangon, Myanmar
                                    </div>
                                    <br>
                                </div>

                                <div>
                                    <span style="text-align: left; font-size: 16px;">
                                        {{ order_info.inv_no ?? '' }}
                                    </span>
                                    <br>
                                    <span style="text-align: left; font-size: 16px;">
                                        Date: {{ order_info.order_date_time }}
                                    </span>
                                    <br>
                                    <span style="text-align: right; font-size: 16px;">
                                        Table: {{ order_info.table_lists_table.table_name }}
                                    </span>
                                    <br>
                                    <span style="text-align: right; font-size: 16px;">
                                        Guest: {{ order_info.guest_no }}
                                    </span>
                                    <br>
                                    <span style="text-align: right; font-size: 16px;">
                                        Customer: {{ customer.name ?? '' }}
                                    </span>
                                </div>

                                <table class="table" style="width: 100%">
                                    <tr class="header">
                                        <th style="font-size: 16px; width: 50px; text-align: left;">
                                            Description
                                        </th>
                                        <th style="font-size: 16px; width: 20%; text-align: right;">
                                            Qty
                                        </th>
                                        <th style="font-size: 16px; width: 20%; text-align: right;">
                                            Price
                                        </th>
                                        <th style="font-size: 16px; width: 20%; text-align: right;">
                                            Amount
                                        </th>
                                    </tr>

                                    <tr v-for="order_item in order_info.order_items_table" :key="order_item.id">
                                        <td style="width: 250px; padding: 3px; font-size: 16px;">
                                            {{ order_item.menu_name }}
                                            <br>
                                            {{ order_item.remark }}
                                        </td>

                                        <td style="width: 20%; padding: 3px; text-align: right; font-size: 16px;">
                                            {{ order_item.qty }}
                                        </td>

                                        <td style="width: 20%; padding: 3px; text-align: right; font-size: 16px;">
                                            {{ order_item.price }}
                                        </td>

                                        <td style="width: 20%; padding: 3px; text-align: right; font-size: 16px;">
                                            {{ order_item.qty * order_item.price }}
                                        </td>
                                    </tr>
                                    <br>

                                    <!-- Total  -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Total
                                        </td>

                                        <td style="text-align: right;" colspan="2">
                                            {{ totalAmountCalc(order_info.order_items_table) }}
                                        </td>
                                    </tr>

                                    <!-- Tax  -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Tax (%)
                                        </td>
                                        <td style="text-align: right;" colspan="2">
                                            {{ bill_info.tax_amount }}%
                                        </td>
                                    </tr>

                                    <!-- Disc -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Disc
                                        </td>

                                        <td style="text-align: right;" colspan="2">
                                            {{ bill_info.discount }}%
                                        </td>
                                    </tr>

                                    <!-- Amount -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Disc Amount
                                        </td>

                                        <td style="text-align: right;" colspan="2">
                                            {{ bill_info.discount_amount }}
                                        </td>
                                    </tr>

                                    <!-- Service Charges % -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Service Charge
                                        </td>

                                        <td style="text-align: right;" colspan="2">
                                            {{ bill_info.service_charge }}%
                                        </td>
                                    </tr>

                                    <!-- Service Charges Amount -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Service Charge
                                        </td>

                                        <td style="text-align: right;" colspan="2">
                                            {{ bill_info.service_charge_amount }}
                                        </td>
                                    </tr>

                                        <!-- payment_type -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Pay Type
                                        </td>
                                        <td style="text-align: right;" colspan="2">
                                            {{ bill_info.payment_method_table.name }}
                                        </td>
                                    </tr>

                                    <!-- Net Amount  -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Net Amount
                                        </td>

                                        <td style="text-align: right;" colspan="2">
                                            {{ bill_info.net_amount }}
                                        </td>
                                    </tr>

                                        <!-- Received Amount -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Received Amount
                                        </td>

                                        <td style="text-align: right;" colspan="2">
                                            {{ bill_info.received_amount }}
                                        </td>
                                    </tr>

                                    <!-- Due Amount -->
                                    <tr class="">
                                        <td style="font-size: 16px;" colspan="2">
                                            Refund
                                        </td>

                                        <td style="text-align: right;" colspan="2">
                                            {{ bill_info.refund_amount }}
                                        </td>
                                    </tr>
                                        
                                </table>
                            </div>
                        </div>
                    </div>
                    <br>
                    <button @click="printInvoice()" type="button" class="btn btn-dark btn-lg" style="width: 90%;">
                        <i class="fa fa-print"></i>
                        Print
                    </button>
                </div>
            </div>
        </master>
    </div>
</template>

<script>
import Master from "../Layout/Master";
import BillMenuButton from "./components/BillMenuButton.vue";

export default {
    name: "BillHistory",
    components: {
        Master,
        BillMenuButton,
    },

    props: [
        'user_name',
        'login_time',
        'order_info',
        'bill_info',
        'customer',
    ],


    methods: {
        totalAmountCalc(order_items) {
            let sum = 0;
            order_items.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },

        printInvoice() {
            printJS({
                printable: "printArea",
                type: "html",
                css: [
                    "https://pos-sys.skgroupmm.com/pos/css/bill.css"
                ],
                scanStyles: false
            });
        },
    }
};
</script>
<style>
.billInput {
    width: 100%;
    border: none;
}
</style>