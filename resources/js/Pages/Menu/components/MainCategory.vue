<template>
    <div class="col-xl-6 col-md-6 col-lg-6 col-sm-12" style="height: 580px;">
        <div class="d-flex">
            <button class="floor_button" @click="loadCategoryAndMenuListPos('Food')">
                Food
            </button>
            <button class="floor_button" @click="loadCategoryAndMenuListPos('Beverage')">
                Beverage
            </button>
        </div>

        <div class="row overflow-auto" style="max-height: calc(550px)">
            <div class="col-md-4 col-lg-4 col-sm-12" v-for="category in categories" :key="category.id">
                <div class="card main-menu-box" :style="{ 'background-color': category.background_color }">
                    <h6 class="centered">
                        {{ category.title }}
                    </h6>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    name: "MainCategory",

    props: [
        'categories',
    ],

    methods: {
        loadCategoryAndMenuListPos(type) {
            this.$inertia.get(`/pos_menu?type=${type}`);
        },
    },
}
</script>
<style>
.main-menu-box {
    height: 150px;
}

.centered {
    font-size: 20px;
    font-weight: bold;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
</style>