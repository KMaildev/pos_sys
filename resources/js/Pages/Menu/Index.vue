<template>
    <master>
        <div class="row">
            <div class="col-md-3 col-lg-3 col-sm-3">
                <h3>
                    Order Item Area
                </h3>
            </div>

            <div class="col-md-6 col-lg-6 col-sm-6">
                <div class="row">
                    <h3>
                        Menu Lists
                    </h3>

                    <h2 v-for="menu_list in menu_lists" :key="menu_list.id">
                        {{ menu_list.menu_name }}
                    </h2>
                </div>
            </div>

            <div class="col-md-3 col-lg-3 col-sm-3">

                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-6">
                        <button class="category_btn1" @click="loadCategoryAndMenuListPos('Bar')">
                            Beverage
                        </button>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-6">
                        <button class="category_btn1" @click="loadCategoryAndMenuListPos('Food')">
                            Food
                        </button>
                    </div>
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
    ],

    methods: {
        loadCategoryAndMenuListPos(type, category_id = null) {
            this.$inertia.get(`/pos_menu/${type}/${category_id}`);
        }
    }
}
</script>
<style>

</style>