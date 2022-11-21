$('input').mousedown(function (e) {
  e.preventDefault();
  $(this).blur();
  return false;
});
var flag = false;
$(".press").bind('touchstart click', function (event) {
  if (!flag) {
    flag = true;
    setTimeout(function () {
      flag = false;
    }, 100);
    event.preventDefault();
    console.log("clicked");
    var input = $(this).attr('id');
    console.log("this: " + input);
    var existing = $("#mynumber").val();
    var result;
    if (input == "GO") {
      var form = document.getElementById("form-id");
      form.submit();
    } else if (input == "DEL") {
      result = existing.slice(0, -1);
      $("#mynumber").val(result);
      console.log("delete");
    } else {
      console.log(input);
      existing = $("#mynumber").val();
      console.log(existing);
      result = existing + input;
      $("#mynumber").val(result);
    }
  }
  return false
});