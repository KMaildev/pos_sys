<template>
    <master :user_name="user_name" :login_time="login_time">
        <div class="row">
            <div class="col-md-4 col-lg-4 col-sm-12">
                <form @submit.prevent="searchTableName">
                    <input v-model="q" type="text" class="form-control form-control-lg bg-white search-inp"
                        placeholder="Search Table Name">
                </form>
            </div>

            <div class="col-md-8 col-lg-8 col-sm-12">
                <button class="floor_button" v-for="floors_category in floors_categories" :key="floors_category.id"
                    @click="searchFloorById(floors_category.id)">
                    {{ floors_category.title }}
                </button>
            </div>
        </div>

        <div class="ScrollStyle">
            <div class="row" v-for="floor in floors" :key="floor.id">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <h2 class="card-title floor_name">
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
        </div>
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
            q: '',
        }
    },

    props: [
        'floors',
        'floors_categories',
        'user_name',
        'login_time',
    ],

    methods: {
        setTableName(table_id, table_name) {
            if (table_id && table_name) {
                let type = 'Beverage';
                let category_id = null;
                localStorage.setItem("table_id", table_id);
                localStorage.setItem("table_name", table_name);
                this.$inertia.get(`/pos_menu?type=${type}&&category_id=${category_id}`);
                this.audioPlay()
            } else {
                this.alertMessage();
            }
        },

        searchTableName() {
            this.$inertia.get(`/pos_table_lists?table_name=${this.q}`);
        },

        searchFloorById(floor_id) {
            this.$inertia.get(`/pos_table_lists?floor_id=${floor_id}`);
        },

        audioPlay() {
            let song = new Audio();
            song.src = "/data/order_success.mp3";
            song.play();
        },

        alertMessage() {
            swal({
                title: "Please Select Table",
                icon: "warning",
                buttons: true,
                dangerMode: true,
            })
                .then((willDelete) => {
                    if (willDelete) {
                    }
                });
        },
    }
}
</script>
<style>
.floor_name {
    font-size: 25px;
    font-weight: bold;
    color: black;
}

.search-inp {
    font-size: 20px;
    width: 100%;
    padding: 10px 32px;
    background-color: #5C2B16;
    margin: 2px;
    color: white;
    height: 100%;
    border-color: gray;
}
</style>