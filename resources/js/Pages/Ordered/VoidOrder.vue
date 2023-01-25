<template>
    <div>
        <master :user_name="user_name">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <MenuButton :order_infos="order_infos"></MenuButton>
                </div>
            </div>

            <div class="ScrollStyle">

                <div class="row py-2">
                    <div class="col-xl-6 col-md-6 col-lg-6">
                        <div class="card-header d-flex">
                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 13px; text-align: left;">
                                TBL : {{ order_infos.table_lists_table.table_name }}
                            </h4>

                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 13px; text-align: left;">
                                <i class="fa fa-clock"></i> {{ order_infos.order_time }}
                            </h4>

                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 13px; text-align: right;">
                                GUEST : {{ order_infos.guest_no }}
                            </h4>
                        </div>

                        <div class="card-body overflow-auto" style="background-color: white;">
                            <table class="table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="text-center" style="width: 20%; font-size: 18px;">
                                            Qty
                                        </th>
                                        <th class="text-center" style="width: 50%; font-size: 18px;">
                                            Items
                                        </th>
                                        <th class="text-center" style="width: 12%; font-size: 18px;">
                                            Price
                                        </th>
                                        <th class="text-center" style="width: 20%; font-size: 18px;">
                                            Action
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="order_item in order_infos.order_items_table" :key="order_item.id">

                                        <td class="text-center">
                                            {{ order_item.qty - order_item.split_qty }}
                                        </td>

                                        <td>
                                            {{ order_item.menu_name }}
                                        </td>

                                        <td class="text-center">
                                            {{ order_item.price }}
                                        </td>

                                        <td class="text-center" @click="showVoidInfo(order_item.id)">
                                            <span class="btn btn-sm btn-dark">
                                                <i class="fa fa-plus"></i>
                                                Void
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="card-header d-flex">
                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 14px; text-align: right;">
                                Quantity: {{ totalAmountCalcQty(order_infos.order_items_table) }}
                                <br>
                                Total: {{ totalAmountCalc(order_infos.order_items_table) }}
                            </h4>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="showVoidInfoModal" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-sm">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: black;">
                                <h5 class="modal-title" id="exampleModalLabels" style="color: white;">
                                    Void Order
                                </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                                    style="color: white;">
                                    <i class="fas fa-x fa-2xl"></i>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form @submit.prevent="ConfirmVoidItem">
                                    <select class="form-select form-select-lg mb-3" v-model="reason">
                                        <option selected value="">
                                            ---Select Reason---
                                        </option>
                                        <option value="Customers' return">
                                            Customers' return
                                        </option>
                                        <option value="Customers' time issue">
                                            Customers' time issue
                                        </option>
                                        <option value="Mistake operation">
                                            Mistake operation
                                        </option>
                                        <option value="Modifiers or kitchen remarks are incorrect">
                                            Modifiers or kitchen remarks are incorrect
                                        </option>
                                        <option value="No seating">
                                            No seating
                                        </option>
                                        <option value="System error">
                                            System error
                                        </option>
                                        <option value="Other">
                                            Other
                                        </option>
                                    </select>

                                    <br>
                                    <div class="d-flex justify-content-between">
                                        <button type="submit" class="btn btn-dark btn-lg block" style="width: 100%;">
                                            Confirm
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </master>
    </div>
</template>

<script>
import Master from "../Layout/Master";
import MenuButton from "./MenuButton.vue";

export default {
    name: "VoidOrder",
    components: {
        Master,
        MenuButton,
    },

    props: [
        'user_name',
        'login_time',
        'order_infos',
        'void_item',
    ],

    data() {
        return {
            reason: this.reason,
        }
    },

    methods: {
        totalAmountCalc(order_items) {
            let sum = 0;
            order_items.forEach(function (item) {
                var qty = item.qty - item.split_qty
                sum += (parseFloat(item.price) * parseFloat(qty));
            });
            return sum;
        },

        totalAmountCalcQty(order_items) {
            let total_qty = 0;
            order_items.forEach(function (item) {
                total_qty += item.qty - item.split_qty;
            });
            return total_qty;
        },

        showVoidInfo(order_item_id) {
            axios.get(`/pos_void_item?order_item_id=${order_item_id}`)
                .then(response => (this.void_item = response.data.void_item));

            $('#showVoidInfoModal').modal('show');
        },

        ConfirmVoidItem() {
            var item_id = this.void_item.id;
            var reason = this.reason;
            this.$inertia.get(`/confirm_void_item?item_id=${item_id}&reason=${reason}`);
            $('#showVoidInfoModal').modal('hide');
        },
    }
};
</script>
<style>

</style>