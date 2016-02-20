$(function(){
  
  $("p").on('click', "#AttachPhotos", function(evt){
    evt.preventDefault();

    $.ajax({
      dataType: 'script',
      url: '/admin/projects/show_uploads_browser',
      type: 'GET',
      data: { id: $(this).attr('data-project-id') },
      success: null
    });
  });
  
});
