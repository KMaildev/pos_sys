<template>
    <div>
        <CashierMaster :user_name="user_name" :login_time="login_time">
            <TopLink></TopLink>
            <div class="container-fluid ScrollStyle1">
                <div class="row py-4">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="row mb-2">
                                    <div class="col-sm-4">
                                        <div class="search-box me-2 mb-2 d-inline-block">
                                            <div class="position-relative">
                                                <form @submit.prevent="customerSearch">
                                                    <input v-model="q" type="text" class="form-control"
                                                        placeholder="Customer Name">
                                                    <i class="bx bx-search-alt search-icon"></i>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-8">
                                        <div class="text-sm-end">
                                            <Link :href="route('cashier_customer_create')"
                                                class="btn btn-success aves-effect waves-light mb-2 me-2">
                                            <i class="mdi mdi-plus me-1"></i>
                                            Create
                                            </Link>
                                        </div>
                                    </div>
                                </div>
                                <div class="table-responsive">
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
                                        <tbody>
                                            <tr class="hover-primary" v-for="customer in customers" :key="customer.id">

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
                                                    <Link :href="`/cashier_customer_edit/${customer.id}/edit`"
                                                        class="btn btn-success">
                                                    <i class="fa fa-edit"></i>
                                                    Edit
                                                    </Link>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
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
    name: "Index",

    props: [
        'user_name',
        'login_time',
        'customers',
    ],

    methods: {
        customerSearch() {
            this.$inertia.get(`/cashier_customer?keyword=${this.q}`);
        },
    }
}
</script>
<style>
.ScrollStyle1 {
    max-height: 1000px;
    overflow-y: scroll;
}
</style>