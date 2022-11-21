<template>
    <master>
        <div class="row">
            <div class="col-md-9">
                <p>
                    Lorem, ipsum dolor sit amet consectetur adipisicing elit. Vel sed hic facilis in sunt et neque
                    maxime, commodi veniam delectus eum aut beatae mollitia dolor id, laboriosam voluptatem
                    quibusdam!
                    Sapiente?
                </p>
            </div>

            <div class="col-md-3">
                <div class="d-grid gap-2 float-end">

                    <div class="py-3">
                        <button class="btn btn-lg btn-default float-end top_btn" type="button"
                            style="background-color: #7bbf3b;">
                            Begin CHK
                        </button>
                    </div>

                    <div class="py-3">
                        <Link :href="route('pos_table_lists')" class="btn btn-lg btn-default float-end top_btn"
                            style="background-color: #ede98b;">
                        Pick Up CHK
                        </Link>
                    </div>

                    <div class="py-3">
                        <button class="btn btn-lg btn-default float-end top_btn" type="button"
                            style="background-color: #e59490;">
                            Function
                        </button>
                    </div>

                    <div class="py-3">
                        <button class="btn btn-lg btn-default float-end top_btn" type="button"
                            style="background-color: #90c8f9;">
                            Gust Detail
                        </button>
                    </div>

                    <div class="py-3">
                        <button class="btn btn-lg btn-default float-end top_btn" type="button"
                            style="background-color: #bc2d25;">
                            Cancel / SignOut
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </master>
</template>
<script>

import Master from "../Layout/Master";

export default {
    components: {
        Master
    },
    name: "Index",

    methods: {
        posTableList() {
            this.$inertia.get(`/pos_table_lists`);
        }
    }
}
</script>
<style>

</style>