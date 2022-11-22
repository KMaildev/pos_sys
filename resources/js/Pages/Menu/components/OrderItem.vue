<template>
    <div class="col-xl-3 col-md-3 col-lg-3">

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
                    <tr class="header">
                        <th style="font-size: 16px; width: 50px;">
                            Description
                        </th>
                        <th style="font-size: 16px; width: 20%; text-align: right;">
                            Qty
                        </th>
                        <th style="font-size: 16px; width: 20%; text-align: right;">
                            Price
                        </th>
                        <th style="font-size: 16px; width: 20%; text-align: right;">
                            Amount
                        </th>
                    </tr>
                </table>

                <tbody>
                    <tr v-for="cart_temp in cart_temps" :key="cart_temp.id"
                        :class="activeItemId == cart_temp.id ? 'active' : ''"
                        @click="currentCartTemp(cart_temp.id, cart_temp.menu_lists_table.menu_name, cart_temp.qty)"
                        v-on:dblclick="MinusQty(cart_temp.id)">

                        <td style="width: 200px; padding: 3px;">
                            {{ cart_temp.menu_lists_table.menu_name }}
                        </td>

                        <td style="width: 20%; padding: 3px; text-align: right;">
                            {{ cart_temp.qty }}
                        </td>

                        <td style="width: 20%; padding: 3px; text-align: right;">
                            {{ cart_temp.price }}
                        </td>

                        <td style="width: 20%; padding: 3px; text-align: right;">
                            {{ amountCalc(cart_temp) }}
                        </td>
                    </tr>
                </tbody>

                <table class="table">
                    <tr class="header">
                        <th style="font-size: 16px; width: 50px;">
                            Subtotal
                        </th>
                        <th style="font-size: 16px; width: 20%; text-align: right;">
                            {{ totalQtyCalc(cart_temps) }}
                        </th>
                        <th style="font-size: 16px; width: 20%; text-align: right;">
                            {{ totalPriceCalc(cart_temps) }}
                        </th>
                        <th style="font-size: 16px; width: 20%; text-align: right;">
                            {{ totalAmountCalc(cart_temps) }}
                        </th>
                    </tr>
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
        'cart_temps',
        'user_name',
    ],

    data() {
        return {
            table_name: localStorage.getItem("table_name"),
            activeItemId: '',
            menuName: '',
            qty: 0,

            value: localStorage.getItem("guest_no"),
            show: 0,
            options: {
                keyRandomize: false,
                randomizeClick: false,
                fixDeleteKey: true,
                stopPropagation: true,
            },
        }
    },

    methods: {
        currentCartTemp(cart_temp_id, menu_name, qty) {
            this.activeItemId = cart_temp_id;
            this.menuName = menu_name;
            this.qty = qty;

            localStorage.setItem("activeItemId", cart_temp_id);
            localStorage.setItem("menuName", menu_name);
            localStorage.setItem("current_qty", qty);
        },

        MinusQty(cart_temp_id) {
            this.$inertia.get(`/minus_qty?cart_temp_id=${cart_temp_id}`);
        },

        amountCalc(cart_temp) {
            return cart_temp.price * cart_temp.qty;
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
    }

}
</script>
<style>
.active {
    background-color: #ccced0;
}
</style>