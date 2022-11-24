<template>
    <div class="container-fluid">
        <div class="row py-1 d-flex justify-content-between">

            <div class="col-sm-2 col-lg-2 col-md-2 d-grid">
                <Link :href="route('cashier_main_page')" class="cashier_top_btn btn btn-success btn-lg block">
                Dashboard
                </Link>
            </div>

            <div class="col-sm-2 col-lg-2 col-md-2 d-grid">
                <Link :href="route('cashier_order')" class="cashier_top_btn btn btn-success btn-lg block">
                Order

                <span class="badge bg-danger rounded-pill badge_noti_count">
                    <i class="fa fa-bell"></i>
                    2000
                </span>
                </Link>
            </div>

            <div class="col-sm-2 col-lg-2 col-md-2 d-grid">
                <Link :href="route('completed_cashier_order')" class="cashier_top_btn btn btn-success btn-lg block">
                Completed
                </Link>
            </div>

            <div class="col-sm-2 col-lg-2 col-md-2 d-grid">
                <Link :href="route('cashier_customer')" class="cashier_top_btn btn btn-success btn-lg block">
                Customers
                </Link>
            </div>

        </div>
    </div>
</template>
<script>

export default {
    name: "TopLink",
}
</script>
<style>
/* Noti Count  */
.badge_noti_count {
    position: absolute;
    top: -10px;
    right: -7px;
    padding: 5px 5px;
    background-color: red;
    color: white;
}
</style>