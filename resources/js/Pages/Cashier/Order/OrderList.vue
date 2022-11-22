<template>
    <div>
        <div class="card">
            <div class="card-body">

                <div class="row mb-2">
                    <div class="col-sm-4">
                        <div class="search-box me-2 mb-2 d-inline-block">
                            <div class="position-relative">
                                <form @submit.prevent="searchTableName">
                                    <input v-model="q" type="text" class="form-control" placeholder="Search Table">
                                    <i class="bx bx-search-alt search-icon"></i>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table border-no mydatatable">
                        <thead class="table-light">
                            <tr class="tablebg">
                                <th class="text-center" style="width: 1%;">#</th>
                                <th class="text-center">Invoice</th>
                                <th class="text-center">Order No</th>
                                <th class="text-center">Order Date & Time</th>
                                <th class="text-center">Table</th>
                                <th class="text-center">Waiter</th>
                                <th class="text-center">Total Amount</th>
                                <th class="text-center">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr v-for="order_info in order_infos" :key="order_info.id" class="text-center">
                                <td>
                                    {{ order_info.id }}
                                </td>

                                <td>
                                    {{ order_info.inv_no }}
                                </td>

                                <td>
                                    {{ order_info.order_no }}
                                </td>

                                <td>
                                    {{ order_info.order_date_time }}
                                </td>

                                <td>
                                    {{ order_info.table_lists_table.table_name }}
                                </td>

                                <td>
                                    {{ order_info.waiter_user_table.name }}
                                </td>

                                <td>
                                    {{ order_info.total_amount }}
                                </td>

                                <td>
                                    <button @click="viewOrderDetail(order_info.id)" class="btn btn-success">
                                        <i class="fa fa-eye"></i>
                                        View
                                    </button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</template>
<script>


export default {
    name: "OrderList",

    props: [
        'order_infos',
    ],

    data() {
        return {
            q: '',
        }
    },

    methods: {
        searchTableName() {
            this.$inertia.get(`/cashier_order?keyword=${this.q}`);
        },

        viewOrderDetail(id) {
            this.$inertia.get(`/cashier_order?order_info_id=${id}`);
        }
    }
}
</script>
<style>

</style>