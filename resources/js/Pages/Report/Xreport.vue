<template>
    <div>
        <master :user_name="user_name">
            <div class="ScrollStyle">
                <div class="row py-2">
                    <MenuButton></MenuButton>
                </div>

                <div class="row">
                    <SaleButton></SaleButton>
                </div>


                <div class="row">
                    <div class="col-md-4 col-lg-4 col-sm-4 py-3">
                        <form @submit.prevent="searchDate">
                            <div class="input-group">
                                <input type="date" class="form-control date_picker" v-model="form.start_date">
                                <input type="date" class="form-control date_picker" v-model="form.end_date">
                                <input type="submit" class="btn btn-dark" value="Search">
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4 col-lg-4 col-sm-12 row d-flex justify-content-evenly">

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

                                    <table style="width: 100%">
                                        <tbody v-for="category, index in categories">
                                            <tr>
                                                <td colspan="3">
                                                    [{{ category.title }}]
                                                </td>
                                            </tr>

                                            <tr v-for="order_item in category.order_items" :key="order_item.id">
                                                <td style="width: 350px; padding: 3px; font-size: 13px;">
                                                    {{ order_item.menu_name }}
                                                    <br>
                                                    {{ order_item.remark }}
                                                </td>

                                                <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                    {{ order_item.order_qty }}
                                                </td>

                                                <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                    {{ order_item.order_qty * order_item.price }}
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    Sub-Total
                                                </td>

                                                <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                    {{ TotalQty(category.order_items) }}
                                                </td>

                                                <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                    {{ TotalAmount(category.order_items) }}
                                                </td>
                                            </tr>
                                        </tbody>
                                        <br>
                                        <tr>
                                            <td>
                                                Grand-Total
                                            </td>
                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                {{ TotalGrandQty() }}
                                            </td>
                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                {{ TotalGrandAmount() }}
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                               Total Discount
                                            </td>
                                            <td></td>
                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                {{ TotalDiscount() }}
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                               Total Services
                                            </td>
                                            <td></td>
                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                {{ TotalServices() }}
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                               Total Tax
                                            </td>
                                            <td></td>
                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                {{ TotalTax() }}
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                               Gross Sales
                                            </td>
                                            <td></td>
                                            <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                {{ TotalGrossSale() }}
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="row d-flex justify-content-evenly py-3">
                            <button @click="printReport()" type="button" class="btn btn-dark btn-lg" style="width: 100%;">
                                <i class="fa fa-print"></i>
                                Print
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </master>
    </div>
</template>

<script>
import Master from "../Layout/Master";
import MenuButton from "./components/MenuButton.vue";
import SaleButton from "./components/SaleButton.vue";
import swal from 'sweetalert2';
window.Swal = swal;

export default {
    name: "Xreport",
    components: {
        Master,
        MenuButton,
        SaleButton
    },

    data() {
        return {
            form: {
                start_date: this.start_date,
                end_date: this.end_date,
            }
        }
    },

    props: [
        'user_name',
        'categories',
        'bill_infos',
        'order_items_lists',
    ],

    methods: {
        TotalQty(category_order_item) {
            let sum = 0;
            category_order_item.forEach(function (item) {
                sum += parseFloat(item.qty);
            });
            return sum;
        },

        TotalAmount(category_order_item) {
            let sum = 0;
            category_order_item.forEach(function (item) {
                sum += parseFloat(item.qty) * parseFloat(item.price);
            });
            return sum;
        },


        TotalGrandQty() {
            let sum = 0;
            this.categories.forEach(function (item) {
                item.order_items.forEach(function (i){
                    sum += parseFloat(i.qty);
                });
            });
            return sum;
        },

        TotalGrandAmount() {
            let sum = 0;
            this.categories.forEach(function (item) {
                item.order_items.forEach(function (i){
                    sum += parseFloat(i.qty) * parseFloat(i.price);
                });
            });
            return sum;
        },

        TotalDiscount(){
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                var total_amount = +item.total_amount;
                var discount = +item.discount;
                var dis_present_amount = total_amount * discount / 100;
                var dis_amount = +item.discount_amount;
                sum += dis_present_amount + dis_amount;
            });
            return sum;
        },

        TotalServices(){
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                var total_amount = +item.total_amount;
                var service_charges = +item.service_charges;
                var service_charges_present_amount = total_amount * service_charges / 100;
                var service_amount = +item.service_charge_amount;
                sum += service_charges_present_amount + service_amount;
            });
            return sum;
        },

        TotalTax(){
            let sum = 0;
            this.bill_infos.forEach(function (item) {
                var total_amount = +item.total_amount;
                var tax_amount = +item.tax_amount;
                sum += total_amount * tax_amount / 100;
            });
            return sum;
        },

        TotalGrossSale(){
            let total_amount = this.TotalGrandAmount();
            let total_discount = this.TotalDiscount();
            let total_services = this.TotalServices();
            let total_tax = this.TotalTax();
            let total_gross_sale = total_amount - total_discount + total_services + total_tax;
            return total_gross_sale;
        },

        searchDate() {
            this.$inertia.get(`/pos_x_report`, this.form);
        },

        printReport(){
            printJS({
                printable: "printArea",
                type: "html",
                css: [
                    "https://pos-sys.skgroupmm.com/pos/css/bill.css"
                ],
                scanStyles: false
            });
        }
    }
};
</script>
<style></style>