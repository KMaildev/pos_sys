<template>
    <div class="col-xl-3 col-md-3 col-lg-3">
        <div class="" style="background-color: white;">

            <h6 class="table_name_title">
                TBL / {{ table_name }} <br>
                {{ user_name }}
            </h6>

            <div class="card-body">
                <div class="receipt">
                    <table class="table" style="width: 100%">
                        <tr class="header">
                            <th style="font-size: 18px; width: 80px;">
                                Description
                            </th>
                            <th style="font-size: 18px; width: 20%; text-align: right;">
                                Qty
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
                        </tr>
                    </tbody>
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
        'user_name',
    ],

    created() {
        this.table_name = localStorage.getItem("table_name");
    },

}
</script>
<style>

</style>