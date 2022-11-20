<template>
    <master>
        <div class="row">
            <!-- Ordre Item  -->
            <div class="col-xl-3 col-md-3 col-lg-3">
                <div class="" style="background-color: white; padding: 10px;">
                    <h4 class="card-title" style="font-size: 15px; padding: 2px;">
                        TBL / {{ table_name }}
                    </h4>
                    <div class="card-body">
                        <div class="receipt">
                            <table class="table" style="width: 100%">
                                <tr class="header">
                                    <th style="font-size: 18px; width: 80%;">
                                        Description
                                    </th>
                                    <th style="font-size: 18px; width: 20%; text-align: right;">
                                        Qty
                                    </th>
                                </tr>
                            </table>
                            <tbody>
                                <tr v-for="cart_temp in cart_temps" :key="cart_temp.id" @click="orderNote()">
                                    <td style="width: 80%; padding: 3px;">
                                        {{ cart_temp.menu_lists_table.menu_name }}
                                    </td>

                                    <td style="width: 20%; padding: 3px; text-align: right;">
                                        {{ cart_temp.qty }}
                                    </td>
                                </tr>
                            </tbody>
                        </div>
                        <div class="row mt-4">
                            <div class="col-sm-6">
                                <a href="ecommerce-products.html" class="btn btn-secondary">
                                    <i class="mdi mdi-arrow-left me-1"></i>
                                    Continue Shopping
                                </a>
                            </div>
                            <div class="col-sm-6">
                                <div class="text-sm-end mt-2 mt-sm-0">
                                    <a href="ecommerce-checkout.html" class="btn btn-success">
                                        <i class="mdi mdi-cart-arrow-right me-1"></i> Checkout </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Menu Meal List  -->
            <div class="col-xl-6 col-md-6 col-lg-6 col-sm-6">
                <div class="card">
                    <div class="card-header align-items-center d-flex">
                        <h4 class="card-title mb-0 flex-grow-1 category_title">
                            Category
                            <span v-show="category_title">
                                - {{ category_title }}
                            </span>
                        </h4>
                        <div class="flex-shrink-0">
                            <form @submit.prevent="searchMenuName">
                                <input v-model="q" type="text" class="form-control form-control-lg bg-white search-inp"
                                    placeholder="Search">
                            </form>
                        </div>
                    </div>

                    <div class="table-responsive" data-simplebar style="max-height: 1200px;">
                        <div class="row g-2">
                            <span class="data_not_found" v-if="menu_lists.length == 0">
                                Data Not Found
                            </span>
                            <div class="col-3" v-for="menu_list in menu_lists" :key="menu_list.id">
                                <button class="meal_btn" @click="cartTemp(menu_list.id, menu_list.price)">
                                    {{ menu_list.menu_name }}
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Category  -->
            <div class="col-xl-3 col-md-3 col-lg-3">
                <div class="d-flex justify-content-between">
                    <button class="main_category_btn" @click="loadCategoryAndMenuListPos('Bar')">
                        Beverage
                    </button>

                    <button class="main_category_btn" @click="loadCategoryAndMenuListPos('Food')">
                        Food
                    </button>
                </div>
                <button class="category_btn" v-for="category in categories" :key="category.id"
                    @click="loadCategoryAndMenuListPos(category.type, category.id)">
                    {{ category.title }}
                </button>
            </div>


            <div class="col-xl-12 col-md-12 col-lg-12">
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="text-sm-end d-none d-sm-block">
                                    Design & Develop by <a href="#!" class="text-decoration-underline">Themesbrand</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>

        </div>
    </master>
</template>
<script>
import Master from "../Layout/Master";

export default {
    components: {
        Master
    },
    name: "Index",

    props: [
        'categories',
        'menu_lists',
        'category_title',
        'type',
        'category_id',
        'cart_temps',
        'table_name',
    ],

    data() {
        return {
            q: '',
        }
    },

    methods: {
        loadCategoryAndMenuListPos(type, category_id = null) {
            this.$inertia.get(`/pos_menu/${type}/${category_id}`);
        },

        cartTemp(menu_list_id, price) {
            this.$inertia.get(`/store_cart_temp?menu_list_id=${menu_list_id}&price=${price}`);
        },

        searchMenuName() {
            this.$inertia.get(`/pos_menu/${type}/${category_id}`);
        },
    },

    created() {
        this.table_name = localStorage.getItem("table_name");
        this.table_id = localStorage.getItem("table_id");
    },
}
</script>
<style>

</style>