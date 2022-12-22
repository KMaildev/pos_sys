// Generan Date Picker
let date = new Date();
let now = `${date.getDate()}/${date.getMonth() + 1}/${date.getFullYear()}`;
$(".date_picker").datetimepicker({
    value: now,
    format: "Y-m-d h:i A",
});