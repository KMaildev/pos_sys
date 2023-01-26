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

                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="table-responsive text-nowrap">
                            <table class="table table-bordered">
                                <thead class="table-light">
                                    <tr class="tablebg">
                                        <th class="text-center" style="width: 1%;">
                                            Sr
                                        </th>
                                        <th class="text-center" style="width: 10%;">
                                            Tables Name
                                        </th>
                                        <th class="text-center" style="width: 10%;">
                                            Sales Bills
                                        </th>
                                        <th class="text-center" style="width: 10%;">
                                            Sales Amount
                                        </th>
                                        <th class="text-center" style="width: 10%;">
                                            Remark
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="(table_list, index) in table_lists" :key="table_list.id">
                                        <td class="text-center">
                                            {{ index + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ table_list.table_name }}
                                        </td>

                                        <td class="text-center">
                                            {{ SalesBills(table_list) }}
                                        </td>

                                        <td class="text-center">
                                            {{ SalesAmount(table_list) }}
                                        </td>

                                        <td class="text-center">
                                            <span v-if="table_list.void_item_table">
                                                {{ table_list.void_item_table.reason }}
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
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
    name: "StaffSales",
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
            },
        }
    },

    props: [
        'user_name',
        'table_lists'
    ],

    methods: {

        SalesBills(table_list) {
            let sum = 0;
            table_list.bill_infos_table.forEach(function (item) {
                sum += 1;
            });
            return sum;
        },


        SalesAmount(table_list) {
            let sum = 0;
            table_list.bill_infos_table.forEach(function (item) {
                sum += +item.total_amount;
            });
            return sum;
        },

        searchDate() {
            this.$inertia.get(`/pos_tables_sales`, this.form);
        }
    }
};
</script>
<style>

</style>