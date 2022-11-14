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
