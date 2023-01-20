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
                        <div class="card-body overflow-auto" style="background-color: white;">
                            <table class="table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="text-center" style="width: 25%; font-size: 18px;">
                                            Qty
                                        </th>
                                        <th class="text-center" style="width: 25%; font-size: 18px;">
                                            Items
                                        </th>
                                        <th class="text-center" style="width: 25%; font-size: 18px;">
                                            Price
                                        </th>
                                        <th class="text-center" style="width: 25%; font-size: 18px;">
                                            Qty
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="order_item in order_infos.order_items_table" :key="order_item.id">

                                        <td class="text-center">
                                            {{ order_item.qty }}
                                        </td>

                                        <td class="text-center">
                                            {{ order_item.menu_name }}
                                        </td>

                                        <td class="text-center">
                                            {{ order_item.price }}
                                        </td>

                                        <td class="text-center">
                                            {{ order_item.qty }}
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },


        setTableName(table_id, table_name, guest_no) {
            if (table_id && table_name) {
                let type = 'Beverage';
                localStorage.setItem("table_id", table_id);
                localStorage.setItem("table_name", table_name);
                localStorage.setItem("guest_no", guest_no);
                this.$inertia.get(`/pos_menu?type=${type}`);
            } else {
                this.alertMessage();
            }
        },
    }
};
</script>
<style>

</style>