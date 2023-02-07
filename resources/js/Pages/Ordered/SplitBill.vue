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
                                            Qty
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="order_item in order_infos.order_items_table" :key="order_item.id">

                                        <td style="background-color: #F8F9FA;">
                                            <div class="d-flex justify-content-around"
                                                @click="reduceSplitQtyUpdate(order_item.id, order_item.split_qty, order_item.qty)">

                                                <span class="btn btn-sm btn-success">
                                                    <i class="fa fa-plus"></i>
                                                </span>

                                                <span class="py-1">
                                                    {{ order_item.qty - order_item.split_qty }}
                                                </span>
                                            </div>
                                        </td>

                                        <td>
                                            {{ order_item.menu_name }}
                                        </td>

                                        <td class="text-center">
                                            {{ order_item.price }}
                                        </td>

                                        <td style="background-color: #F8F9FA;">
                                            <div class="d-flex justify-content-around"
                                                @click="SplitQtyUpdate(order_item.id, order_item.split_qty, order_item.qty)">
                                                <span class="py-1">
                                                    {{ order_item.split_qty }}
                                                </span>

                                                <span class="btn btn-sm btn-success">
                                                    <i class="fa fa-plus"></i>
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="card-header d-flex">
                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 14px; text-align: left;">
                                Quantity: {{ totalAmountCalcQty(order_infos.order_items_table) }}
                                <br>
                                Total: {{ totalAmountCalc(order_infos.order_items_table) }}
                            </h4>

                            <h4 class="card-title mb-0 flex-grow-1 guest_title"
                                style="font-size: 14px; text-align: right;">
                                <span>
                                    Quantity: {{ splitTotalAmountCalcQty(order_infos.order_items_table) }}
                                </span>
                                <br>
                                <span>
                                    Total: {{ splitTotalAmountCalc(order_infos.order_items_table) }}
                                </span>
                            </h4>
                        </div>

                        <!-- @click="SplitOrderConfirm(order_infos.id)" -->
                        <button class="additional_order" @click="showGuestsNumberModal()">
                            Save & Done
                        </button>
                    </div>
                </div>





                <!-- Number Of Guest Modal  -->
                <div class="modal fade" id="numberOfGuestsModal" data-bs-backdrop="static" data-bs-keyboard="false"
                    tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-sm">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: black;">
                                <h5 class="modal-title" id="exampleModalLabel" style="color: white;">
                                    Number of Guests
                                </h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                                    style="color: white;">
                                    <i class="fas fa-x fa-2xl"></i>
                                </button>
                            </div>

                            <div class="modal-body py-5">
                                <div class="d-flex justify-content-between"
                                    style="border: 1px solid black; border-radius: 10px;">
                                    <button type="button" class="btn btn-dark btn-lg" v-on:click="reduceGuestNo()">
                                        <i class="fas fa-arrow-circle-down"></i>
                                    </button>

                                    <button type="button" class="btn btn btn-lg text-black"
                                        style="background-color: white; width: 100%;">
                                        {{ value }}
                                    </button>

                                    <button type="button" class="btn btn-dark btn-lg" v-on:click="addGuestNo()">
                                        <i class="fas fa-arrow-alt-circle-up "></i>
                                    </button>
                                </div>
                                <br><br>
                                <div class="d-flex justify-content-between">
                                    <button type="button" class="btn btn-dark btn-lg block" style="width: 100%;"
                                        @click="SplitOrderConfirm(order_infos.id)">
                                        Confirm
                                    </button>
                                </div>
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
    name: "SplitBill",
    components: {
        Master,
        MenuButton,
    },

    data() {
        return {
            value: localStorage.getItem("guest_no"),
        }
    },

    props: [
        'user_name',
        'login_time',
        'order_infos',
    ],

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

        splitTotalAmountCalc(order_items) {
            let sum = 0;
            order_items.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.split_qty));
            });
            return sum;
        },

        splitTotalAmountCalcQty(order_items) {
            let total_qty = 0;
            order_items.forEach(function (item) {
                total_qty += item.split_qty;
            });
            return total_qty;
        },


        SplitQtyUpdate(id, split_qty, qty) {
            var split_qty = split_qty + 1;
            if (split_qty <= qty) {
                this.$inertia.get(`/split_qty_update?order_items=${id}&split_qty=${split_qty}`);
            }
        },

        reduceSplitQtyUpdate(id, split_qty, qty) {
            var split_qty = split_qty - 1;
            if (split_qty >= 0) {
                this.$inertia.get(`/split_qty_update?order_items=${id}&split_qty=${split_qty}`);
            }
        },



        showGuestsNumberModal() {
            $('#numberOfGuestsModal').modal('show');
        },


        addGuestNo() {
            this.value++;
            localStorage.setItem("guest_no", this.value);
        },

        reduceGuestNo() {
            var guest_n = this.value;
            if (guest_n > 1) {
                this.value--;
                localStorage.setItem("guest_no", this.value);
            } else {
            }
        },

        SplitOrderConfirm(order_info_id) {
            $('#numberOfGuestsModal').modal('hide');
            this.$inertia.get(`/split_order_confirm?order_info_id=${order_info_id}&&guest_no=${this.value}`);
        }
    }
};
</script>
<style>

</style>