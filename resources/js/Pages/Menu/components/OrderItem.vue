<template>
    <div class="col-xl-3 col-md-3 col-lg-3">
        <div class="" style="background-color: white;">

            <div class="card-header d-flex">
                <h4 class="card-title mb-0 flex-grow-1 category_title" style="font-size: 20px; font-weight: bold;">
                    TBL / {{ table_name }}
                </h4>
                <h4 class="card-title mb-0 flex-grow-1 category_title" style="font-size: 20px; font-weight: bold;">
                    Guest : 10
                </h4>
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
                    <tr v-for="cart_temp in cart_temps" :key="cart_temp.id" @click="orderNote()">
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
                            {{ totalItem }}
                            {{ totalAmountCalc(cart_temps) }}
                        </th>
                    </tr>
                </table>

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
        'user_name',
    ],

    created() {
        this.table_name = localStorage.getItem("table_name");
    },

    methods: {
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

}
</script>
<style>

</style>