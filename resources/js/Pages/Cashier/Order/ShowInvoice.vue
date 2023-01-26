<template>
    <div>
        <CashierMaster :user_name="user_name" :login_time="login_time">
            <TopLink></TopLink>

            <div class="container-fluid">
                <div class="row py-4">

                    <!-- Preview Bill -->
                    <div class="col-md-3">
                        <h4 style="text-align: center;">
                            Preview Bill
                        </h4>
                        <form @submit.prevent="previewPayment">
                            <div class="receipt" style="background-color: white; width: 100%;">

                                <div class="mybill">
                                    <div class="brand" style="font-size: 12px;">
                                        LEVITATE Bar & Restaurant
                                    </div>
                                    <div class="address" style="font-size: 12px;">
                                        Yangon, Myanmar
                                        <br> Phone No- 0192083910
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <div style="font-size: 12px;">
                                        Invoice:
                                        {{ show_order_info.inv_no ?? '-' }}
                                    </div>
                                    <div style="font-size: 12px;">
                                        Order No:
                                        {{ show_order_info.order_no ?? '-' }}
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <div style="font-size: 12px;">
                                        Date:
                                        {{ show_order_info.order_date_time ?? '-' }}
                                    </div>
                                    <div style="font-size: 12px;">
                                        Table:
                                        {{ show_order_info.table_lists_table.table_name ?? '-' }}
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <div style="font-size: 12px;">
                                        Customer:
                                    </div>

                                    <div style="font-size: 12px;">
                                        Guest:
                                        {{ show_order_info.guest_no ?? '-' }}
                                    </div>
                                </div>

                                <br>
                                <table class="table" style="width: 100%">
                                    <tr class="header">
                                        <th style="font-size: 12px; width: 60px;">
                                            Description
                                        </th>
                                        <th style="font-size: 12px; width: 20%; text-align: right;">
                                            Qty
                                        </th>
                                        <th style="font-size: 12px; width: 20%; text-align: right;">
                                            Price
                                        </th>
                                        <th style="font-size: 12px; width: 20%; text-align: right;">
                                            Amount
                                        </th>
                                    </tr>

                                    <tr v-for="order_item in order_items" :key="order_item.id">

                                        <td style="width: 250px; padding: 3px; font-size: 12px;">
                                            {{ order_item.menu_lists_table.menu_name }}
                                        </td>

                                        <td style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                            {{ order_item.qty }}
                                        </td>

                                        <td style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                            {{ order_item.price }}
                                        </td>

                                        <td style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                            {{ amountCalc(order_item) }}
                                        </td>

                                    </tr>

                                    <br>
                                    <!-- Total  -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Total
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" :value="totalAmountCalc(order_items)" class="billInput"
                                                readonly>
                                        </td>
                                    </tr>

                                    <!-- Tax  -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Tax
                                        </td>
                                        <td>
                                            <select class="form-control" v-model="form.tax"
                                                @change="calculateTax($event)">
                                                <option :value="taxrate.taxrate" v-for="taxrate in taxrates"
                                                    :key="taxrate.id">
                                                    {{ taxrate.name }}
                                                </option>
                                            </select>
                                        </td>
                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" :value="taxAmount">
                                        </td>
                                    </tr>

                                    <!-- Disc -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Disc
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.disc">
                                        </td>
                                    </tr>

                                    <!-- Services Charges -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Service Charges
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.service_charges">
                                        </td>
                                    </tr>

                                    <!-- Net Amount  -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Net Amount
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>
                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.net_amount">
                                        </td>
                                    </tr>

                                    <!-- Received -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Total Amount
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>
                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.received_amount">
                                        </td>
                                    </tr>

                                    <!-- payment_type -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Pay Type
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <select class="form-control" v-model="form.payment_type">
                                                <option value="CashDown">CashDown</option>
                                                <option value="KPay">KPay</option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>

                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-success btn-lg">
                                        <i class="fa fa-credit-card"></i>
                                        Preview
                                    </button>
                                </div>

                            </div>
                        </form>
                    </div>

                    <!-- Print Area  -->
                    <div class="col-md-3">
                        <h4 style="text-align: center;">
                            Print Bill
                        </h4>
                        <div id="printArea">
                            <center>
                                <div class="bill">
                                    <div class="receipt" style="background-color: white;">

                                        <div class="mybill">
                                            <div class="brand" style="font-size: 12px;">
                                                LEVITATE Bar & Restaurant
                                            </div>
                                            <div class="address" style="font-size: 12px;">
                                                Yangon, Myanmar
                                                <br> Phone No- 0192083910
                                            </div>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <span style="text-align: left; font-size: 12px;">
                                                {{ show_order_info.inv_no ?? '' }}
                                            </span>

                                            <span style="text-align: right; font-size: 12px;">
                                                Order: {{ show_order_info.order_no ?? '' }}
                                            </span>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <span style="text-align: left; font-size: 12px;">
                                                Date: {{ show_order_info.order_date_time ?? '' }}
                                            </span>

                                            <span style="text-align: right; font-size: 12px;">
                                                Table: {{ show_order_info.table_lists_table.table_name ?? '' }}
                                            </span>
                                        </div>

                                        <div class="d-flex justify-content-between">
                                            <span style="text-align: left; font-size: 12px;">
                                                Customer:
                                            </span>

                                            <span style="text-align: right; font-size: 12px;">

                                                Guest: {{ show_order_info.guest_no ?? '-' }}
                                            </span>
                                        </div>
                                        <br>

                                        <table class="table" style="width: 100%">
                                            <tr class="header">
                                                <th style="font-size: 12px; width: 50px;">
                                                    Description
                                                </th>
                                                <th style="font-size: 12px; width: 20%; text-align: right;">
                                                    Qty
                                                </th>
                                                <th style="font-size: 12px; width: 20%; text-align: right;">
                                                    Price
                                                </th>
                                                <th style="font-size: 12px; width: 20%; text-align: right;">
                                                    Amount
                                                </th>
                                            </tr>

                                            <tr v-for="order_item in order_items" :key="order_item.id">

                                                <td style="width: 250px; padding: 3px; font-size: 12px;">
                                                    {{ order_item.menu_lists_table.menu_name }}
                                                </td>

                                                <td
                                                    style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                                    {{ order_item.qty }}
                                                </td>

                                                <td
                                                    style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                                    {{ order_item.price }}
                                                </td>

                                                <td
                                                    style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                                    {{ amountCalc(order_item) }}
                                                </td>

                                            </tr>

                                            <br>
                                            <!-- Total  -->
                                            <tr class="">
                                                <td style="font-size: 12px;" colspan="2">
                                                    Total
                                                </td>
                                                <td style="text-align: center font-size: 1px;"></td>

                                                <td style="text-align: right;">
                                                    {{ totalAmountCalc(order_items) }}
                                                </td>
                                            </tr>

                                            <!-- Tax  -->
                                            <tr class="">
                                                <td style="font-size: 12px;" colspan="2">
                                                    Tax
                                                </td>
                                                <td style="text-align: center font-size: 1px;"></td>

                                                <td style="text-align: right;">
                                                    {{ form.tax }}
                                                </td>
                                            </tr>

                                            <!-- Disc -->
                                            <tr class="">
                                                <td style="font-size: 12px;" colspan="2">
                                                    Disc
                                                </td>
                                                <td style="text-align: center font-size: 1px;"></td>

                                                <td style="text-align: right;">
                                                    {{ form.disc }}
                                                </td>
                                            </tr>

                                            <!-- Services Charges -->
                                            <tr class="">
                                                <td style="font-size: 12px;" colspan="2">
                                                    Service Charges
                                                </td>
                                                <td style="text-align: center font-size: 1px;"></td>

                                                <td style="text-align: right;">
                                                    {{ form.service_charges }}
                                                </td>
                                            </tr>

                                            <!-- Net Amount  -->
                                            <tr class="">
                                                <td style="font-size: 12px;" colspan="2">
                                                    Net Amount
                                                </td>
                                                <td style="text-align: center font-size: 1px;"></td>

                                                <td style="text-align: right;">
                                                    {{ form.net_amount }}
                                                </td>
                                            </tr>

                                            <!-- Received -->
                                            <tr class="">
                                                <td style="font-size: 12px;" colspan="2">
                                                    Total Amount
                                                </td>
                                                <td style="text-align: center font-size: 1px;"></td>

                                                <td style="text-align: right;">
                                                    {{ form.received_amount }}
                                                </td>
                                            </tr>

                                            <!-- payment_type -->
                                            <tr class="">
                                                <td style="font-size: 12px;" colspan="2">
                                                    Pay Type
                                                </td>
                                                <td style="text-align: center font-size: 1px;"></td>

                                                <td style="text-align: right;">
                                                    {{ form.payment_type }}
                                                </td>
                                            </tr>
                                        </table>

                                        <p style="text-align: center">
                                            ** Thank You ** <br>
                                            Please visit again
                                        </p>

                                    </div>
                                </div>
                            </center>
                        </div>
                        <br>
                        <div class="d-grid gap-1">
                            <button @click="printInvoice()" type="button" class="btn btn-warning btn-lg">
                                <i class="fa fa-print"></i>
                                Print
                            </button>
                        </div>
                    </div>

                    <!-- Payment Confirm  -->
                    <div class="col-md-3">
                        <h4 style="text-align: center;">
                            Submit Payment
                        </h4>
                        <form @submit.prevent="submitPayment">
                            <div class="receipt" style="background-color: white; width: 100%;">

                                <div class="mybill">
                                    <div class="brand" style="font-size: 12px;">
                                        LEVITATE Bar & Restaurant
                                    </div>
                                    <div class="address" style="font-size: 12px;">
                                        Yangon, Myanmar
                                        <br> Phone No- 0192083910
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <div style="font-size: 12px;">
                                        Invoice:
                                        {{ show_order_info.inv_no ?? '-' }}
                                    </div>
                                    <div style="font-size: 12px;">
                                        Order No:
                                        {{ show_order_info.order_no ?? '-' }}
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <div style="font-size: 12px;">
                                        Date:
                                        {{ show_order_info.order_date_time ?? '-' }}
                                    </div>
                                    <div style="font-size: 12px;">
                                        Table:
                                        {{ show_order_info.table_lists_table.table_name ?? '-' }}
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <div style="font-size: 12px;">
                                        Customer: {{ form.customer }}
                                    </div>

                                    <div style="font-size: 12px;">
                                        Guest:
                                        {{ show_order_info.guest_no ?? '-' }}
                                    </div>
                                </div>

                                <br>
                                <table class="table" style="width: 100%">
                                    <tr class="header">
                                        <th style="font-size: 12px; width: 60px;">
                                            Description
                                        </th>
                                        <th style="font-size: 12px; width: 20%; text-align: right;">
                                            Qty
                                        </th>
                                        <th style="font-size: 12px; width: 20%; text-align: right;">
                                            Price
                                        </th>
                                        <th style="font-size: 12px; width: 20%; text-align: right;">
                                            Amount
                                        </th>
                                    </tr>

                                    <tr v-for="order_item in order_items" :key="order_item.id">

                                        <td style="width: 250px; padding: 3px; font-size: 12px;">
                                            {{ order_item.menu_lists_table.menu_name }}
                                        </td>

                                        <td style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                            {{ order_item.qty }}
                                        </td>

                                        <td style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                            {{ order_item.price }}
                                        </td>

                                        <td style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                            {{ amountCalc(order_item) }}
                                        </td>

                                    </tr>

                                    <br>
                                    <!-- Total  -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Total
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" :value="totalAmountCalc(order_items)" class="billInput"
                                                readonly>
                                        </td>
                                    </tr>

                                    <!-- Tax  -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Tax
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.tax">
                                        </td>
                                    </tr>

                                    <!-- Disc -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Disc
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.disc">
                                        </td>
                                    </tr>

                                    <!-- Services Charges -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Service Charges
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.service_charges">
                                        </td>
                                    </tr>

                                    <!-- Net Amount  -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Net Amount
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.net_amount">
                                        </td>
                                    </tr>

                                    <!-- Received -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Total Amount
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <input type="text" class="billInput" v-model="form.received_amount">
                                        </td>
                                    </tr>

                                    <!-- payment_type -->
                                    <tr class="">
                                        <td style="font-size: 12px;" colspan="2">
                                            Pay Type
                                        </td>
                                        <td style="text-align: center font-size: 12px;"></td>

                                        <td style="text-align: right;">
                                            <select class="form-control" v-model="form.payment_type">
                                                <option :value="payment_method.name"
                                                    v-for="payment_method in payment_methods" :key="payment_method.id">
                                                    {{ payment_method.name }}
                                                </option>
                                            </select>
                                        </td>
                                    </tr>
                                </table>

                                <div class="d-grid gap-2">
                                    <button type="submit" class="btn btn-success btn-lg">
                                        <i class="fa fa-credit-card"></i>
                                        Submit Payment
                                    </button>
                                </div>

                            </div>
                        </form>
                    </div>


                    <div class="col-md-3">
                        <h4 style="text-align: center;">
                            Customer Information
                        </h4>

                        {{ customers.customer_id }}

                        <select class="form-control" v-model="customers.customer_id">
                            <option value="">
                                Please Select Customer
                            </option>
                            <option :value="customer.name" v-for="customer in customers" :key="customer.id">
                                {{ customer.customer_id }}
                                @
                                {{ customer.name }}
                            </option>
                        </select>
                    </div>

                </div>
            </div>
        </CashierMaster>
    </div>
