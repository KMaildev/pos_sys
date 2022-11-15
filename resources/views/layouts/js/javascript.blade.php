<script>
    // Load Show Table 
    function loadTablePos() {
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
    function loadMenuListPos() {
        var url = '{{ url('load_menu_list_pos') }}';
        $.ajax({
            url: url,
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
        loadMenuListPos();
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
