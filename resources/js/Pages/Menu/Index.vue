<template>
    <master>
        <div class="row">
            <div class="col-md-3 col-lg-3 col-sm-3">
                <h3>
                    Order Item Area
                </h3>
            </div>

            <div class="col-md-7 col-lg-7 col-sm-7">
                <div class="row">
                    <h3>
                        Menu Lists
                    </h3>
                </div>
            </div>
   


            <div class="col-md-2 col-lg-2 col-sm-2">
                <button class="category_btn">
                    Beverage
                </button>
                <button class="category_btn">
                    Food
                </button>

                <button class="category_btn" v-for="category in categories" :key="category.id">
                    {{ category.title }}
                </button>
            </div>
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
}
</script>
<style>

</style>