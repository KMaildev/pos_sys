<template>
    <master>
        <div class="row">

            <!-- Ordre Item  -->
            <div class="col-xl-3 col-md-3 col-lg-3">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class=" align-middle mb-0 table-nowrap">
                                <thead class="table-light">
                                    <tr>
                                        <th style="width: 20px;">Name</th>
                                        <th style="width: 10px">Qty</th>
                                        <th style="width: 30px">Price</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <tr v-for="cart_temp in cart_temps" :key="cart_temp.id">
                                        <td>
                                            {{ cart_temp.menu_lists_table.menu_name }}
                                        </td>

                                        <td>
                                            {{ cart_temp.qty }}
                                        </td>

                                        <td>
                                            {{ cart_temp.price }}
                                        </td>

                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row mt-4">
                            <div class="col-sm-6">
                                <a href="ecommerce-products.html" class="btn btn-secondary">
                                    <i class="mdi mdi-arrow-left me-1"></i> Continue Shopping </a>
                            </div> <!-- end col -->
                            <div class="col-sm-6">
                                <div class="text-sm-end mt-2 mt-sm-0">
                                    <a href="ecommerce-checkout.html" class="btn btn-success">
                                        <i class="mdi mdi-cart-arrow-right me-1"></i> Checkout </a>
                                </div>
                            </div> <!-- end col -->
                        </div> <!-- end row-->
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

                    <div class="table-responsive" data-simplebar style="max-height: 395px;">
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
    }
}
</script>
<style>

</style>