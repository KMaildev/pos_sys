<template>
    <div class="col-md-6 col-lg-6 col-sm-12" style="height: 580px;">
        <div class="row">
            <div class="col-md-3 col-md-3 col-sm-12" style="margin: 0px">
                <ButtonOperation></ButtonOperation>
            </div>

            <div class="col-md-9 col-lg-9 col-sm-12" style="margin: 0px">
                <div class="card-header d-flex">
                    <div class="card-title mb-0 flex-grow-1 category_title"
                        style="font-size: 20px; font-weight: bold; text-align: left;">

                        <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-dark btn-lg">
                                <i class="fas fa-chair"></i>
                            </button>

                            <button type="button" class="btn btn btn-lg text-black" style="background-color: white;">
                                {{ table_name }}
                            </button>
                        </div>
                    </div>

                    <div class="card-title mb-0 flex-grow-1 category_title"
                        style="font-size: 20px; font-weight: bold; text-align: right;">
                        <div class="btn-group" role="group" aria-label="Basic example">
                            <button type="button" class="btn btn-dark btn-lg" v-on:click="reduceGuestNo()">
                                <i class="fas fa-arrow-circle-down"></i>
                            </button>

                            <button type="button" class="btn btn btn-lg text-black" style="background-color: white;">
                                {{ value }}
                            </button>

                            <button type="button" class="btn btn-dark btn-lg" v-on:click="addGuestNo()">
                                <i class="fas fa-arrow-alt-circle-up "></i>
                            </button>
                        </div>
                    </div>

                </div>

                <div class="card-body overflow-auto"
                    style="max-height: calc(530px); height: 580px; background-color: white;">
                    <table class="table">
                        <thead class="table-light">
                            <tr>
                                <th style="width: 40%; font-size: 18px;">
                                    Description
                                </th>
                                <th class="text-center" style="width: 40%; font-size: 18px;">
                                    Quantity
                                </th>
                                <th class="text-center" style="width: 20%; font-size: 18px;">
                                    Amount
                                </th>
                                <th class="text-center" style="width: 10%; font-size: 18px;">

                                </th>
                            </tr>
                        </thead>

                        <tbody style="background-color: white;">
                            <tr v-for="(cart_list, index) in cart_lists" :key="index">
                                <td v-on:click="addRemark(cart_list)">
                                    {{ cart_list.menu_name }}
                                    <br>
                                    Remark: {{ cart_list.remark }}
                                </td>

                                <td class="text-center">
                                    <div class="input-group">
                                        <span class="input-group-text" @click="reduceQty(cart_list, index)">
                                            <i class="fa fa-minus fa-lg"></i>
                                        </span>
                                        <input type="text" class="form-control" :value="cart_list.qty"
                                            style="width: 10px; font-size: 15px; text-align: center;" readonly>
                                        <span class="input-group-text" @click="updateQty(cart_list, index)">
                                            <i class="fa fa-plus fa-lg"></i>
                                        </span>
                                    </div>
                                </td>

                                <td style="text-align: right;" v-on:dblclick="itemRemove(index)">
                                    {{ cart_list.qty * cart_list.price }}
                                </td>

                                <td style="text-align: center;" @click="itemRemove(index)">
                                    <i class="fa-solid fa-xmark text-danger " style="font-size: 25px;"></i>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="d-flex bd-highlight">
                    <h4 class="card-title mb-0 flex-grow-1 footer_title"
                        style="font-size: 16px; font-weight: bold; text-align: left;">
                        Total
                    </h4>
                    <h4 class="card-title mb-0 flex-grow-1 footer_title"
                        style="font-size: 16px; font-weight: bold; text-align: right;">
                        {{ totalAmountCalc(this.cart_lists) }}
                    </h4>
                </div>
            </div>
        </div>
    </div>
</template>
<script>

import VueNumericKeypad from "vue-numeric-keypad";
import ButtonOperation from './ButtonOperation.vue';
export default {
    name: "OrderItem",
    components: {
        VueNumericKeypad,
        ButtonOperation,
    },

    props: [
        'user_name',
    ],

    data() {
        return {
            table_name: localStorage.getItem("table_name"),
            value: localStorage.getItem("guest_no"),
            show: 0,
            options: {
                keyRandomize: false,
                randomizeClick: false,
                fixDeleteKey: true,
                stopPropagation: true,
            },

            cart_lists: [],
        }
    },

    methods: {
        itemRemove(index) {
            swal({
                title: "Confirm Your Action",
                text: "Would you like to delete this product ?",
                buttons: true,
                dangerMode: false,
            }).then((willDelete) => {
                if (willDelete) {
                    var cart = this.$root.cart;
                    cart.splice(index, 1);
                }
            });
        },

        addRemark(cart_list) {
            swal({
                title: "Order Note",
                content: 'input',
                buttons: true,
                dangerMode: true,
            }).then((value) => {
                cart_list.remark = value;
            });
        },

        reduceQty(cart_list, index) {
            if (cart_list.qty > 1) {
                cart_list.qty--;
            } else {
                // this.itemRemove(index);
            }
        },

        updateQty(cart_list, index) {
            cart_list.qty++;
        },

        totalQtyCalc(cart_temps) {
            let sum = 0;
            cart_temps.forEach(function (item) {
                sum += parseFloat(item.qty);
            });
            return sum;
        },

        totalPriceCalc(cart_temps) {
            let sum = 0;
            cart_temps.forEach(function (item) {
                sum += parseFloat(item.price);
            });
            return sum;
        },

        totalAmountCalc(cart_temps) {
            let sum = 0;
            cart_temps.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
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

        }
    },

    created() {
        this.cart_lists = this.$root.cart;
    }

}
</script>
<style>
.active {
    background-color: #ccced0;
}
</style>