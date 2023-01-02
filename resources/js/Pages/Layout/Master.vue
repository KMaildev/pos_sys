<template>
    <div>
        <header id="page-topbar">
            <div class="navbar-header">
            </div>
        </header>

        <div class="vertical-menu py-5" style="background-color: #333333;">
            <div data-simplebar class="h-100">
                <div id="sidebar-menu">
                    <ul class="metismenu list-unstyled d-flex align-items-end flex-column" id="side-menu">

                        <li style="width: 90%;">
                            <Link :href="route('pos_table_lists')" class="btn btn-default menubtn">
                            <i class="fa fa-table text-white" style="font-size: 23px;"></i>
                            &nbsp;&nbsp;&nbsp;
                            Reservation
                            </Link>
                        </li>

                        <br>
                        <li style="width: 90%;">
                            <a href="#" class="btn btn-default menubtn">
                                <i class="fa fa-kitchen-set text-white" style="font-size: 23px;"></i>
                                &nbsp;&nbsp;&nbsp;
                                Menu
                            </a>
                        </li>

                        <br>
                        <li style="width: 90%;">
                            <a href="#" class="btn btn-default menubtn">
                                <i class="fa-solid fa-dollar-sign text-white" style="font-size: 23px;"></i>
                                &nbsp;&nbsp;&nbsp;
                                Bill
                            </a>
                        </li>

                        <br>
                        <li style="width: 90%;">
                            <a href="#" class="btn btn-default menubtn">
                                <i class="fa fa-chart-line text-white" style="font-size: 23px;"></i>
                                &nbsp;&nbsp;&nbsp;
                                Report
                            </a>
                        </li>

                        <li style="width: 90%;">
                            <div class="d-flex align-items-end" style="height: 200px;">
                                <div class="mt-auto" style="width: 100%">
                                    <a href="/pos_pin_logout" class="btn btn-default menubtn">
                                        <i class="fa fa-table text-white" style="font-size: 23px;"></i>
                                        &nbsp;&nbsp;&nbsp;
                                        Sign Out
                                    </a>
                                </div>
                            </div>
                        </li>

                    </ul>
                </div>
            </div>
        </div>

        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <slot />
                </div>
            </div>
        </div>

    </div>
</template>
<script>
export default {
    name: "Master",
    props: [
        'user_name',
        'login_time',
    ],

    data() {
        return {
            currentRoute: route().current(),
        }
    },

};
</script>
<style>
.menubtn {
    width: 100%;
    background-color: #717171;
    color: white !important;
    text-align: left;
    font-size: 18px !important;
    font-weight: bold;
    border-radius: 20px 0px 0px 20px;
}

.menubtn:hover {
    width: 100%;
    background-color: #717171;
    color: white !important;
    text-align: left;
    font-size: 18px !important;
    font-weight: bold;
    border-radius: 20px 0px 0px 20px;
}
</style>