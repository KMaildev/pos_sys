<button onclick="exportExcel('xlsx')" class="btn btn-success aves-effect waves-light mb-2 me-2">
    <i class="text-white fa fa-file-excel"></i> Excel
</button>
@section('script')
    <script>
        function exportExcel(type, fn, dl) {
            var today = new Date();
            var date = today.getFullYear() + '_' + (today.getMonth() + 1) + '_' + today.getDate();
            var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
            var dateTime = date + '_' + time;

            var tableId = document.getElementById('tableId');
            var wb = XLSX.utils.table_to_book(tableId, {
                sheet: "sheet1"
            });
            return dl ?
                XLSX.write(wb, {
                    bookType: type,
                    bookSST: true,
                    type: 'base64'
                }) :
                XLSX.writeFile(wb, fn || (`export_excel_${dateTime}.` + (type || 'xlsx')));
        }
    </script>
@endsection
