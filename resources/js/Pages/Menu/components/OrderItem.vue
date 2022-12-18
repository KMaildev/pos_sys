<template>
    <div class="col-xl-4 col-md-4 col-lg-4">
        <div class="" style="background-color: white;">
            <div class="card-header d-flex">
                <h4 class="card-title mb-0 flex-grow-1 category_title"
                    style="font-size: 20px; font-weight: bold; text-align: left;">
                    TBL : {{ table_name }}
                </h4>
                <h4 class="card-title mb-0 flex-grow-1 category_title"
                    style="font-size: 20px; font-weight: bold; text-align: right;">
                    GUEST : <input type="number" style="width: 50px;" @click.stop="show = true" :value="value" readonly>
                </h4>
                <VueNumericKeypad :value.sync="value" :show.sync="show" :options="options" />
            </div>

            <div class="card-body" style="margin: 5px;">
                <table class="table">
                    <thead class="table-light">
                        <tr>
                            <th style="width: 40%; font-size: 18px;">
                                Items
                            </th>
                            <th class="text-center" style="width: 25%; font-size: 18px;">
                                Quantity
                            </th>
                            <th class="text-center" style="width: 20%; font-size: 18px;">
                                Price
                            </th>
                            <th class="text-center" style="width: 20%; font-size: 18px;">
                                Total
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="(cart_list, index) in cart_lists" :key="index">
                            <td v-on:click="addRemark(cart_list)">
                                {{ cart_list.menu_name }}
                                <br>
                                Remark: {{ cart_list.remark }}
                            </td>

                            <td class="text-center">
                                <div class="input-group">
                                    <input type="text" class="form-control" :value="cart_list.qty"
                                        style="width: 10px; font-size: 15px;" readonly>
                                    <span class="input-group-text" @click="reduceQty(cart_list, index)">
                                        <i class="fa fa-minus fa-lg"></i>
                                    </span>
                                </div>
                            </td>

                            <td style="text-align: center;" v-on:dblclick="itemRemove(index)">
                                {{ cart_list.price }}
                            </td>

                            <td style="text-align: right;" v-on:dblclick="itemRemove(index)">
                                {{ cart_list.qty * cart_list.price }}
                            </td>
                        </tr>

                    </tbody>
                </table>

            </div>
        </div>
    </div>
</template>
<script>
import VueNumericKeypad from "vue-numeric-keypad";
export default {
    name: "OrderItem",
    components: {
        VueNumericKeypad,
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
    },

    created() {
        document.addEventListener('click', function () {
            localStorage.setItem("guest_no", this.value);
            this.show = 0;
        }.bind(this));

        this.cart_lists = this.$root.cart;
    }

}
</script>
<style>
.active {
    background-color: #ccced0;
}
</style>