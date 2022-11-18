<template>
    <master>

        <div class="row" v-for="floor in floors" :key="floor.id">

            <div class="col-md-12 col-lg-12 col-sm-12">
                <h2 class="card-title" style="font-size: 25px;">
                    {{ floor.title }}
                </h2>
            </div>

            <div class="col-md-2 col-lg-2 col-sm-2" v-for="table_lists in floor.table_lists_table"
                :key="table_lists.id">
                <button class="table_btn" @click="setTableName(table_lists.id, table_lists.table_name)">
                    {{ table_lists.table_name }}
                </button>
            </div>

        </div>
        <hr>
    </master>
</template>
<script>

import Master from "../Layout/Master";

export default {
    name: "Index",
    components: {
        Master
    },

    data() {
        return {
            table_name: null,
        }
    },

    props: [
        'floors',
    ],

    methods: {
        setTableName(table_id, table_name) {
            if (table_id && table_name) {
                localStorage.setItem("table_id", table_id);
                localStorage.setItem("table_name", table_name);
                this.$inertia.get('/pos_test_page');
                this.audioPlay()
            } else {
                this.alertMessage();
            }
        },

        audioPlay() {
            let song = new Audio();
            song.src = "/data/order_success.mp3";
            song.play();
        },

        alertMessage() {
            alert('Error')
        },
    }
}
</script>
<style>
.main_category_btn {
    display: none;
}
</style>