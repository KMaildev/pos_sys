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
                                                    {{ order_item.qty }}
                                                </td>

                                                <td style="width: 20%; padding: 3px; text-align: right; font-size: 13px;">
                                                    {{ order_item.qty * order_item.price }}
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
                                    </table>
                                </div>
                            </div>
                        </div>

                        <div class="row d-flex justify-content-evenly py-3">
                            <button @click="printInvoice()" type="button" class="btn btn-dark btn-lg" style="width: 100%;">
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
        'categories'
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

        searchDate() {
            this.$inertia.get(`/pos_void_report`, this.form);
        },

        exportExcel(type, fn, dl) {
            var today = new Date();
            var date = today.getFullYear() + '_' + (today.getMonth() + 1) + '_' + today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date + '_' + time;

            var tableId = document.getElementById('tableId');
            var wb = XLSX.utils.table_to_book(tableId, { sheet: "sheet1" });
            return dl ?
                XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
                XLSX.writeFile(wb, fn || (`export_excel_${dateTime}.` + (type || 'xlsx')));
        },
    }
};
</script>
<style></style>