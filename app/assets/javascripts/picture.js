$( document ).on('turbolinks:load', function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
 
      reader.onload = function (e) {
        $('#avatar_picture_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
 
  $("#post_picture").change(function(){
    $('#avatar_picture_prev').removeClass('hidden');
    $('.avatar_present_picture').remove();
    readURL(this);
  });
});