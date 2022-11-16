{{-- Bill  --}}
<div class="col-md-3 col-lg-3 col-sm-3">
    <h3>
        Order Item Area
    </h3>
</div>

{{-- Menu List  --}}
<div class="col-md-7 col-lg-7 col-sm-7">
    <div class="row">
        @foreach ($menu_lists as $menu_list)
            <div class="col-md-3 col-lg-3 col-sm-12">
                <button class="menu_btn">
                    {{ $menu_list->menu_name ?? '' }}
                </button>
            </div>
        @endforeach
    </div>
    {{-- <div class="card-body px-0 pt-2">
        <div class="table-responsive px-3" data-simplebar="init" style="max-height: 395px;">
            <div class="simplebar-wrapper" style="margin: 0px -16px;">
                <div class="simplebar-height-auto-observer-wrapper">
                    <div class="simplebar-height-auto-observer"></div>
                </div>
                <div class="simplebar-mask">
                    <div class="simplebar-offset" style="right: -20px; bottom: -20px;">
                        <div class="simplebar-content-wrapper" style="height: auto;  overflow: scroll;">
                            <div class="simplebar-content">
                                <div class="row d-flex flex-nowrap">

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="simplebar-placeholder" style="width: auto; height: 454px;"></div>
            </div>
            <div class="simplebar-track simplebar-horizontal" style="visibility: visible;">
                <div class="simplebar-scrollbar"
                    style="width: 329px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
            </div>
            <div class="simplebar-track simplebar-vertical" style="visibility: visible;">
                <div class="simplebar-scrollbar"
                    style="height: 359px; transform: translate3d(0px, 0px, 0px); display: block;"></div>
            </div>
        </div>
    </div> --}}
</div>

{{-- Category  --}}
<div class="col-md-2 col-lg-2 col-sm-2">
    <div class="" style="background-color: #F4F5F8">
        <div class="card-body px-0">
            <div class="px-3" data-simplebar="init" style="max-height: 100%; height: 100%;">
                <div class="simplebar-wrapper">
                    <div class="simplebar-mask">
                        <div class="simplebar-offset" style="bottom: 0px;">
                            <div class="simplebar-content-wrapper"
                                style="height: auto; ; padding-bottom: 0px; overflow: hidden scroll;">
                                <div class="simplebar-content">
                                    @foreach ($categories as $categorie)
                                        <button class="category_btn"
                                            onclick="loadCategoryAndMenuListPos('{{ $categorie->type }}', {{ $categorie->id }})">
                                            {{ $categorie->title ?? '' }}
                                        </button>
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="simplebar-placeholder" style="width: auto; height: 550px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
