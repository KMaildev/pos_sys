<template>
    <div>
        <master :user_name="user_name">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <button class="floor_button" v-for="floors_category in floors_categories" :key="floors_category.id"
                    @click="searchFloorById(floors_category.id)"
                    :class="current_floor_id == floors_category.id ? 'floor_bg_color' : ''">
                    {{ floors_category.title }}
                </button>
            </div>

            <div class="ScrollStyle">
                <div class="row py-2">
                    <div class="col-md-2 col-lg-2 col-sm-2 mb-4" v-for="table_list in table_lists" :key="table_list.id">
                        <div class="imgcontainer" @click="setTableName(table_list.id, table_list.table_name)">
                            <div v-if="table_list.order_infos_table">
                                <img :src="'/data/table_unavailable.png'" style="width: 100%;">
                                <div class="centered">
                                    <h6 style="font-size: 20px; font-weight: bold; color: black;">
                                        {{ table_list.table_name }}
                                    </h6>
                                    <p style="font-size: 20px; font-weight: bold; color: black">
                                        {{ table_list.order_infos_table.guest_no ?? '' }} M
                                    </p>
                                </div>
                            </div>
                            <div v-else>
                                <img :src="'/data/table_avaiblable.png'" style="width: 100%;">
                                <div class="centered">
                                    <h6 style="font-size: 20px; font-weight: bold; color: black;">
                                        {{ table_list.table_name }}
                                    </h6>
                                    <p style="font-size: 20px; font-weight: bold; color: black">
                                        Available
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
        'table_lists',
        'floors_categories',
        'user_name',
    ],

    methods: {
        setTableName(table_id, table_name) {
            if (table_id && table_name) {
                let type = 'Beverage';
                localStorage.setItem("table_id", table_id);
                localStorage.setItem("table_name", table_name);
                this.$inertia.get(`/pos_menu?type=${type}`);
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
    },

}
</script>
<style>
.floor_bg_color {
    background-color: red !important;
}

.imgcontainer {
    position: relative;
    text-align: center;
    color: white;
}

.centered {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}
</style>