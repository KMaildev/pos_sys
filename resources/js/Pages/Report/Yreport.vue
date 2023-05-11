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


                    <div class="col-md-4 col-lg-4 col-sm-4 py-3">
                        <button @click="exportExcel('xlsx')" class="btn btn-success">
                            <i class="text-white fa fa-file-excel"></i> Excel
                        </button>
                    </div>

                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="table-responsive text-nowrap">
                            <table class="table table-bordered" id="tableId">
                                <thead style="background-color: #e8dff5;">
                                    <tr class="tablebg">
                                        <th class="text-center" style="width: 1%;">
                                            Sr
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Date
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Menu Name
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Qty
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Reason
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="(void_item, index) in void_items" :key="void_item.id">
                                        <td class="text-center">
                                            {{ index + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.void_date ?? '' }}
                                            {{ void_item.void_time ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.menu_list_table.menu_name }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.qty }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.reason }}
                                        </td>
                                    </tr>
                                </tbody>
                                <tr style="background-color: white;">
                                    <td colspan="3">
                                        Total
                                    </td>

                                    <!--Discount Amount-->
                                    <td class="text-center">
                                        {{ voidTotalQty() }}
                                    </td>

                                    <td></td>
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
import SaleButton from "./components/SaleButton.vue";
import swal from 'sweetalert2';
window.Swal = swal;

export default {
    name: "Yreport",
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
        'void_items'
    ],

    methods: {
        voidTotalQty() {
            let sum = 0;
            this.void_items.forEach(function (item) {
                sum += parseFloat(item.qty);
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
<style>

</style>