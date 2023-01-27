<div class="vertical-menu">
    <div data-simplebar class="h-100">

        <div id="sidebar-menu">
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title" data-key="t-menu" style="font-size: 18px;">
                    Menu
                </li>
                <li>
                    <a href="{{ route('home') }}">
                        <i data-feather="home"></i>
                        Dashboard
                    </a>
                </li>

                <li class="menu-title" data-key="t-menu" style="font-size: 18px;">
                    Manager
                </li>

                <li hidden>
                    <a href="{{ route('order_list.index') }}">
                        <i data-feather="align-justify"></i>
                        Order List
                    </a>
                </li>

                <li>
                    <a href="{{ route('customer.index') }}">
                        <i data-feather="user-check"></i>
                        Customer
                    </a>
                </li>

                <li>
                    <a href="{{ route('supplier.index') }}">
                        <i data-feather="user-check"></i>
                        Supplier
                    </a>
                </li>

                <li>
                    <a href="{{ route('category.index') }}">
                        <i data-feather="check"></i>
                        Category
                    </a>
                </li>

                <li>
                    <a href="{{ route('menu_list.index') }}">
                        <i data-feather="clipboard"></i>
                        Menu Lists
                    </a>
                </li>

                <li>
                    <a href="{{ route('ingredients.index') }}">
                        <i class="fas fa-align-right"></i>
                        Ingredients
                    </a>
                </li>

                <li>
                    <a href="{{ route('floor.index') }}">
                        <i class="fa fa-building"></i>
                        Floor
                    </a>
                </li>

                <li>
                    <a href="{{ route('table_list.index') }}">
                        <i class="fa fa-fas fa-chair"></i>
                        Table
                    </a>
                </li>

                <li class="menu-title" data-key="t-menu" style="font-size: 18px;">
                    Inventory
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i data-feather="shopping-cart"></i>
                        <span data-key="t-ecommerce">
                            Assets
                        </span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li>
                            <a href="{{ route('fixed_asset.index') }}" key="t-products">
                                Fixed Inventory
                            </a>
                        </li>

                        <li>
                            <a href="{{ route('variable_asset.index') }}" key="t-products">
                                Variable Inventory
                            </a>
                        </li>
                    </ul>
                </li>


                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i data-feather="shopping-cart"></i>
                        <span data-key="t-ecommerce">
                            Purchase
                        </span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li>
                            <a href="{{ route('fixed_purchase.index') }}" key="t-products">
                                Fixed Purchase
                            </a>
                        </li>

                        <li>
                            <a href="{{ route('variable_purchase.index') }}" key="t-products">
                                Variable Purchase
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i data-feather="shopping-cart"></i>
                        <span data-key="t-ecommerce">
                            Inventory Request
                        </span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li>
                            <a href="#" key="t-products">
                                Fixed Inventory
                            </a>
                        </li>

                        <li>
                            <a href="#" key="t-products">
                                Variable Inventory
                            </a>
                        </li>
                    </ul>
                </li>

                <li>
                    <a href="javascript: void(0);" class="has-arrow">
                        <i data-feather="shopping-cart"></i>
                        <span data-key="t-ecommerce">
                            Inventory Damage
                        </span>
                    </a>
                    <ul class="sub-menu" aria-expanded="false">
                        <li>
                            <a href="{{ route('fixed_damage.index') }}" key="t-products">
                                Fixed Inventory
                            </a>
                        </li>

                        <li>
                            <a href="{{ route('variable_damage.index') }}" key="t-products">
                                Variable Inventory
                            </a>
                        </li>
                    </ul>
                </li>


                <li class="menu-title" data-key="t-menu" style="font-size: 18px;">
                    HR
                </li>

                <li>
                    <a href="{{ route('employee.index') }}">
                        <i data-feather="users"></i>
                        Employee
                    </a>
                </li>

                <li>
                    <a href="{{ route('department.index') }}">
                        <i data-feather="check-square"></i>
                        Department
                    </a>
                </li>

                <li>
                    <a href="{{ route('role.index') }}">
                        <i data-feather="user"></i>
                        Role
                    </a>
                </li>

                <li>
                    <a href="{{ route('permission.index') }}">
                        <i data-feather="user-x"></i>
                        Permission
                    </a>
                </li>


                <li class="menu-title" data-key="t-menu" style="font-size: 18px;">
                    System
                </li>

                <li>
                    <a href="{{ route('payment_method.index') }}">
                        <i data-feather="user-x"></i>
                        Payment Method
                    </a>
                </li>

                <li>
                    <a href="{{ route('taxrate.index') }}">
                        <i data-feather="user-x"></i>
                        Taxrate
                    </a>
                </li>

                <li>
                    <a href="{{ route('store.index') }}">
                        <i data-feather="user-x"></i>
                        Store
                    </a>
                </li>


            </ul>
        </div>

    </div>
</div>
