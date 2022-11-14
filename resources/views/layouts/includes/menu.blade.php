<div class="vertical-menu">
    <div data-simplebar class="h-100">

        <div id="sidebar-menu">
            <ul class="metismenu list-unstyled" id="side-menu">
                <li class="menu-title" data-key="t-menu">Menu</li>
                <li>
                    <a href="{{ route('home') }}">
                        <i data-feather="home"></i>
                        Dashboard
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


            </ul>
        </div>

    </div>
</div>
