<template>
    <div class="col-xl-5 col-md-5 col-lg-5 col-sm-5" style="height: 600px;">
        <div class="card">
            <h4 class="card-title mb-0 flex-grow-1 category_title">
                Category
                <span v-show="category_title">
                    - {{ category_title }}
                </span>
            </h4>
            <div class="overflow-auto" data-simplebar style="max-height: calc(530px);">
                <span class="data_not_found" v-if="menu_lists.length == 0">
                    Data Not Found
                </span>

                <div class="row" v-for="menu_list in menu_lists" :key="menu_list.id">
                    <div @click="addToCart(menu_list)" class="col meal_btn"
                        :style="{ 'background-color': menu_list.category_table.background_color }">
                        {{ menu_list.menu_name }}
                    </div>

                    <div @click="addToCart(menu_list)" class="col meal_btn"
                        :style="{ 'background-color': menu_list.category_table.background_color }">
                        {{ menu_list.menu_name_mm }}
                    </div>
                </div>

            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: "MenuList",

    props: [
        'menu_lists',
        'category_title',
    ],

    methods: {
        addToCart(menu_list) {
            var cart = this.$root.cart;
            var isInCart = cart.find(v => {
                return v.id == menu_list.id;
            });
            if (isInCart) {
                isInCart.qty++
            } else {
                cart.push({ ...menu_list, qty: 1, remark: '' });
            }
        },
    },

}
</script>
<style>

</style>