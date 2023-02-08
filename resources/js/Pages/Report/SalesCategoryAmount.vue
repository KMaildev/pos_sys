<template>
    <div>
        <master :user_name="user_name">
            <div class="ScrollStyle">
                <div class="row py-2">
                    <MenuButton></MenuButton>
                </div>

                <div class="row">
                    <ManagementButton></ManagementButton>
                </div>

                <div class="row">
                    <div class="col-md-4 col-lg-4 col-sm-4 py-3">
                        <form @submit.prevent="searchDate">
                            <div class="input-group">
                                <input type="date" class="form-control date_picker" v-model="form.start_date">
                                <input type="date" class="form-control date_picker" v-model="form.end_date">
                                <input type="submit" class="btn btn-dark" value="Search">
                            </div>
                        </form>
                    </div>

                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="table-responsive text-nowrap">
                            <table class="table table-bordered">
                                <thead class="table-light">
                                    <tr class="tablebg">
                                        <th class="text-center" style="width: 1%;">
                                            Sr
                                        </th>

                                        <th class="text-center">
                                            Menu Name
                                        </th>

                                        <th class="text-center">
                                            Types
                                        </th>

                                        <th class="text-center">
                                            Sales Amount
                                        </th>

                                        <th class="text-center">
                                            Sales Percentage
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="(menu_list, index) in menu_lists" :key="menu_list.id">
                                        <td class="text-center">
                                            {{ index + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ menu_list.menu_name ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ menu_list.category_table.title ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ saleAmount(menu_list) }}
                                        </td>

                                        <td class="text-center">
                                            {{ salesPercentage(menu_list) }} %
                                        </td>
                                    </tr>
                                </tbody>

                                <tr style="background-color: white;">
                                    <td colspan="3">
                                        Total
                                    </td>

                                    <!--Cash Rec-->
                                    <td class="text-center">
                                        {{ totalSaleAmount() }}
                                    </td>
                                </tr>

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
import MenuButton from "./components/MenuButton.vue";
import ManagementButton from "./components/ManagementButton.vue";

export default {
    name: "CashReport",
    components: {
        Master,
        MenuButton,
        ManagementButton
    },

    data() {
        return {
            form: {
                start_date: this.start_date,
                end_date: this.end_date,
            }
        }
    },

    props: [
        'user_name',
        'menu_lists',
        'order_items',
    ],

    methods: {
        saleAmount(menu_list) {
            let sum = 0;
            menu_list.order_items_table.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },

        salesPercentage(menu_list) {
            var total_amount = this.totalSaleAmount();

            let sale_amount = 0;
            menu_list.order_items_table.forEach(function (item) {
                sale_amount += +item.price;
            });

            if (sale_amount == 0) {
                return 0;
            }
            var salesPercentage = sale_amount / total_amount * 100;
            return salesPercentage.toLocaleString("en-US");
        },

        totalSaleAmount() {
            let sum = 0;
            this.order_items.forEach(function (item) {
                sum += (parseFloat(item.price) * parseFloat(item.qty));
            });
            return sum;
        },

        searchDate() {
            this.$inertia.get(`/pos_sales_category_amount`, this.form);
        }
    }
};
</script>
<style>

</style>