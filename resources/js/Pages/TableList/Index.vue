<template>
    <div>
        <master :user_name="user_name">
            <div class="row">
                <div class="col-md-10 col-lg-10 col-sm-12">
                    <button class="floor_button" v-for="floors_category in floors_categories" :key="floors_category.id"
                        @click="searchFloorById(floors_category.id)"
                        :class="current_floor_id == floors_category.id ? 'floor_bg_color' : ''">
                        {{ floors_category.title }}
                    </button>
                </div>

                <div class="col-md-2 col-lg-2 col-sm-12">
                    <button @click="guestDetailIndex()" class="guest_detail_btn">
                        Gust Details
                    </button>
                </div>
            </div>

            <div class="ScrollStyle">
                <div class="row py-2">
                    <div class="col-md-2 col-lg-2 col-sm-2 mb-4" v-for="table_list in table_lists" :key="table_list.id">
                        <div v-if="table_list.order_infos_table">
                            <!-- @click="orderedDetail(table_list.order_infos_table.id)" -->
                            <div class="imgcontainer" @click="showOrderInfos(table_list.id)">
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
                                    {{ totalAmount(table_list.all_order_infos_table) }}
                                </div>
                            </div>
                        </div>
                        <div v-else>
                            <!-- @click="setTableName(table_list.id, table_list.table_name)" -->
                            <div class="imgcontainer"
                                @click="showGuestsNumberModal(table_list.id, table_list.table_name)">
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

            <!-- Number Of Guest Modal  -->
            <div class="modal fade" id="numberOfGuestsModal" data-bs-backdrop="static" data-bs-keyboard="false"
                tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: black;">
                            <h5 class="modal-title" id="exampleModalLabel" style="color: white;">
                                Number of Guests
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                                style="color: white;">
                                <i class="fas fa-x fa-2xl"></i>
                            </button>
                        </div>

                        <div class="modal-body py-5">
                            <div class="d-flex justify-content-between"
                                style="border: 1px solid black; border-radius: 10px;">
                                <button type="button" class="btn btn-dark btn-lg" v-on:click="reduceGuestNo()">
                                    <i class="fas fa-arrow-circle-down"></i>
                                </button>

                                <button type="button" class="btn btn btn-lg text-black"
                                    style="background-color: white; width: 100%;">
                                    {{ value }}
                                </button>

                                <button type="button" class="btn btn-dark btn-lg" v-on:click="addGuestNo()">
                                    <i class="fas fa-arrow-alt-circle-up "></i>
                                </button>
                            </div>
                            <br><br>
                            <div class="d-flex justify-content-between">
                                <button type="button" class="btn btn-dark btn-lg block" style="width: 100%;"
                                    @click="setTableName()">
                                    Confirm
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="modal fade" id="showOrderInfosModal" data-bs-backdrop="static" data-bs-keyboard="false"
                tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-sm">
                    <div class="modal-content">
                        <div class="modal-header" style="background-color: black;">
                            <h5 class="modal-title" id="exampleModalLabel" style="color: white;">
                                Choose Order
                            </h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                                style="color: white;">
                                <i class="fas fa-x fa-2xl"></i>
                            </button>
                        </div>

                        <div class="modal-body">
                            <table class="table">
                                <tbody style="background-color: white;">
                                    <tr v-for="choose_order_info in choose_order_infos" :key="choose_order_info.id">
                                        <td @click="orderedDetail(choose_order_info.id)">
                                            <div class="d-flex justify-content-between">
                                                <span class="py-1">
                                                    {{ choose_order_info.order_no }}
                                                </span>

                                                <span class="py-1">
                                                    {{ choose_order_info.total_amount }}
                                                </span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </master>
    </div>
</template>

<script>
import Master from "../Layout/Master";
import swal from 'sweetalert2';
window.Swal = swal;

export default {
    name: "Index",
    components: {
        Master
    },

    data() {
        return {
            q: '',
            value: localStorage.getItem("guest_no"),
        }
    },

    props: [
        'table_lists',
        'floors_categories',
        'user_name',
        'choose_order_infos'
    ],

    methods: {

        showGuestsNumberModal(table_id, table_name) {
            localStorage.setItem("table_id", table_id);
            localStorage.setItem("table_name", table_name);
            $('#numberOfGuestsModal').modal('show');
        },

        addGuestNo() {
            this.value++;
            localStorage.setItem("guest_no", this.value);
        },

        reduceGuestNo() {
            var guest_n = this.value;
            if (guest_n > 1) {
                this.value--;
                localStorage.setItem("guest_no", this.value);
            } else {
            }

        },

        setTableName() {
            $('#numberOfGuestsModal').modal('hide');
            let type = 'Beverage';
            this.$inertia.get(`/pos_menu?type=${type}`);
            this.audioPlay()
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

        guestDetailIndex() {
            this.$inertia.get(`/pos_guest_index`);
        },

        orderedDetail(id) {
            $('#showOrderInfosModal').modal('hide');
            this.$inertia.get(`/ordered_detail/${id}`);
        },

        showOrderInfos(table_id) {
            axios.get(`/choose_order_infos?table_id=${table_id}`)
                .then(response => (this.choose_order_infos = response.data.choose_order_infos));
            $('#showOrderInfosModal').modal('show');
        },

        totalAmount(order_infos) {
            let sum = 0;
            order_infos.forEach(function (order_info) {
                sum += parseFloat(order_info.total_amount);
            });
            return sum;
        },
    },

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