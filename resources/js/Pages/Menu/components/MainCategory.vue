<template>
    <div class="col-xl-3 col-md-3 col-lg-3">
        <div class=" d-flex justify-content-between">

            <button class="main_category_food_btn" @click="loadCategoryAndMenuListPos('Food')">
                Food
            </button>

            <button class="main_category_bev_btn" @click="loadCategoryAndMenuListPos('Beverage')">
                BEV
            </button>

            <button class="main_category_bar_btn" @click="loadCategoryAndMenuListPos('Bar')">
                Bar
            </button>

        </div>
        <button class="category_btn" v-for="category in categories" :key="category.id"
            @click="loadCategoryAndMenuListPos(category.type, category.id)"
            :style="{ 'background-color': category.background_color }">
            {{ category.title }}
        </button>
    </div>
</template>
<script>
export default {
    name: "MainCategory",

    props: [
        'categories',
    ],

    methods: {
        loadCategoryAndMenuListPos(type, category_id = null) {
            this.$inertia.get(`/pos_menu/${type}/${category_id}`);
        },
    },
}
</script>
<style>

</style>