</template>
<script>

import CashierMaster from "../../Layout/CashierMaster.vue";
import TopLink from "../Shared/TopLink.vue";


export default {
    components: {
        CashierMaster,
        TopLink,
    },
    name: "ShowInvoice",

    props: [
        'user_name',
        'login_time',

        'show_order_info',
        'order_items',
        'bill_infos',
        'customers',
        'payment_methods',
        'taxrates',
    ],

    data() {
        return {
            customers: {
                customer_id: this.customers.id,
            },

            form: {
                customer: this.show_order_info.name,
                tax: this.show_order_info.tax_amount,
                disc: this.show_order_info.discount,
                service_charges: this.show_order_info.service_charges,
                net_amount: this.show_order_info.net_amount,
                received_amount: this.show_order_info.received_amount,
                change_amount: this.show_order_info.change_amount,
                payment_type: this.show_order_info.payment_type,
                show_order_info: this.show_order_info.id,
            },

            tax_amount_value: 0,
            taxAmount: 0,
        }
    },

    methods: {
        amountCalc(order_item) {
            return order_item.price * order_item.qty;
        },

        totalAmountCalc(order_items) {
            let sum = 0;
            order_items.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },

        previewPayment() {
            this.$inertia.post('/preview_payment', this.form);
        },

        submitPayment() {
            this.$inertia.post('/submit_payment', this.form);
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

        calcTotalAmount() {
            var order_items = this.order_items;
            let sum = 0;
            order_items.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },

        calculateTax(e) {
            let cartValue = this.calcTotalAmount();
            var taxRate = e.target.value;
            this.taxAmount = cartValue * (taxRate / 100);
        }
    },

}
</script>
<style>
.ScrollStyle1 {
    max-height: 1000px;
    overflow-y: scroll;
}

.billInput {
    width: 90px;
    height: 30px;
    text-align: right;
    border-radius: 4px;
}
</style>