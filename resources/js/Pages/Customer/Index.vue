<template>
    <div>
        <master :user_name="user_name">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <BillMenuButton></BillMenuButton>
                </div>

                <div class="row mb-2 py-2">
                    <div class="col-sm-3 col-md-3 col-lg-3">
                        <div class="text-sm-end">
                            <Link :href="route('cashier_customer_create')" class="btn btn-dark btn-lg"
                                style="width: 100%; background-color: #808080;">
                            <i class="mdi mdi-plus me-1"></i>
                            Add new customer
                            </Link>
                        </div>
                    </div>
                </div>

                <div class="col-md-12 col-lg-12 col-sm-12">
                    <table class="table border-no mydatatable">
                        <thead class="table-light">
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
                                    <Link :href="`/cashier_customer_edit/${customer.id}/edit`" class="btn btn-dark"
                                        style="width: 100%; background-color: #808080;">
                                    <i class="fa fa-edit"></i>
                                    Edit
                                    </Link>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </master>
    </div>
</template>
<script>
import Master from "../Layout/Master.vue";
import BillMenuButton from "../Bill/components/BillMenuButton.vue";

export default {
    name: "Index",
    components: {
        Master,
        BillMenuButton
    },

    data() {
        return {
        }
    },

    props: [
        'user_name',
        'customers',
    ],
};
</script>