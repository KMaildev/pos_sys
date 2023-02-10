<template>
    <div class="col-xl-6 col-md-6 col-lg-6 col-sm-12" style="height: 580px;">
        <div class="d-flex">
            <MainMenu></MainMenu>
        </div>

        <div class="row gx-3 gy-2 align-items-center py-2">
            <SearchForm></SearchForm>
        </div>

        <div class="row py-2 overflow-auto" style="max-height: calc(500px)">
            <div class="col-md-4 col-lg-4 col-sm-12" v-for="category in categories" :key="category.id"
                @click="loadMenuListPos(category.id)">
                <div class="card main-menu-box" :style="{ 'background-color': category.background_color }">
                    <span style="text-align: center; font-size: 17px;">
                        {{ category.title }}
                    </span>
                    <center>
                        <img v-if="category.photo" :src="`/images/${category.photo}`"
                            style="width: 80%; height: auto; object-fit: cover;  object-position: top; background-size: contain;" />
                    </center>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import MainMenu from './MainMenu.vue';
import SearchForm from './SearchForm.vue';

export default {
    name: "MainCategory",

    components: {
        MainMenu,
        SearchForm,
    },

    props: [
        'categories',
    ],

    methods: {
        loadMenuListPos(categorie_id) {
            this.$inertia.get(`/pos_menu_lists?categorie_id=${categorie_id}`);
        },
    },
}
</script>
<style>
.main-menu-box {
    height: 180px;
    min-height: 180px;
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