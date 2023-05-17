<template>
    <div>
        <master :user_name="user_name">
            <div class="ScrollStyle">
                <div class="row py-2">
                    <MenuButton></MenuButton>
                </div>

                <div class="row">
                    <ManagementButton></ManagementButton>
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


                    <div class="col-md-4 col-lg-4 col-sm-4 py-3">
                        <button @click="exportExcel('xlsx')" class="btn btn-success">
                            <i class="text-white fa fa-file-excel"></i> Excel
                        </button>
                    </div>

                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="table-responsive text-nowrap">
                            <table class="table table-bordered" id="tableId">
                                <thead style="background-color: #F6F6EB;">
                                    <tr class="tablebg">
                                        <th class="text-center" style="width: 1%;">
                                            Sr
                                        </th>

                                        <th class="text-center">
                                            Menu Name
                                        </th>

                                        <th class="text-center">
                                            Types
                                        </th>

                                        <th class="text-center">
                                            Sales Qty
                                        </th>

                                        <th class="text-center">
                                            Sales Percentage
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="(menu_list, index) in menu_lists" :key="menu_list.id">
                                        <td class="text-center">
                                            {{ index + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ menu_list.menu_name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ menu_list.category_table.title ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ saleQty(menu_list) }}
                                        </td>

                                        <td class="text-center">
                                            {{ saleQtyPercentage(menu_list) }}
                                        </td>
                                    </tr>
                                </tbody>
                                <tr style="background-color: #d0cfd1;">
                                    <td colspan="3" class="text-center">
                                        Total
                                    </td>

                                    <td class="text-center">
                                        {{ order_item_total }}
                                    </td>

                                    <td class="text-center">
                                    </td>
                                </tr>
                            </table>
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
import ManagementButton from "./components/ManagementButton.vue";

export default {
    name: "CashReport",
    components: {
        Master,
        MenuButton,
        ManagementButton
    },

    data() {
        return {
            total: 0,
            form: {
                start_date: this.start_date,
                end_date: this.end_date,
            },
        }
    },

    props: [
        'user_name',
        'menu_lists',
        'order_item_total',
    ],

    methods: {
        saleQty(menu_list) {
            let sum = 0;
            menu_list.order_items_table.forEach(function (item) {
                sum += parseFloat(item.qty);
            });
            return sum;
        },


        saleQtyPercentage(menu_list) {
            let sale_qty = 0;
            menu_list.order_items_table.forEach(function (item) {
                sale_qty += parseFloat(item.qty);
            });
            var order_item_total = this.order_item_total;
            var total = sale_qty / order_item_total * 100;
            return total.toLocaleString("en-US");
        },


        searchDate() {
            this.$inertia.get(`/pos_sales_category_qty`, this.form);
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
    },

    created() {
        this.total = this.saleQty(menu_lists);
    }
};
</script>
<style>

</style>