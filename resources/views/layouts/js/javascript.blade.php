{{-- Main --}}
<script>
    $('#searchOrderList').on('input', function() {
        searchOrderList();
    });

    function searchOrderList() {
        var keyword = $('#searchOrderList').val();
        var url = '{{ url('get_order_list_ajax') }}';
        $.ajax({
            url: url,
            method: "GET",
            data: {
                keyword: keyword,
            },
            success: function(data) {
                showCounterOrderLists(data);
            }
        });
    }

    // Get All Order 
    function getOrderLists() {
        var url = '{{ url('get_order_list_ajax') }}';
        $.ajax({
            url: url,
            method: "GET",
            success: function(data) {
                showCounterOrderLists(data);
            }
        });
    }
    setInterval(getOrderLists, 10000); // 10000 = 10 Sec 3000 = 3
    getOrderLists();


    function showCounterOrderLists(res) {
        let order_info = '';
        for (let i = 0; i < res.order_infos.length; i++) {
            order_info += '<tr class="show_invoice_items" data-id="' + res.order_infos[i].id + '">';

            order_info += '<td class="text-center">';
            order_info += i + 1;
            order_info += '</td>';

            // Invoice
            order_info += '<td class="text-center">';
            order_info += res.order_infos[i].inv_no;
            order_info += '</td>';

            // Order No	
            order_info += '<td class="text-center">';
            order_info += res.order_infos[i].order_no;
            order_info += '</td>';

            // Order Date & Time	
            order_info += '<td class="text-center">';
            order_info += res.order_infos[i].order_date_time;
            order_info += '</td>';

            // Table Name 
            order_info += '<td class="text-center">';
            order_info += res.order_infos[i].table_lists_table.table_name;
            order_info += '</td>';

            // Waiter
            order_info += '<td class="text-center">';
            order_info += res.order_infos[i].waiter_user_table.name;
            order_info += '</td>';

            // Total Amount 
            order_info += '<td class="text-center">';
            order_info += res.order_infos[i].total_amount;
            order_info += '</td>';

            // Action
            order_info += '<td class="text-center">';
            order_info +=
                '<button type="button" class="waves-effect waves-light btn btn-success btn-sm">Checkout</button>';
            order_info += '</td>';

            order_info += '</tr>';
        }

        if (res.order_infos.length <= 0) {
            order_info += '<h1 style="color: red; padding: 20px;">';
            order_info += 'No data found.';
            order_info += '</h1>';
        }

        $('#orderList').html(order_info);
    }
</script>


{{-- POS --}}
{{-- <script>
    // Load Show Table 
    function loadTablePos() {
        $(".main_category_btn").hide();
        var url = '{{ url('load_table_pos') }}';
        $.ajax({
            url: url,
            method: "GET",
            success: function(data) {
                console.log(data);
                $('.viewRenderRoot').html(data.html);
            }
        });
    }
    loadTablePos();


    // Load Menu List 
    function loadCategoryAndMenuListPos(type, category_id = null) {
        $('.main_category_btn').css({
            'display': 'block'
        });

        var url = '{{ url('load_category_and_menu_pos') }}';
        $.ajax({
            url: url + '/' + type + '/' + category_id,
            method: "GET",
            success: function(data) {
                console.log(data);
                $('.viewRenderRoot').html(data.html);
            }
        });
    }


    // Choose Table 
    function setTableName(table_id, table_name) {
        localStorage.setItem("table_id", table_id);
        localStorage.setItem("table_name", table_name);
        audioPlay();
        loadCategoryAndMenuListPos('Food');
    }

    // Get Table Name And Id 
    function getTableName() {
        document.getElementById("table_id").innerHTM = localStorage.getItem("table_id");
        document.getElementById("table_name").innerHTM = localStorage.getItem("table_name");
    }


    function audioPlay() {
        var song = new Audio();
        song.src = "{{ URL::asset('data/order_success.mp3') }}";
        song.play();
    }
</script> --}}
