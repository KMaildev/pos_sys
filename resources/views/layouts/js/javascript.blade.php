<script>
    function loadTablePos() {
        var url = '{{ url('load_table_pos') }}';
        $.ajax({
            url: url,
            method: "GET",
            success: function(data) {
                console.log(data);
                $('.viewTableListRender').html(data.html);
                $('#showTableModal').modal('show');
            }
        });
    }
    loadTablePos();
</script>
