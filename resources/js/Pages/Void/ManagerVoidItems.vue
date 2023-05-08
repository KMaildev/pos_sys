<template>
    <div>
        <master :user_name="user_name">
            <div class="ScrollStyle">
                <div class="row py-2">
                    <div class="row">
                        <div class="col-md-4 col-lg-4 col-sm-4 py-3">
                            <form @submit.prevent="searchDate">
                                <div class="input-group">
                                    <input type="date" class="form-control date_picker" v-model="form.start_date">
                                    <input type="date" class="form-control date_picker" v-model="form.end_date">
                                    <input type="submit" class="btn btn-dark" value="Search">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-12 col-sm-12">
                        <div class="card-body overflow-auto" style="background-color: white;">
                            <table class="table">
                                <thead class="table-light">
                                    <tr>
                                        <th class="text-center" style="font-size: 18px;">
                                            Table
                                        </th>
                                        <th class="text-center" style="font-size: 18px;">
                                            Items
                                        </th>
                                        <th class="text-center" style="font-size: 18px;">
                                            Qty
                                        </th>
                                        <th class="text-center" style="font-size: 18px;">
                                            Price
                                        </th>
                                        <th class="text-center" style="font-size: 18px;">
                                            Date & Time
                                        </th>
                                        <th class="text-center" style="font-size: 18px;">
                                            Reason
                                        </th>
                                        <th class="text-center" style="font-size: 18px;">
                                            Void By
                                        </th>
                                        <th class="text-center" style="font-size: 18px;">
                                            Status
                                        </th>
                                        <th class="text-center" style="font-size: 18px;">
                                            Action
                                        </th>
                                    </tr>
                                </thead>
                                <tbody style="background-color: white;">
                                    <tr v-for="void_item in void_items" :key="void_item.id">
                                        <td class="text-center">
                                            {{ void_item.table_list_table.table_name }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.menu_list_table.menu_name }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.qty }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.price }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.void_date }}
                                            {{ void_item.void_time }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.reason }}
                                        </td>

                                        <td class="text-center">
                                            {{ void_item.void_by_table.name }}
                                        </td>

                                        <td class="text-center">
                                            <span v-if="void_item.manager_status == 'nothing'">
                                                <span class="badge bg-danger">Pending</span>
                                            </span>

                                            <span v-if="void_item.manager_status == 'reject'">
                                                <span class="badge bg-primary">Reject</span>
                                            </span>

                                            <span v-if="void_item.manager_status == 'done'">
                                                <span class="badge bg-success">Done</span>
                                            </span>
                                        </td>

                                        <td class="text-center">
                                            <div v-if="void_item.manager_status == 'nothing'">
                                                <span class="btn btn-sm btn-success" @click="AcceptVoidItem(void_item.id)">
                                                    <i class="fa fa-plus"></i>
                                                    Accept
                                                </span>

                                                <span class="btn btn-sm btn-danger" @click="RejectVoidItem(void_item.id)">
                                                    <i class="fa fa-plus"></i>
                                                    Reject
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
    name: "ManagerVoidItems",
    components: {
        Master
    },


    data() {
        return {
            form: {
                start_date: this.start_date,
                end_date: this.end_date,
            }
        }
    },

    props: [
        'void_items',
        'user_name',
    ],

    methods: {
        AcceptVoidItem(id) {
            this.$inertia.get(`/manager_void_item_accept?id=${id}`);
        },

        RejectVoidItem(id) {
            this.$inertia.get(`/manager_void_item_reject?id=${id}`);
        },

        searchDate() {
            this.$inertia.get(`/manager_void_item`, this.form);
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