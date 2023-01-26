<template>
    <div>
        <master :user_name="user_name">
            <div class="ScrollStyle">
                <div class="row py-2">
                    <MenuButton></MenuButton>
                </div>

                <div class="row">
                    <SaleButton></SaleButton>
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

                                        <th class="text-center" style="width: 10%;">
                                            Date
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Menu Name
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Qty
                                        </th>

                                        <th class="text-center" style="width: 10%;">
                                            Reason
                                        </th>

                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="(void_item, index) in void_items" :key="void_item.id">
                                        <td class="text-center">
                                            {{ index + 1 }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.void_date ?? '' }}
                                            {{ void_item.void_time ?? '' }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.menu_list_table.menu_name }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.qty }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.reason }}
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
import MenuButton from "./components/MenuButton.vue";
import SaleButton from "./components/SaleButton.vue";
import swal from 'sweetalert2';
window.Swal = swal;

export default {
    name: "SalesReport",
    components: {
        Master,
        MenuButton,
        SaleButton
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
        'void_items'
    ],

    methods: {
        searchDate() {
            this.$inertia.get(`/pos_void_report`, this.form);
        }
    }
};
</script>
<style>

</style>