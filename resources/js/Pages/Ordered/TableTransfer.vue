<template>
    <div>
        <master :user_name="user_name">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <MenuButton :order_infos="order_infos"></MenuButton>
                </div>
            </div>
            <hr>
            <div class="ScrollStyle">

                <div class="row">
                    <div class="col-md-10 col-lg-10 col-sm-12">
                        <button class="floor_button" v-for="floors_category in floors_categories"
                            :key="floors_category.id" @click="searchFloorById(floors_category.id, order_infos.id)"
                            :class="current_floor_id == floors_category.id ? 'floor_bg_color' : ''">
                            {{ floors_category.title }}
                        </button>
                    </div>

                    <div class="col-md-2 col-lg-2 col-sm-12">
                        <button class="floor_button">
                            Current : {{ order_infos.table_lists_table.table_name }}
                        </button>
                    </div>
                </div>

                <div class="ScrollStyle">
                    <div class="row py-2">
                        <div class="col-md-2 col-lg-2 col-sm-2 mb-4" v-for="table_list in table_lists"
                            :key="table_list.id">

                            <div v-if="table_list.order_infos_table">
                                <div class="imgcontainer">
                                    <img :src="'/data/table_unavailable.png'" style="width: 100%; border-radius: 2%;">

                                    <div class="top-left text-black">
                                        {{ table_list.order_infos_table.order_user_name ?? '' }}
                                    </div>

                                    <div class="top-right text-black">
                                        G {{ table_list.order_infos_table.guest_no ?? '' }}
                                    </div>

                                    <div class="centered">
                                        <h6 style="font-size: 20px; font-weight: bold; color: black;">
                                            {{ table_list.table_name }}
                                        </h6>
                                    </div>

                                    <div class="bottom-left text-black">
                                        {{ table_list.order_infos_table.order_minutes ?? '' }}
                                    </div>

                                    <div class="bottom-right text-black">
                                        {{ table_list.order_infos_table.total_amount ?? '' }}
                                    </div>
                                </div>
                            </div>

                            <div v-else>
                                <div class="imgcontainer" @click="confirmTableTransfer(order_infos.id, table_list.id)">
                                    <img :src="'/data/table_avaiblable.png'" style="width: 100%; border-radius: 2%;">
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

            </div>
        </master>
    </div>
</template>

<script>
import Master from "../Layout/Master";
import MenuButton from "./MenuButton.vue";

export default {
    name: "TableTransfer",
    components: {
        Master,
        MenuButton,
    },

    data() {
        return {

        }
    },

    props: [
        'user_name',
        'login_time',
        'order_infos',

        'table_lists',
        'floors_categories',
    ],

    methods: {
        searchFloorById(floor_id, order_info_id) {
            this.$inertia.get(`/table_transfer?floor_id=${floor_id}&order_info_id=${order_info_id}`);
        },

        confirmTableTransfer(order_info_id, table_id) {
            if (order_info_id == null || table_id == null) {
                swal({
                    title: "Something Went Wrong!",
                    icon: "warning",
                    buttons: true,
                    dangerMode: true,
                })
            } else {
                swal({
                    title: "Confirm Table Transfer",
                    buttons: true,
                    dangerMode: false,
                }).then((willDelete) => {
                    if (willDelete) {
                        this.$inertia.get(`/confirm_table_transfer?order_info_id=${order_info_id}&&table_id=${table_id}`);
                    }
                });
            }

        }
    }
};
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

.bottom-left {
    position: absolute;
    bottom: 8px;
    left: 16px;
}

.top-left {
    position: absolute;
    top: 8px;
    left: 16px;
}

.top-right {
    position: absolute;
    top: 8px;
    right: 16px;
}

.bottom-right {
    position: absolute;
    bottom: 8px;
    right: 16px;
}


.number-field {
    height: 100px;
}
</style>