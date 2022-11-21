<template>
    <div class="col-xl-6 col-md-6 col-lg-6 col-sm-6">
        <div class="card">
            <h4 class="card-title mb-0 flex-grow-1 category_title">
                Category
                <span v-show="category_title">
                    - {{ category_title }}
                </span>
            </h4>
            <div class="table-responsive" data-simplebar style="max-height: calc(600px - 25px); padding-top: 5px;">
                <div class="row g-2">
                    <span class="data_not_found" v-if="menu_lists.length == 0">
                        Data Not Found
                    </span>
                    <div class="col-3" v-for="menu_list in menu_lists" :key="menu_list.id">
                        <button class="meal_btn" @click="cartTemp(menu_list.id, menu_list.price)"
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
        cartTemp(menu_list_id, price) {
            this.$inertia.get(`/store_cart_temp?menu_list_id=${menu_list_id}&price=${price}`);
        },
    },

}
</script>
<style>

</style>