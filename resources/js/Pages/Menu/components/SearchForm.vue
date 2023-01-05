<template>
    <div>
        <form @submit.prevent="search">
            <div class="hstack gap-3">
                <input class="form-control me-auto form-control-lg" type="text" v-model="form.q">
                <button type="submit" class="btn btn-secondary btn-lg">
                    Search
                </button>
            </div>
        </form>
    </div>
</template>

<script>
export default {
    name: "SearchForm",

    data() {
        return {
            form: {
                q: this.q,
            }
        }
    },

    methods: {
        search() {
            this.$inertia.get(`/pos_menu_lists_search?search=${this.form.q}`);
        }
    },
}
</script>