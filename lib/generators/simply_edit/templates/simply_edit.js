$(document).ready(function() {

    // Create Date picker fields
    $(".simple_edit_date_field .simply_edit_input").live("mouseover", function(){
        $(this).datepicker({ dateFormat: 'yy-mm-dd' });
    });
    // Display the editing elements and attach AJAX Functionality.
    $('.simply_edit_link').live("click", function(){
        $(this).siblings('.simply_edit_fields').show();
        $(this).hide();
    });
    $('.simply_edit_cancel').live("click", function(){
        $(this).parents(".simply_edit_fields").siblings(".simply_edit_link").show();
        $(this).parents(".simply_edit_fields").hide();
    });
    $('.simply_edit_save').live("click", function(){
        var $this = $(this);
        var $parent = $this.parents(".simply_edit");
        var $url = $(this).attr("data-href");
        var $input = $(this).parents(".simply_edit_fields").find(".simply_edit_input");

        if($input.length > 0){
            var $value = $input.val();
            var $name = $input.attr("name");
        }

        $.ajax({
            type: 'post',
            data: $name + "=" + $value +"&_method=put",
            success: function(data){
                $parent.find(".simply_edit_link").text($value);
                $parent.trigger("simply_edit:success", data);
            },
            complete: function(){
                $parent.find(".simply_edit_link").show();
                $parent.find(".simply_edit_fields").hide();
            },
            error: function(data){
                $parent.trigger("simply_edit:error", data);
            },
            url: $url
        });
    });
});