<template>
    <div>
        <master :user_name="user_name">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <BillMenuButton></BillMenuButton>
                </div>
            </div>

            <div class="col-md-3 col-lg-3 col-sm-12">
                <form @submit.prevent="submitPayment">
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
                                            {{ order_infos.inv_no ?? '' }}
                                        </span>

                                        <span style="text-align: right; font-size: 12px;">
                                            Order: {{ order_infos.order_no ?? '' }}
                                        </span>
                                    </div>

                                    <div class="d-flex justify-content-between">
                                        <span style="text-align: left; font-size: 12px;">
                                            Date: {{ order_infos.order_date_time }}
                                        </span>

                                        <span style="text-align: right; font-size: 12px;">
                                            Table: {{ order_infos.table_lists_table.table_name }}
                                        </span>
                                    </div>

                                    <div class="d-flex justify-content-between">
                                        <span style="text-align: left; font-size: 12px;">
                                            Customer:
                                            <select
                                                style="text-align: right; background-color: white;  border: none; text-overflow: ''; -webkit-appearance: none;"
                                                v-model="form.customer">
                                                <option value="">Customer</option>
                                                <option :value="customer.id" v-for="customer in customers"
                                                    :key="customer.id">
                                                    {{ customer.name }}
                                                </option>
                                            </select>
                                        </span>

                                        <span style="text-align: right; font-size: 12px;">
                                            Guest: {{ order_infos.guest_no }}
                                        </span>
                                    </div>
                                    <br>

                                    <table class="table" style="width: 100%">
                                        <tr class="header">
                                            <th style="font-size: 12px; width: 50px; text-align: left;">
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

                                        <tr v-for="order_item in order_infos.order_items_table" :key="order_item.id">
                                            <td style="width: 250px; padding: 3px; font-size: 12px;">
                                                {{ order_item.menu_name }}
                                                <br>
                                                {{ order_item.remark }}
                                            </td>

                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                                {{ order_item.qty }}
                                            </td>

                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                                {{ order_item.price }}
                                            </td>

                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 12px;">
                                                {{ order_item.qty * order_item.price }}
                                            </td>
                                        </tr>

                                        <br>

                                        <!-- Total  -->
                                        <tr class="">
                                            <td style="font-size: 12px;" colspan="2">
                                                Total
                                            </td>

                                            <td colspan="2">
                                                <input type="text" class="billInput"
                                                    :value="totalAmountCalc(order_infos.order_items_table)"
                                                    style="text-align: right; width: 100%;">
                                            </td>
                                        </tr>

                                        <!-- Tax  -->
                                        <tr class="">
                                            <td style="font-size: 12px;" colspan="2">
                                                Tax
                                            </td>
                                            <td style="text-align: right;" colspan="2">
                                                <select
                                                    style="text-align: right; background-color: white;  border: none; text-overflow: ''; -webkit-appearance: none;"
                                                    v-model="form.taxrate" @change="netAmount()">
                                                    <option value="0">0</option>
                                                    <option :value="taxrate.taxrate" v-for="taxrate in taxrates"
                                                        :key="taxrate.id">
                                                        {{ taxrate.name }}
                                                    </option>
                                                </select>
                                            </td>
                                        </tr>

                                        <!-- Disc -->
                                        <tr class="">
                                            <td style="font-size: 12px;" colspan="2">
                                                Disc
                                            </td>

                                            <td colspan="2">
                                                <input type="text" class="billInput" value="0"
                                                    style="text-align: right; width: 100%;" v-model="form.disc"
                                                    @change="netAmount()">
                                            </td>
                                        </tr>

                                        <!-- payment_type -->
                                        <tr class="">
                                            <td style="font-size: 12px;" colspan="2">
                                                Pay Type
                                            </td>
                                            <td style="text-align: right;" colspan="2">
                                                <select class="billInput"
                                                    style="text-align: right; background-color: white;  border: none; text-overflow: ''; -webkit-appearance: none;"
                                                    v-model="form.payment_method_id">
                                                    <option :value="payment_method.id"
                                                        v-for="payment_method in payment_methods"
                                                        :key="payment_method.id">
                                                        {{ payment_method.name }}
                                                    </option>
                                                </select>
                                            </td>
                                        </tr>


                                        <!-- Net Amount  -->
                                        <tr class="">
                                            <td style="font-size: 12px;" colspan="2">
                                                Net Amount
                                            </td>

                                            <td colspan="2">
                                                <input type="text" class="billInput" :value="netAmount()"
                                                    style="text-align: right; width: 100%;">
                                            </td>
                                        </tr>

                                        <!-- Received Amount -->
                                        <tr class="">
                                            <td style="font-size: 12px;" colspan="2">
                                                Received Amount
                                            </td>

                                            <td colspan="2">
                                                <input type="text" class="billInput"
                                                    style="text-align: right; width: 100%;" @change="ReceivedAmount()"
                                                    v-model="form.received_amount">
                                            </td>
                                        </tr>

                                        <!-- Due Amount -->
                                        <tr class="">
                                            <td style="font-size: 12px;" colspan="2">
                                                Refund
                                            </td>

                                            <td colspan="2">
                                                <input type="text" class="billInput"
                                                    style="text-align: right; width: 100%;" :value="ReceivedAmount()">
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
                    <center>
                        <button type="submit" class="btn btn-dark btn-lg" style="width: 100%;">
                            <i class="fa fa-print"></i>
                            Payment & Print
                        </button>
                    </center>
                </form>
            </div>
        </master>
    </div>
</template>

<script>
import Master from "../Layout/Master";
import BillMenuButton from "./components/BillMenuButton.vue";

export default {
    name: "BillPayment",
    components: {
        Master,
        BillMenuButton,
    },

    props: [
        'user_name',
        'login_time',
        'order_infos',
        'customers',
        'payment_methods',
        'taxrates',
    ],


    data() {
        return {
            form: {
                customer: null,
                taxrate: 0,
                disc: 0,
                payment_method_id: 0,
                order_info_id: this.order_infos.id,
                totalNetAmount: 0,
                received_amount: 0,
                dueAmount: 0,
            },
        }
    },

    methods: {
        totalAmountCalc(order_items) {
            let sum = 0;
            order_items.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },


        netAmount() {
            let sum = 0;
            this.order_infos.order_items_table.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });

            var totalAmount = sum;
            var taxrate = this.form.taxrate;
            var disc = this.form.disc;

            var totalTaxNetAmount = totalAmount * taxrate / 100;
            var totalDiscNetAmount = totalAmount * disc / 100;
            var netAmount = totalAmount - (totalTaxNetAmount + totalDiscNetAmount);
            this.form.totalNetAmount = netAmount;
            return netAmount;
        },

        ReceivedAmount() {
            var net_amount = this.form.totalNetAmount;
            var received_amount = this.form.received_amount;
            var due_amount = net_amount - received_amount;
            this.form.dueAmount = due_amount;
            return due_amount;
        },

        submitPayment() {
            this.$inertia.post('/pos_submit_payment', this.form);
            this.printInvoice();
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