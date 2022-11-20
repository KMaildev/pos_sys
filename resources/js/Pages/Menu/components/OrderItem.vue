<template>
    <div class="col-xl-3 col-md-3 col-lg-3">
        <div class="" style="background-color: white; padding: 10px;">
            <h4 class="card-title" style="font-size: 15px; padding: 2px;">
                TBL / {{ table_name }}
            </h4>
            <div class="card-body">
                <div class="receipt">
                    <table class="table" style="width: 100%">
                        <tr class="header">
                            <th style="font-size: 18px; width: 80%;">
                                Description
                            </th>
                            <th style="font-size: 18px; width: 20%; text-align: right;">
                                Qty
                            </th>
                        </tr>
                    </table>
                    <tbody>
                        <tr v-for="cart_temp in cart_temps" :key="cart_temp.id" @click="orderNote()">
                            <td style="width: 80%; padding: 3px;">
                                {{ cart_temp.menu_lists_table.menu_name }}
                            </td>

                            <td style="width: 20%; padding: 3px; text-align: right;">
                                {{ cart_temp.qty }}
                            </td>
                        </tr>
                    </tbody>
                </div>
                <div class="row mt-4">
                    <div class="col-sm-6">
                        <Link :href="route('pos_table_lists')" class="btn btn-secondary">
                        <i class="mdi mdi-arrow-left me-1"></i>
                        Edit Seat
                        </Link>
                    </div>
                    <div class="col-sm-6">
                        <div class="text-sm-end mt-2 mt-sm-0">
                            <button @click="orderConfirm" class="btn btn-success block">
                                <i class="mdi mdi-cart-arrow-right me-1"></i>
                                Send
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: "OrderItem",

    props: [
        'cart_temps',
        'table_name',
        'table_id',
    ],

    methods: {
        orderConfirm() {
            const table_list_id = this.table_id;
            if (table_list_id) {
                this.$inertia.get(`/order_confirm?table_list_id=${table_list_id}`);
            } else {
                this.alertMessage();
            }

        },

        alertMessage() {
            swal({
                title: "Please Select Seat",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                    }
                });
        },
    },

    created() {
        this.table_name = localStorage.getItem("table_name");
        this.table_id = localStorage.getItem("table_id");
    },

}
</script>
<style>

</style>