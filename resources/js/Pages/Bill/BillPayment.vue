<template>
    <div>
        <master :user_name="user_name">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <BillMenuButton></BillMenuButton>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <button class="report_button_sub_cashier" @click="showCombineBill(order_infos.id)">
                        Add Combine Bill
                    </button>
                </div>
            </div>

            <div class="row">
                <!-- Form Here  -->
                <div class="col-md-4 col-lg-4 col-sm-12 row d-flex justify-content-evenly">
                    <form @submit.prevent="submitPayment">
                        <div id="printArea" style="width: 100% !important">
                            <div class="bill" style="width: 100% !important">
                                <div class="receipt" style="background-color: white;">

                                    <div class="mybill">
                                        <div class="brand" style="font-size: 13px;">
                                            LEVITATE Bar & Restaurant
                                        </div>
                                        <div class="address" style="font-size: 13px;">
                                            Yangon, Myanmar
                                        </div>
                                        <br>
                                    </div>

                                    <div>
                                        <span style="text-align: left; font-size: 13px;">
                                            {{ order_infos.inv_no ?? '' }}
                                        </span>
                                        <br>
                                        <span style="text-align: left; font-size: 13px;">
                                            Date: {{ order_infos.order_date_time }}
                                        </span>
                                        <br>
                                        <span style="text-align: right; font-size: 13px;">
                                            Table: {{ order_infos.table_lists_table.table_name }}
                                        </span>
                                        <br>
                                        <span style="text-align: right; font-size: 13px;">
                                            Guest: {{ order_infos.guest_no }}
                                        </span>
                                    </div>

                                    <div class="d-flex justify-content-between">
                                        <span style="text-align: left; font-size: 13px;">
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
                                    </div>
                                    <br>

                                    <table class="table" style="width: 100%">
                                        <tr class="header">
                                            <th style="font-size: 13px; width: 50px; text-align: left;">
                                                Description
                                            </th>
                                            <th style="font-size: 13px; width: 20%; text-align: right;">
                                                Qty
                                            </th>
                                            <th style="font-size: 13px; width: 20%; text-align: right;">
                                                Price
                                            </th>
                                            <th style="font-size: 13px; width: 20%; text-align: right;">
                                                Amount
                                            </th>
                                        </tr>

                                        <tr v-for="order_item in order_infos.order_items_table" :key="order_item.id">
                                            <td style="width: 250px; padding: 3px; font-size: 13px;">
                                                {{ order_item.menu_name }}
                                                <br>
                                                {{ order_item.remark }}
                                            </td>

                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                {{ order_item.qty }}
                                            </td>

                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                {{ order_item.price }}
                                            </td>

                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
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
                                                <input readonly type="text" class="billInput"
                                                    :value="totalAmountCalc(order_infos.order_items_table)"
                                                    style="text-align: right; width: 100%;">
                                            </td>
                                        </tr>

                                        <!-- Tax  -->
                                        <tr class="">
                                            <td style="font-size: 12px;">
                                                Tax (%)
                                            </td>

                                            <td style="text-align: right;" colspan="2">
                                                <select class="select-style" v-model="form.taxrate" @change="netAmount()">
                                                    <option value="0">0%</option>
                                                    <option :value="taxrate.taxrate" v-for="taxrate in taxrates"
                                                        :key="taxrate.id"
                                                        :selected="taxrate.taxrate == bill_info.tax_amount">
                                                        {{ taxrate.name }}
                                                    </option>
                                                </select>
                                            </td>

                                            <td style="text-align: right; width: 100%;">
                                                <input readonly type="text" class="billInput" v-model="taxAmount"
                                                    style="text-align: right; width: 100%;">
                                            </td>
                                        </tr>

                                        <!-- Disc -->
                                        <tr class="">
                                            <td style="font-size: 12px;">
                                                Disc
                                            </td>

                                            <td style="text-align: right;" colspan="2">
                                                <select
                                                    style="text-align: right; background-color: white;  border: none; text-overflow: ''; -webkit-appearance: none;"
                                                    v-model="form.disc" @change="netAmount()">
                                                    <option :value="discount.rate" v-for="discount in discounts"
                                                        :key="discount.id">
                                                        {{ discount.name }}
                                                    </option>
                                                </select>
                                            </td>

                                            <td style="text-align: right; width: 100%;">
                                                <input readonly type="text" class="billInput" v-model="DiscountAmount"
                                                    style="text-align: right; width: 100%;">
                                            </td>
                                        </tr>

                                        <!-- Amount -->
                                        <tr class="">
                                            <td style="font-size: 12px; width: 100%;">
                                                Disc Amount
                                            </td>

                                            <td style="text-align: right;" colspan="2">
                                                <input type="text" class="billInput" value="0"
                                                    style="text-align: right; width: 100%;" v-model="form.disc_amount"
                                                    @change="netAmount()">
                                            </td>

                                            <td style="text-align: right; width: 100%;">
                                                <span class="billInput">
                                                    {{ DiscountAmountToPercent }}%
                                                </span>
                                            </td>
                                        </tr>


                                        <!-- Service Charges % -->
                                        <tr class="">
                                            <td style="font-size: 12px;">
                                                Service Charge
                                            </td>

                                            <td style="text-align: right;" colspan="2">
                                                <select
                                                    style="text-align: right; background-color: white;  border: none; text-overflow: ''; -webkit-appearance: none;"
                                                    v-model="form.service_charge" @change="netAmount()">
                                                    <option :value="service_charge.rate"
                                                        v-for="service_charge in service_charges" :key="service_charge.id">
                                                        {{ service_charge.name }}
                                                    </option>
                                                </select>
                                            </td>

                                            <td style="text-align: right; width: 100%;">
                                                <span class="billInput">
                                                    {{ ServiceChargeAmount }}
                                                </span>
                                            </td>
                                        </tr>

                                        <!-- Service Charges Amount -->
                                        <tr class="">
                                            <td style="font-size: 12px;">
                                                Service Charge
                                            </td>

                                            <td style="text-align: right;" colspan="2">
                                                <input type="text" class="billInput" value="0"
                                                    style="text-align: right; width: 100%;"
                                                    v-model="form.service_charge_amount" @change="netAmount()">
                                            </td>

                                            <td style="text-align: right; width: 100%;">
                                                <span class="billInput">
                                                    {{ ServiceChargeAmountToPercent }}%
                                                </span>
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
                                                        v-for="payment_method in payment_methods" :key="payment_method.id">
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
                                                <input type="text" class="billInput" style="text-align: right; width: 100%;"
                                                    @change="ReceivedAmount()" v-model="form.received_amount">
                                            </td>
                                        </tr>

                                        <!-- Due Amount -->
                                        <tr class="">
                                            <td style="font-size: 12px;" colspan="2">
                                                Refund
                                            </td>

                                            <td colspan="2">
                                                <input type="text" class="billInput" style="text-align: right; width: 100%;"
                                                    :value="ReceivedAmount()">
                                            </td>
                                        </tr>
                                    </table>

                                    <p style="text-align: center">
                                        ** Thank You ** <br>
                                        Please visit again
                                    </p>
                                </div>
                            </div>
                        </div>
                        <br>

                        <div class="row d-flex justify-content-evenly">
                            <button @click="printInvoice()" type="button" class="btn btn-dark btn-lg" style="width: 45%;">
                                <i class="fa fa-print"></i>
                                Print
                            </button>

                            <button type="submit" class="btn btn-dark btn-lg" style="width: 45%;">
                                <i class="fa fa-dollar"></i>
                                Payment
                            </button>
                        </div>
                    </form>
                </div>


                <div class="col-md-8">
                    <form @submit.prevent="customerSearch">
                        <div class="input-group">
                            <input type="text" class="form-control form-control-lg" v-model="search_keyword">
                            <button type="submit" class="btn btn-secondary btn-lg">
                                Search
                            </button>
                        </div>
                    </form>
                    <br>
                    <table class="table table-bordered mydatatable" id="customerTable">
                        <thead class="table-light">
                            <tr class="tablebg">
                                <th class="text-center" style="width: 1%;">#</th>
                                <th class="text-center">ID</th>
                                <th class="text-center">Name</th>
                                <th class="text-center">Primary Number</th>
                                <th class="text-center">Additional Number</th>
                                <th class="text-center">Remark</th>
                            </tr>
                        </thead>
                        <tbody style="background-color: white;">
                            <tr v-for="customer in customers" :key="customer.id" @click="selectCustomer(customer.id)">

                                <td style="text-align: center;" onClick="">
                                    {{ customer.id ?? '' }}
                                </td>

                                <td style="text-align: center;">
                                    {{ customer.customer_id ?? '' }}
                                </td>

                                <td style="text-align: center;">
                                    {{ customer.name ?? '' }}
                                </td>

                                <td style="text-align: center;">
                                    {{ customer.primary_number ?? '' }}
                                </td>

                                <td style="text-align: center;">
                                    {{ customer.additional_number ?? '' }}
                                </td>

                                <td style="text-align: center;">
                                    {{ customer.remark ?? '' }}
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="row">
                <!-- showCombineBillModal -->
                <div class="modal fade" id="showCombineBillModal" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-sm">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: black;">
                                <h5 class="modal-title" id="exampleModalLabel" style="color: white;">
                                    Choose Order
                                </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                                    style="color: white;">
                                    <i class="fas fa-x fa-2xl"></i>
                                </button>
                            </div>

                            <div class="modal-body">
                                <form @submit.prevent="confirmCombine" autocomplete="off">
                                    <table class="table">
                                        <tbody style="background-color: white;">
                                            <tr v-for="combile_order_info in combile_order_infos"
                                                :key="combile_order_info.id">
                                                <td>
                                                    <input class="form-check-input" type="checkbox"
                                                        :value="combile_order_info.id" :id="combile_order_info.id"
                                                        v-model="combile_form.combile_order_info_id">
                                                    <label class="form-check-label" :for="combile_order_info.id">
                                                        Select
                                                    </label>
                                                </td>

                                                <!-- @click="confirmCombine(combile_order_info.id)" -->
                                                <td>
                                                    <div class="d-flex justify-content-between">
                                                        <span class="py-1">
                                                            {{ combile_order_info.table_lists_table.table_name }}
                                                        </span>

                                                        <span class="py-1">
                                                            {{ combile_order_info.total_amount }}
                                                        </span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="d-flex justify-content-between">
                                        <button type="submit" class="btn btn-dark btn-lg block" style="width: 100%;">
                                            Confirm
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
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
        'combile_order_infos',
        'discounts',
        'service_charges',
        'bill_info',
        'void_item_total',
    ],


    data() {
        return {
            search_keyword: '',

            taxAmount: 0,
            DiscountAmount: 0,
            DiscountAmountToPercent: 0,
            ServiceChargeAmount: 0,
            ServiceChargeAmountToPercent: 0,

            form: {
                customer: null,
                taxrate: 0,
                disc: 0,
                payment_method_id: null,
                order_info_id: this.order_infos.id,
                totalNetAmount: 0,
                received_amount: 0,
                dueAmount: 0,
                disc_amount: 0,
                service_charge: 0,
                service_charge_amount: 0,
                refund_amount: 0,
            },

            combile_form: {
                combile_order_info_id: [],
                main_order_infos: this.order_infos.id,
            }
        }
    },

    methods: {

        showCombineBill(order_info_id) {
            axios.get(`/pos_combine_bill?order_info_id=${order_info_id}`)
                .then(response => (this.combile_order_infos = response.data.combile_order_infos));
            $('#showCombineBillModal').modal('show');
        },

        confirmCombine() {
            $('#showCombineBillModal').modal('hide');
            this.$inertia.post('/pos_confirm_combine', this.combile_form);
        },

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

            var disc_amount = this.form.disc_amount;
            this.DiscountAmountToPercent = +disc_amount / +sum * 100;

            var service_charge_amount = this.form.service_charge_amount;
            this.ServiceChargeAmountToPercent = +service_charge_amount / +sum * 100;

            var totalTaxNetAmount = totalAmount * taxrate / 100;
            this.taxAmount = totalTaxNetAmount;

            var totalDiscNetAmount = totalAmount * disc / 100;
            this.DiscountAmount = totalDiscNetAmount;

            var service_charge = this.form.service_charge;
            var totalServiceChargeNetAmount = totalAmount * service_charge / 100;
            this.ServiceChargeAmount = totalServiceChargeNetAmount;

            var netAmount = (totalAmount + totalTaxNetAmount + totalServiceChargeNetAmount + +service_charge_amount) - (totalDiscNetAmount + +disc_amount);
            this.form.totalNetAmount = netAmount;
            return netAmount;
        },

        ReceivedAmount() {
            var net_amount = this.form.totalNetAmount;
            var received_amount = this.form.received_amount;
            var due_amount = net_amount - received_amount;
            this.form.dueAmount = due_amount;
            this.form.refund_amount = due_amount;
            return due_amount;
        },

        submitPayment() {
            if (this.void_item_total == 0) {
                if (this.form.payment_method_id == '' || this.form.payment_method_id == null) {
                    this.$toastr.e('Pleast Select Pay Type');
                    return false;
                } else {
                    this.$inertia.post('/pos_submit_payment', this.form);
                    this.printInvoice();
                }
            } else {
                swal({
                    title: "Cannot Submit to Payment",
                    text: 'Need to Accept or Reject Void Item.',
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
            }

        },

        selectCustomer(id) {
            this.form.customer = id;
        },

        customerSearch() {
            this.$inertia.get(`/bill_payment/${this.order_infos.id}?custom_search=${this.search_keyword}`);
        },

        printInvoice() {

            this.$inertia.post('/pos_submit_print_bill', this.form);

            printJS({
                printable: "printArea",
                type: "html",
                css: [
                    "https://pos-sys.skgroupmm.com/pos/css/bill.css"
                ],
                scanStyles: false
            });
        },
    },

    mounted() {
        this.form.customer = this.bill_info[0].customer_id;
        this.form.taxrate = this.bill_info[0].tax_amount;
        this.form.disc = this.bill_info[0].discount;
        this.form.payment_method_id = this.bill_info[0].payment_type;
        this.form.received_amount = this.bill_info[0].received_amount;
        this.form.disc_amount = this.bill_info[0].discount_amount;
        this.form.service_charge = this.bill_info[0].service_charges;
        this.form.service_charge_amount = this.bill_info[0].service_charge_amount;
        this.form.refund_amount = this.bill_info[0].received_amount;
    }
};
</script>
<style>
.billInput {
    width: 100%;
    border: none;
    font-size: 12px !important;
}

.select-style {
    text-align: right;
    background-color: white;
    border: none;
    text-overflow: '';
    -webkit-appearance: none;
}
</style>