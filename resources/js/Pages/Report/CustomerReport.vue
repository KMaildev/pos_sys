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
                        <form @submit.prevent="searchCustomer">
                            <div class="input-group">
                                <input type="text" class="form-control" v-model="form.keyword" placeholder="Name, ID, Phone">
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
                                <thead style="background-color: #D5D6EA;">
                                    <tr class="tablebg">
                                        <th class="text-center" style="width: 1%;">#</th>
                                        <th class="text-center">ID</th>
                                        <th class="text-center">Name</th>
                                        <th class="text-center">Primary Number</th>
                                        <th class="text-center">Additional Number</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Address</th>
                                        <th class="text-center">Date of Birth</th>
                                        <th class="text-center">Join Date</th>
                                        <th class="text-center">Remark</th>
                                        <th class="text-center">Total Amount</th>
                                        <th class="text-center">Actions</th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="customer in customers" :key="customer.id">

                                        <td style="text-align: center;">
                                            {{ customer.id ?? '' }}
                                        </td>

                                        <td>
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
                                            {{ customer.email ?? '' }}
                                        </td>

                                        <td style="text-align: center;">
                                            {{ customer.address ?? '' }}
                                        </td>

                                        <td style="text-align: center;">
                                            {{ customer.date_of_birth ?? '' }}
                                        </td>

                                        <td style="text-align: center;">
                                            {{ customer.join_date ?? '' }}
                                        </td>

                                        <td style="text-align: center;">
                                            {{ customer.remark ?? '' }}
                                        </td>

                                        <td style="text-align: center;">
                                            {{ totalAmount(customer.bill_table) }}
                                        </td>

                                        <td style="text-align: center;">
                                            <Link :href="`/pos_customer_bill_history/${customer.id}`" class="btn btn-dark btn-sm"
                                                style="width: 100%; background-color: #808080;">
                                            <i class="fa fa-edit"></i>
                                            View History
                                            </Link>
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
import ManagementButton from "./components/ManagementButton.vue";

export default {
    name: "CustomerReport",
    components: {
        Master,
        MenuButton,
        ManagementButton
    },

    data() {
        return {
            form: {
                keyword: this.keyword,
            }
        }
    },

    props: [
        'user_name',
        'customers',
    ],

    methods: {

        totalAmount(bill_table){
            let sum = 0;
            bill_table.forEach(function (item) {
                sum += +item.total_amount;
            });
            return sum;
        },

        searchCustomer() {
            this.$inertia.get(`/pos_customer_report`, this.form);
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