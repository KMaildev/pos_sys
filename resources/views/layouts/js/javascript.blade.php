<script>
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
</script>
