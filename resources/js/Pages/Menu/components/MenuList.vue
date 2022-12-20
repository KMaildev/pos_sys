<template>
    <div class="col-xl-5 col-md-5 col-lg-5 col-sm-5">
        <div class="card">
            <h4 class="card-title mb-0 flex-grow-1 category_title">
                Category
                <span v-show="category_title">
                    - {{ category_title }}
                </span>
            </h4>
            <div class="table-responsive overflow-auto" data-simplebar style="max-height: calc(500px); padding-top: 5px;">
                <div class="row g-2">
                    <span class="data_not_found" v-if="menu_lists.length == 0">
                        Data Not Found
                    </span>
                    <div class="col-3" v-for="menu_list in menu_lists" :key="menu_list.id">
                        <button class="meal_btn" @click="addToCart(menu_list)"
                            :style="{ 'background-color': menu_list.category_table.background_color }">
                            {{ menu_list.menu_name }}
                        </button>
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