<template>
    <div>
        <master :user_name="user_name">
            <div class="row">
                <div class="col-md-12 col-lg-12 col-sm-12">
                    <button class="floor_button">
                        Ordered
                    </button>
                </div>
            </div>

            <div class="ScrollStyle">
                <div class="row py-2">

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
    name: "OrderedDetail",
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

    },

};
</script>
<style>

</style>