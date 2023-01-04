<template>
    <div>
        <button class="floor_button" @click="loadCategoryAndMenuListPos('Food')">
            Food
        </button>
        <button class="floor_button" @click="loadCategoryAndMenuListPos('Beverage')">
            Beverage
        </button>
    </div>
</template>

<script>
export default {
    name: "MainMenu",

    methods: {
        loadCategoryAndMenuListPos(type) {
            this.$inertia.get(`/pos_menu?type=${type}`);
        },
    },
}
</script>