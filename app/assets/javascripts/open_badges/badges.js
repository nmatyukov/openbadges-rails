// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready( function() {
  $("#badge_tag_list").select2({
    width: "copy",
    tokenSeparators: [",", " "],
    tags: $("#badge_tag_list").data("tags")
  });

  $("#badge_alignment_ids").select2({
    width: "copy"
  });
});