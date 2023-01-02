<template>
    <div>
        <master :user_name="user_name" :login_time="login_time">
            <h1 style="color: white;">Table</h1>
        </master>
    </div>
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