# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("#sortable").nestedSortable
    listType: "ul"
    items: "li"
    placeholder: "highlight"
    forcePlaceholderSize: true
    handle: "span"
    helper: "clone"
    opacity: .6
    revert: 250
    tabSize: 25
    tolerance: "pointer"
    toleranceElement: "> span"

  $("#sortable").disableSelection()
  $("#serialize").click ->
    c = set: JSON.stringify($("#sortable").nestedSortable("toHierarchy",
      startDepthCount: 0
    ))
    $.post "savesort", c, ->
      $("#output").html("<p id=\"flash_notice\">Saved Successfully</p>")
      window.location.reload(false)
